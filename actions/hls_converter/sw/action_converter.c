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
 * Example to use the FPGA to find patterns in a byte-stream.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <endian.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <libsnap.h>
#include <linux/types.h>	/* __be64 */
#include <asm/byteorder.h>

#include <snap_internal.h>
#include <snap_tools.h>
#include <action_converter.h>
#include <math.h>

static int mmio_write32(struct snap_card *card,
			uint64_t offs, uint32_t data)
{
	act_trace("  %s(%p, %llx, %x)\n", __func__, card,
		  (long long)offs, data);
	return 0;
}

static int mmio_read32(struct snap_card *card,
		       uint64_t offs, uint32_t *data)
{
	act_trace("  %s(%p, %llx, %x)\n", __func__, card,
		  (long long)offs, *data);
	return 0;
}

static int16_t conv_round(float x) {
	if (x > 0) {return (int16_t) (x+0.5); }
	else { return (int16_t) (x-0.5); }
}

void Convert_sw(uint16_t in[4096], int16_t out[NMODULES*1030*514], uint16_t moduleNumber, uint16_t packetNumber, float addr_pede[DETECTORX*DETECTORY*NMODULES*7]) {
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

/* Main program of the software action */
static int action_main(struct snap_sim_action *action,
		       void *job, unsigned int job_len)
{
	struct converter_job *js = (struct converter_job *)job;
	/* No error checking ... */
	act_trace("%s(%p, %p, %d) jobsize %ld bytes\n",
		  __func__, action, job, job_len, sizeof(*js));

	size_t size_matrix = DETECTORX*DETECTORY*NMODULES;
	float *addr_pede;
	uint16_t *addr_datain;
	int16_t *addr_dataout;
	addr_pede = (float *)(unsigned long)js->GainPede.addr;
	addr_datain = (uint16_t *)(unsigned long)js->RawIn.addr;
	addr_dataout = (int16_t *)(unsigned long)js->ConvOut.addr;

	for (unsigned int i = 0; i < NFRAMES; i++) {
		for (uint16_t j = 0; j < size_matrix/4096; j++) {
			Convert_sw(&(addr_datain[4096*j+i*size_matrix]), &(addr_dataout[NMODULES*1030*514*i]), 0, j, addr_pede);
		}
	}

	// update the return code to the SNAP job manager
	action->job.retc = SNAP_RETC_SUCCESS;
	return 0;
}

/* This is the switch call when software action is called */
/* NO CHANGE TO BE APPLIED BELOW OTHER THAN ADAPTING THE ACTION_TYPE NAME */
static struct snap_sim_action action = {
	.vendor_id = SNAP_VENDOR_ID_ANY,
	.device_id = SNAP_DEVICE_ID_ANY,
	.action_type = CONVERTER_ACTION_TYPE, // Adapt with your ACTION NAME

	.job = { .retc = SNAP_RETC_FAILURE, },
	.state = ACTION_IDLE,
	.main = action_main,
	.priv_data = NULL,	/* this is passed back as void *card */
	.mmio_write32 = mmio_write32,
	.mmio_read32 = mmio_read32,

	.next = NULL,
};

static void _init(void) __attribute__((constructor));

static void _init(void)
{
	snap_action_register(&action);
}
