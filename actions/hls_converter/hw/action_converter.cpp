/*
 * Copyright 2017 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * SNAP HLS_HELLOWORLD EXAMPLE
 *
 * Tasks for the user:
 *   1. Explore HLS pragmas to get better timing behavior.
 *   2. Try to measure the time needed to do data transfers (advanced)
 */

#include <string.h>
#include "ap_int.h"
#include "action_converter.H"
#include "math.h"

static int16_t conv_round(float x) {
	if (x > 0) {return (int16_t) (x+0.5); }
	else { return (int16_t) (x-0.5); }
}

void Convert(uint16_t in[4096], int16_t out[NMODULES*1030*514], uint16_t moduleNumber, uint16_t packetNumber, float addr_pede[DETECTORX*DETECTORY*NMODULES*7]) {
   int i;
   uint32_t out_addr1 = moduleNumber * DETECTORX * DETECTORY;            // Account for correct module
   uint32_t pixel0 = moduleNumber * DETECTORX * DETECTORY + packetNumber * 4096; 

   size_t size_matrix = DETECTORX*DETECTORY*NMODULES;
   /*
   float *gainG0 = &addr_pede[0];
   float *gainG1 = &addr_pede[0+size_matrix];
   float *gainG2 = &addr_pede[0+size_matrix*2];
   float *pedeG0 = &addr_pede[0+size_matrix*3];
   float *pedeG1 = &addr_pede[0+size_matrix*4];
   float *pedeG2 = &addr_pede[0+size_matrix*5];
   float *pedeRMS = &addr_pede[0+size_matrix*6];
   */
    // For each pixel in the exposure
    for (i = 0; i < 4096; i ++) {
        uint16_t gain_level = in[i] & 0xc000; // take first two bits
        uint16_t adc        = in[i] & 0x3fff; // take 14-remaining bits
        float adcfloat      = adc;          // convert to float

        uint32_t out_addr2 = packetNumber * 4096 + i;   // Account for correct packet inside module

        // Correct for multi-pixels (pixels on chip boundary have double size)
        uint32_t col  = out_addr2 % DETECTORX;
        uint32_t line = out_addr2 / DETECTORX;

        if (line > 255)  out_addr2 += 2 * 1030;

        out_addr2 += 2 * (col / 256);
        uint32_t out_addr = out_addr1 + out_addr2;
        // Use proper constants for the particular gain
        switch (gain_level) {
            // G0: 00
            case 0: 
              if (fabs(adcfloat-addr_pede[size_matrix*3 + pixel0+i]) < 2 * addr_pede[size_matrix*6 + pixel0+i])
                  addr_pede[size_matrix*3 + pixel0+i] = (99 * addr_pede[size_matrix*3 + pixel0 + i] + adcfloat) / 100.0;
              out[out_addr] = conv_round((adcfloat - addr_pede[size_matrix*3 + pixel0 + i]) * addr_pede[pixel0 + i]);
              break;
            // G1: 01
            case 0x4000: 
              out[out_addr] = conv_round((adcfloat - addr_pede[size_matrix*4 +pixel0 + i]) * addr_pede[size_matrix + pixel0 + i]);
              break;
            // G2: 11
            case 0xc000: 
              out[out_addr] = conv_round((adcfloat - addr_pede[size_matrix*5 + pixel0 + i]) * addr_pede[size_matrix*2 + pixel0 + i]);
              if (adc == 0x0000) out[out_addr] = INT16_MAX; // Wrong value
              if (adc == 0x3fff) out[out_addr] = INT16_MAX; // Saturated pixel
              break;
        }
    }
}

static snap_membus_t int16_to_mbus(int16_t *text)
{
        snap_membus_t mem = 0;

 loop_int16_to_mbus:
        for (int k = NB_DW_PER_INT-1; k >= 0; k--) {
#pragma HLS UNROLL 	// less latency than a pipeline
                mem = mem << 16;
                mem(15, 0) = (int16_t) text[k];
        }
        return mem;
}

