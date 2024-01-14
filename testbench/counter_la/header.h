#ifndef __HEADER_H__
#define __HEADER_H__
#define INPUTDATA __attribute__((section(".inputdata")))
#define OUTPUTDATA __attribute__((section(".outputdata")))

//fir
#define N  11
#define M  64
int data_length = 64;
int taps[N] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int reg_fir_y;

volatile INPUTDATA int inputsignal[M];
volatile OUTPUTDATA int outputsignal[M];

#define write(address,data) (*(volatile int32_t*) address) = data
#define read(address) (*(volatile int32_t*) address)
#define ap_control_address  0x30000000
#define data_length_address 0x30000010
#define tap_base            0x30000020
#define input_address       0x30000080
#define output_address      0x30000084

/*
#define ap_control  (*(volatile uint32_t*) 0x30000000)
#define data_length (*(volatile uint32_t*) 0x30000010) 
#define tap0        (*(volatile uint32_t*) 0x30000020) 
#define tap1        (*(volatile uint32_t*) 0x30000024) 
#define tap2        (*(volatile uint32_t*) 0x30000028) 
#define tap3        (*(volatile uint32_t*) 0x3000002c) 
#define tap4        (*(volatile uint32_t*) 0x30000030) 
#define tap5        (*(volatile uint32_t*) 0x30000034) 
#define tap6        (*(volatile uint32_t*) 0x30000038) 
#define tap7        (*(volatile uint32_t*) 0x3000003c) 
#define tap8        (*(volatile uint32_t*) 0x30000040) 
#define tap9        (*(volatile uint32_t*) 0x30000044) 
#define tap10       (*(volatile uint32_t*) 0x30000048) 
#define input       (*(volatile uint32_t*) 0x30000080) 
#define output      (*(volatile uint32_t*) 0x30000084) 
*/

//matmul
#define SIZE_mat 4
	int A[SIZE_mat*SIZE_mat] = {0, 1, 2, 3,
			0, 1, 2, 3,
			0, 1, 2, 3,
			0, 1, 2, 3,
	};
	int B[SIZE_mat*SIZE_mat] = {1, 2, 3, 4,
		5, 6, 7, 8,
		9, 10, 11, 12,
		13, 14, 15, 16,
	};
	int result[SIZE_mat*SIZE_mat];

//qsort
#define SIZE_qsort 10
int C[SIZE_qsort] = {893, 40, 3233, 4267, 2669, 2541, 9073, 6023, 5681, 4622};

int endflag = 1;
#endif
