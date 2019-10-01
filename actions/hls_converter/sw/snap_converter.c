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

/**
 * SNAP HelloWorld Example
 *
 * Demonstration how to get data into the FPGA, process it using a SNAP
 * action and move the data out of the FPGA back to host-DRAM.
 */

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <getopt.h>
#include <malloc.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <assert.h>

#include <snap_tools.h>
#include <libsnap.h>
#include <action_converter.h>
#include <snap_hls_if.h>

int verbose_flag = 0;

static const char *version = GIT_VERSION;

static const char *mem_tab[] = { "HOST_DRAM", "CARD_DRAM", "TYPE_NVME" };

/**
 * @brief	prints valid command line options
 *
 * @param prog	current program's name
 */
static void usage(const char *prog)
{
	printf("Usage: %s [-h] [-v, --verbose] [-V, --version]\n"
	"  -C, --card <cardno>       can be (0...3)\n"
	"  -t, --timeout             timeout in sec to wait for done.\n"
	"  -X, --verify              verify result if possible\n"
	"  -N, --no-irq              disable Interrupts\n"
	"  -b, --binary_dir <dir>    Input Binary file for pre-defined matrix"
	"\n"
	"echo \"Hello world. This is my first CAPI SNAP experience. It's real fun\""
	" > /tmp/t1\n"
	"SNAP_CONFIG=CPU  snap_converter -b <bin_dir>\n"
	"\n",
        prog);
}

// Function that fills the MMIO registers / data structure 
// these are all data exchanged between the application and the action
static void snap_prepare_converter(struct snap_job *cjob,
				 struct converter_job *mjob,
				 uint8_t type_in,
				 uint8_t type_out,
				 void *addr_GainPede, size_t size_GainPede,
				 void *addr_datain, size_t size_datain,
				 void *addr_dataout, size_t size_dataout)
{
	fprintf(stderr, "  prepare converter job of %ld bytes size\n", sizeof(*mjob));

	assert(sizeof(*mjob) <= SNAP_JOBSIZE);
	memset(mjob, 0, sizeof(*mjob));

	snap_addr_set(&mjob->GainPede, addr_GainPede, size_GainPede*sizeof(float), type_in,
		      SNAP_ADDRFLAG_ADDR | SNAP_ADDRFLAG_SRC |SNAP_ADDRFLAG_END);

	snap_addr_set(&mjob->RawIn, addr_datain, size_datain*sizeof(uint16_t), type_in,
		      SNAP_ADDRFLAG_ADDR | SNAP_ADDRFLAG_SRC |SNAP_ADDRFLAG_END);

	snap_addr_set(&mjob->ConvOut, addr_dataout, size_dataout*sizeof(int16_t), type_out,
		      SNAP_ADDRFLAG_ADDR | SNAP_ADDRFLAG_DST |SNAP_ADDRFLAG_END);

	snap_job_set(cjob, mjob, sizeof(*mjob), NULL, 0);
}

void memset_volatile(volatile void *s, char c, size_t n)
{
    volatile char *p = s;
    while (n-- > 0) {
        *p++ = c;
    }
}