static void mbus_to_uint16(snap_membus_t *data_read, uint16_t *table_uint16_in)
{
	loop_m2d1: for(int i = 0; i < NB_DW_PER_UINT; i++)
#pragma HLS PIPELINE
		table_uint16_in[i] = (uint64_t)data_read[0]((8*sizeof(uint16_t)*(i+1))-1, (8*sizeof(uint16_t)*i));
}

//----------------------------------------------------------------------
//--- MAIN PROGRAM -----------------------------------------------------
//----------------------------------------------------------------------
static int process_action(snap_membus_t *din_gmem,
	      snap_membus_t *dout_gmem,
	      /* snap_membus_t *d_ddrmem, *//* not needed */
	      action_reg *act_reg)
{
	uint64_t size_matrix = DETECTORX*DETECTORY*NMODULES;
	uint64_t sizeout_matrix = NMODULES*1030*514;
	uint64_t addr_pede_idx, addr_datain_idx, addr_dataout_idx, addr_dataout_post_addr;
	addr_pede_idx = act_reg->Data.GainPede.addr >> ADDR_RIGHT_SHIFT;
	addr_datain_idx = act_reg->Data.RawIn.addr >> ADDR_RIGHT_SHIFT;
	addr_dataout_idx = act_reg->Data.ConvOut.addr >> ADDR_RIGHT_SHIFT;
	
//	float PedeGain[DETECTORX*DETECTORY*NMODULES*7] = {0};
	uint16_t DataIn[RAWINSIZE] = {0};
	int16_t DataOut[CONVOUTSIZE] = {0};

	uint32_t size_to_transfer, bytes_to_transfer;
	snap_membus_t DataInBuf[1], DataOutBuf[1];
	int Datacnt = 0;


/*
	//memcpy((float*)PedeGain, din_gmem + addr_pede_idx, size_matrix*7*sizeof(float));
	uint32_t action_xfer_size;
	uint32_t xfer_size;
	uint32_t nb_blocks_to_xfer;
	snapu64_t address_xfer_offset = 0x0;
	action_xfer_size = size_matrix*7*sizeof(float);
	int size_in_words;
	if(action_xfer_size %MAX_NB_OF_BYTES_READ == 0)
		nb_blocks_to_xfer = (action_xfer_size / MAX_NB_OF_BYTES_READ);
	else
		nb_blocks_to_xfer = (action_xfer_size / MAX_NB_OF_BYTES_READ) + 1;
	for (int i = 0; i < nb_blocks_to_xfer; i++ ) {
		xfer_size = MIN(action_xfer_size,(snapu32_t)MAX_NB_OF_BYTES_READ);
		if(xfer_size % BPERDW == 0)
			size_in_words = xfer_size/BPERDW;
		else
			size_in_words = (xfer_size/BPERDW) + 1;
		memcpy(&PedeGain[(int)(address_xfer_offset/sizeof(float))], din_gmem + addr_pede_idx + address_xfer_offset, size_in_words);
		action_xfer_size -= xfer_size;
		address_xfer_offset += (snapu64_t)(xfer_size >> ADDR_RIGHT_SHIFT);
	}
*/

	//memcpy((uint16_t*)DataIn, din_gmem + addr_datain_idx, size_matrix*NFRAMES*sizeof(uint16_t));
	/*Datacnt = 0;
	size_to_transfer = size_matrix*NFRAMES*sizeof(uint16_t);
	while (size_to_transfer > 0) {
		bytes_to_transfer = MIN(size_to_transfer, BPERDW);
		memcpy(DataInBuf, din_gmem + addr_datain_idx, BPERDW);
		mbus_to_uint16(&DataIn[Datacnt], DataInBuf);
		Datacnt += NB_DW_PER_UINT;
		size_to_transfer -= bytes_to_transfer;
		addr_dataout_idx += bytes_to_transfer;
	}*/
/*
	// Processing converter function
	for (unsigned int i = 0; i < NFRAMES; i++) {
		for (uint16_t j = 0; j < size_matrix/4096; j++) {
			Convert(&(DataIn[4096*j+i*size_matrix]), &(DataOut[NMODULES*1030*514*i]), 0, j, PedeGain);
		}
	}
*/
/*
	for (int cnt=0; cnt< sizeout_matrix*NFRAMES*sizeof(uint16_t); cnt ++) {
		if (cnt < size_matrix*NFRAMES*sizeof(int16_t)) {DataOut[cnt]=DataIn[cnt];}
		else {DataOut[cnt]=0;}
	}
*/

	uint32_t out_init_addr, out_addr, col, line;

	for (int i = 0; i < NFRAMES; i++) {
		for (int j = 0; j < size_matrix/RAWINSIZE; j++) {
			// Read-in DataIn
			Datacnt = 0;
			size_to_transfer = RAWINSIZE*sizeof(uint16_t);
			while (size_to_transfer > 0) {
				// Limit the number of bytes to process to a 64B word 
				bytes_to_transfer = MIN(size_to_transfer, BPERDW);
				memcpy(DataInBuf, din_gmem + addr_datain_idx, bytes_to_transfer);
				mbus_to_uint16(&DataInBuf[0], &DataIn[Datacnt]);
				Datacnt += NB_DW_PER_INT;
				size_to_transfer -= bytes_to_transfer;
				addr_datain_idx += bytes_to_transfer;
			}
			//Set DataOut to all zeros
			for (int k = 0; k < CONVOUTSIZE; k++) {
				DataOut[CONVOUTSIZE] = 0;
			}	
			//Convert(&(DataIn[4096*j+i*size_matrix]), &(DataOut[NMODULES*1030*514*i]), 0, j, PedeGain);
			for (int k = 0; k < RAWINSIZE; k++) {
        			out_addr = j * RAWINSIZE + k;   // Account for correct packet inside module
        			col  = out_addr % DETECTORX;
        			line = out_addr / DETECTORX;
        			if (line > 255)  out_addr += 2 * 1030;
        			out_addr += 2 * (col / 256);
				out_addr -= j * RAWINSIZE;
				//Later swap to converter function
				DataOut[out_addr] = (int16_t)DataIn[k];
			}
			// Write DataOut
			addr_dataout_post_addr = addr_dataout_idx + j*RAWINSIZE*sizeof(uint16_t) + i*size_matrix*sizeof(uint16_t);
			Datacnt = 0;
			size_to_transfer = CONVOUTSIZE*sizeof(int16_t);
			while (size_to_transfer > 0) {
				// Limit the number of bytes to process to a 64B word 
				bytes_to_transfer = MIN(size_to_transfer, BPERDW);
				DataOutBuf[0] = int16_to_mbus(&DataOut[Datacnt]);
				// Write out one word_t 
				memcpy(dout_gmem + addr_dataout_post_addr, DataOutBuf, bytes_to_transfer);
				Datacnt += NB_DW_PER_INT;
				size_to_transfer -= bytes_to_transfer;
				addr_dataout_post_addr += bytes_to_transfer;
			}
		}
	}

	act_reg->Control.Retc = SNAP_RETC_SUCCESS;
	return 0;
}

