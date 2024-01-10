#ifndef __HEADER_H__
#define __HEADER_H__

//fir
#define N 11
int taps[N] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int inputbuffer[N];
int inputsignal[N] = {1,2,3,4,5,6,7,8,9,10,11};
int outputsignal[N];

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
