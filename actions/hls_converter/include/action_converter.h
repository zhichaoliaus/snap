#ifndef __ACTION_CONVERTER_H__
#define __ACTION_CONVERTER_H__

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

#include <snap_types.h>

#ifdef __cplusplus
extern "C" {
#endif

/* This number is unique and is declared in ~snap/ActionTypes.md */
#define CONVERTER_ACTION_TYPE 0x10141010

// single detector module is 1024 x 512 (~500,000 pixels)
#define DETECTORX 1024
#define DETECTORY 512
#define DETECTOROX 1030
#define DETECTOROY 514

// 500k detector consists of 1 module, 4M detector consists of 8 modules, 10M of 20 modules
#define NMODULES 1
#define NFRAMES 1

/* Data structure used to exchange information between action and application */
/* Size limit is 108 Bytes */
typedef struct converter_job {
	struct snap_addr GainPede;
	struct snap_addr RawIn;
	struct snap_addr ConvOut;
} converter_job_t;

void memset_volatile(volatile void *s, char c, size_t n);
void Convert(uint16_t in[4096], int16_t out[NMODULES*1030*514], uint16_t moduleNumber, uint16_t packetNumber, float addr_pede[DETECTORX*DETECTORY*NMODULES*7]);

#ifdef __cplusplus
}
#endif

#endif	/* __ACTION_CHANGECASE_H__ */