//--- TOP LEVEL MODULE -------------------------------------------------
void hls_action(snap_membus_t *din_gmem,
	snap_membus_t *dout_gmem,
	/* snap_membus_t *d_ddrmem, // CAN BE COMMENTED IF UNUSED */
	action_reg *act_reg,
	action_RO_config_reg *Action_Config)
{
    // Host Memory AXI Interface - CANNOT BE REMOVED - NO CHANGE BELOW
#pragma HLS INTERFACE m_axi port=din_gmem bundle=host_mem offset=slave depth=512 \
  max_read_burst_length=64  max_write_burst_length=64
#pragma HLS INTERFACE s_axilite port=din_gmem bundle=ctrl_reg offset=0x030

#pragma HLS INTERFACE m_axi port=dout_gmem bundle=host_mem offset=slave depth=512 \
  max_read_burst_length=64  max_write_burst_length=64
#pragma HLS INTERFACE s_axilite port=dout_gmem bundle=ctrl_reg offset=0x040

/*  // DDR memory Interface - CAN BE COMMENTED IF UNUSED
 * #pragma HLS INTERFACE m_axi port=d_ddrmem bundle=card_mem0 offset=slave depth=512 \
 *   max_read_burst_length=64  max_write_burst_length=64
 * #pragma HLS INTERFACE s_axilite port=d_ddrmem bundle=ctrl_reg offset=0x050
 */
    // Host Memory AXI Lite Master Interface - NO CHANGE BELOW
#pragma HLS DATA_PACK variable=Action_Config
#pragma HLS INTERFACE s_axilite port=Action_Config bundle=ctrl_reg offset=0x010
#pragma HLS DATA_PACK variable=act_reg
#pragma HLS INTERFACE s_axilite port=act_reg bundle=ctrl_reg offset=0x100
#pragma HLS INTERFACE s_axilite port=return bundle=ctrl_reg

    /* Required Action Type Detection - NO CHANGE BELOW */
    //	NOTE: switch generates better vhdl than "if" */
    // Test used to exit the action if no parameter has been set.
    // Used for the discovery phase of the cards */
    switch (act_reg->Control.flags) {
    case 0:
	Action_Config->action_type = CONVERTER_ACTION_TYPE; //TO BE ADAPTED
	Action_Config->release_level = RELEASE_LEVEL;
	act_reg->Control.Retc = 0xe00f;
	return;
	break;
    default:
	    /* process_action(din_gmem, dout_gmem, d_ddrmem, act_reg); */
	    process_action(din_gmem, dout_gmem, act_reg);
	break;
    }
}