int main(int argc, char *argv[])
{
	// Init of all the default values used 
	int ch, rc = 0;
	int card_no = 0;
	struct snap_card *card = NULL;
	struct snap_action *action = NULL;
	char device[128];
	struct snap_job cjob;
	struct converter_job mjob;
	const char *bin_dir = NULL;
	const char *bin_ext[7] = {"/gainG0.bin", "/gainG1.bin", "/gainG2.bin", "/pedeG0.bin", "/pedeG1.bin", "/pedeG2.bin", "/pedeG0_RMS.bin"};
	unsigned long timeout = 600;
	struct timeval etime, stime;
	size_t size_matrix = DETECTORX*DETECTORY*NMODULES;
	size_t sizeout_matrix = NMODULES*1030*514;
	uint8_t *ibuff = NULL, *obuff = NULL;
	float *GainPedeMatrix = NULL;
	uint16_t *data_in = NULL;
	int16_t *data_out = NULL, *golden_in = NULL;
	uint8_t type_in = SNAP_ADDRTYPE_HOST_DRAM;
	uint8_t type_out = SNAP_ADDRTYPE_HOST_DRAM;
	uint64_t addr_GainPede = 0x0ull, addr_datain = 0x0ull, addr_dataout = 0x0ull;
	int verify = 0;
	int err = 0;
	int exit_code = EXIT_SUCCESS;
	// default is interrupt mode enabled (vs polling)
	snap_action_flag_t action_irq = (SNAP_ACTION_DONE_IRQ | SNAP_ATTACH_IRQ);

	// collecting the command line arguments
	while (1) {
		int option_index = 0;
		static struct option long_options[] = {
			{ "card",	 required_argument, NULL, 'C' },
			{ "binary_dir",	 required_argument, NULL, 'b' },
			{ "timeout",	 required_argument, NULL, 't' },
			{ "verify",	 no_argument,	    NULL, 'X' },
			{ "no-irq",	 no_argument,	    NULL, 'N' },
			{ "version",	 no_argument,	    NULL, 'V' },
			{ "verbose",	 no_argument,	    NULL, 'v' },
			{ "help",	 no_argument,	    NULL, 'h' },
			{ 0,		 no_argument,	    NULL, 0   },
		};

		ch = getopt_long(argc, argv,
                                 "C:i:b:o:A:a:D:d:s:t:XNVvh",
				 long_options, &option_index);
		if (ch == -1)
			break;

		switch (ch) {
		case 'C':
			card_no = strtol(optarg, (char **)NULL, 0);
			break;
		case 'b':
			bin_dir = optarg;
			break;  
                case 't':
                        timeout = strtol(optarg, (char **)NULL, 0);
                        break;		
                case 'X':
			verify++;
			break;
                case 'N':
                        action_irq = 0;
                        break;
			/* service */
		case 'V':
			printf("%s\n", version);
			exit(EXIT_SUCCESS);
		case 'v':
			verbose_flag = 1;
			break;
		case 'h':
			usage(argv[0]);
			exit(EXIT_SUCCESS);
			break;
		default:
			usage(argv[0]);
			exit(EXIT_FAILURE);
		}
	}

	if (optind != argc) {
		usage(argv[0]);
		exit(EXIT_FAILURE);
	}
	if (argc == 1) {       // to provide help when program is called without argument
          usage(argv[0]);
          exit(EXIT_FAILURE);
        }

	GainPedeMatrix = snap_malloc(size_matrix*7*sizeof(float));	
	memset_volatile(GainPedeMatrix, 0x0, size_matrix*7*sizeof(float));
	addr_GainPede = (unsigned long)GainPedeMatrix;
	
	printf("Start processing pede&gain matrix file:\n");
	for (int cnt = 0; cnt < 7; cnt++) {
		FILE *ptr;
		char *bin_file = malloc(strlen(bin_dir)+strlen(bin_ext[cnt]));
		strcpy(bin_file, bin_dir);
		strcat(bin_file, bin_ext[cnt]);
		printf("\t==> Processing file: %s\n", bin_file);
		ptr = fopen(bin_file,"rb");
		assert(ptr);
		fread((void *)&GainPedeMatrix[cnt*size_matrix],sizeof(float),size_matrix,ptr);
	}

	printf("Start processing Image input&Golden file:\n");
	data_in = snap_malloc(size_matrix*NFRAMES*sizeof(uint16_t));	
	data_out = snap_malloc(sizeout_matrix*NFRAMES*sizeof(int16_t));
	golden_in = snap_malloc(sizeout_matrix*NFRAMES*sizeof(int16_t));
	memset_volatile(data_in, 0x0, size_matrix*NFRAMES*sizeof(uint16_t));
	memset_volatile(data_out, 0x0, sizeout_matrix*NFRAMES*sizeof(int16_t));
	memset_volatile(golden_in, 0x0, sizeout_matrix*NFRAMES*sizeof(int16_t));
	
	addr_datain = (unsigned long)data_in;
	addr_dataout = (unsigned long)data_out;

	for (int cnt = 0; cnt < NFRAMES; cnt++) {
		FILE *ptr;
		char cnt_str[10];
		sprintf(cnt_str, "%d", cnt);
		char *bin_file = malloc(strlen(bin_dir)+strlen("/raw")+strlen(cnt_str)+strlen(".bin")+1);
		strcpy(bin_file, bin_dir);
		strcat(bin_file, "/raw");
		strcat(bin_file, cnt_str);
		strcat(bin_file, ".bin");
		printf("\t==> Processing file: %s\n", bin_file);
		ptr = fopen(bin_file,"rb");
		assert(ptr);
		fread((void *)&data_in[cnt*size_matrix],sizeof(uint16_t),size_matrix,ptr);
	}

	for (int cnt = 0; cnt < NFRAMES; cnt++) {
		FILE *ptr;
		char cnt_str[10];
		sprintf(cnt_str, "%d", cnt);
		char *bin_file = malloc(strlen(bin_dir)+strlen("/conv")+strlen(cnt_str)+strlen(".bin")+1);
		strcpy(bin_file, bin_dir);
		strcat(bin_file, "/conv");
		strcat(bin_file, cnt_str);
		strcat(bin_file, ".bin");
		printf("\t==> Processing file: %s\n", bin_file);
		ptr = fopen(bin_file,"rb");
		assert(ptr);
		fread((void *)&golden_in[cnt*sizeout_matrix],sizeof(int16_t),sizeout_matrix,ptr);
	}

	/* Display the parameters that will be used for the example */
	printf("PARAMETERS:\n"
	       "  type_in:     %x %s\n"
	       "  type_out:    %x %s\n"
	       "  addr_GainPede: %016llx\n"
	       "  addr_datain: %016llx\n"
	       "  addr_dataout: %016llx\n",
	       type_in, mem_tab[type_in], type_out, mem_tab[type_out], (long long)addr_GainPede, (long long)addr_datain, (long long)addr_dataout);


	// Allocate the card that will be used
	snprintf(device, sizeof(device)-1, "/dev/cxl/afu%d.0s", card_no);
	card = snap_card_alloc_dev(device, SNAP_VENDOR_ID_IBM,
				   SNAP_DEVICE_ID_SNAP);
	if (card == NULL) {
		fprintf(stderr, "err: failed to open card %u: %s\n",
			card_no, strerror(errno));
                fprintf(stderr, "Default mode is FPGA mode.\n");
                fprintf(stderr, "Did you want to run CPU mode ? => add SNAP_CONFIG=CPU before your command.\n");
                fprintf(stderr, "Otherwise make sure you ran snap_find_card and snap_maint for your selected card.\n");
		goto out_error;
	}

	// Attach the action that will be used on the allocated card
	action = snap_attach_action(card, CONVERTER_ACTION_TYPE, action_irq, 60);
	if (action == NULL) {
		fprintf(stderr, "err: failed to attach action %u: %s\n",
			card_no, strerror(errno));
		goto out_error1;
	}

	// Fill the stucture of data exchanged with the action
	snap_prepare_converter(&cjob, &mjob,
			     type_in, type_out,
			     (void *)addr_GainPede, size_matrix*7,
			     (void *)addr_datain, size_matrix*NFRAMES,
			     (void *)addr_dataout, sizeout_matrix*NFRAMES);

	// uncomment to dump the job structure
	//__hexdump(stderr, &mjob, sizeof(mjob));


	// Collect the timestamp BEFORE the call of the action
	gettimeofday(&stime, NULL);

	// Call the action will:
	//    write all the registers to the action (MMIO) 
	//  + start the action 
	//  + wait for completion
	//  + read all the registers from the action (MMIO) 
	rc = snap_action_sync_execute_job(action, &cjob, timeout);

	// Collect the timestamp AFTER the call of the action
	gettimeofday(&etime, NULL);
	if (rc != 0) {
		fprintf(stderr, "err: job execution %d: %s!\n", rc,
			strerror(errno));
		goto out_error2;
	}
	
	printf("Received output data from FPGA, start comparing with golden file:\n");
	for (int cnt=0; cnt< (int)(sizeout_matrix*NFRAMES); cnt++) {
		if (data_out[cnt] != golden_in[cnt]) { err++;}
	}

	if (err == 0) {
		printf("\t==> Output data matching Golden data!! SUCESSS!!\n");
	} else {
		printf("\t==> Overall %d miscompares! With total count of %d\n",err,(int)(sizeout_matrix*NFRAMES));
		for (int cnt=0; cnt< (int)(sizeout_matrix*NFRAMES); cnt++) {
			if (data_out[cnt] != golden_in[cnt]) { 
				printf("\t==> Miscompare found. Data_out is %d, golden_in is %d, entry is %d\n",data_out[cnt],golden_in[cnt],cnt);
				break;
			}
		}
	}
	
	printf("DataOut for first three is: %d\t%d\t%d\t%d\n", data_out[0],data_out[1],data_out[2],data_out[3]);

	// Display the time of the action call (MMIO registers filled + execution)
	fprintf(stdout, "SNAP converter took %lld usec\n",
		(long long)timediff_usec(&etime, &stime));

	// Detach action + disallocate the card
	snap_detach_action(action);
	snap_card_free(card);

	__free(obuff);
	__free(ibuff);
	__free(GainPedeMatrix);
	__free(data_in);
	__free(data_out);
	__free(golden_in);
	exit(exit_code);

 out_error2:
	snap_detach_action(action);
 out_error1:
	snap_card_free(card);
 out_error:
	__free(obuff);
	__free(ibuff);
	__free(GainPedeMatrix);
	__free(data_in);
	__free(data_out);
	__free(golden_in);
	exit(EXIT_FAILURE);
}