//-----------------------------------------------------------------------------
//-- TESTBENCH BELOW IS USED ONLY TO DEBUG THE HARDWARE ACTION WITH HLS TOOL --
//-----------------------------------------------------------------------------

#ifdef NO_SYNTH

int main(void)
{
#define MEMORY_LINES 1
    int rc = 0;
    unsigned int i;
    static snap_membus_t  din_gmem[MEMORY_LINES];
    static snap_membus_t  dout_gmem[MEMORY_LINES];

    //snap_membus_t  dout_gmem[2048];
    //snap_membus_t  d_ddrmem[2048];
    action_reg act_reg;
    action_RO_config_reg Action_Config;

    // Discovery Phase .....
    // when flags = 0 then action will just return action type and release
    act_reg.Control.flags = 0x0;
    printf("Discovery : calling action to get config data\n");
    hls_action(din_gmem, dout_gmem, &act_reg, &Action_Config);
    fprintf(stderr,
	"ACTION_TYPE:	%08x\n"
	"RELEASE_LEVEL: %08x\n"
	"RETC:		%04x\n",
	(unsigned int)Action_Config.action_type,
	(unsigned int)Action_Config.release_level,
	(unsigned int)act_reg.Control.Retc);

    // Processing Phase .....
    // Fill the memory with 'c' characters
    memset(din_gmem,  'c', sizeof(din_gmem[0]));
    printf("Input is : %s\n", (char *)((unsigned long)din_gmem + 0));

    // set flags != 0 to have action processed
    act_reg.Control.flags = 0x1; /* just not 0x0 */

    act_reg.Data.RawIn.addr = 0;
    act_reg.Data.RawIn.size = DETECTORX*DETECTORY*NMODULES*NFRAMES*NMODULES;
    act_reg.Data.RawIn.type = SNAP_ADDRTYPE_HOST_DRAM;

    act_reg.Data.ConvOut.addr = 0;
    act_reg.Data.ConvOut.size = DETECTOROX*DETECTOROY*NMODULES*NFRAMES*NMODULES;
    act_reg.Data.ConvOut.type = SNAP_ADDRTYPE_HOST_DRAM;

    printf("Action call \n");
    hls_action(din_gmem, dout_gmem, &act_reg, &Action_Config);
    if (act_reg.Control.Retc == SNAP_RETC_FAILURE) {
	fprintf(stderr, " ==> RETURN CODE FAILURE <==\n");
	return 1;
    }

    printf("Output is : %s\n", (char *)((unsigned long)dout_gmem + 0));

    printf(">> ACTION TYPE = %08lx - RELEASE_LEVEL = %08lx <<\n",
		    (unsigned int)Action_Config.action_type,
		    (unsigned int)Action_Config.release_level);
    return 0;
}

#endif
