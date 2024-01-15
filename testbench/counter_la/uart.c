#include <defs.h>
#include <user_uart.h>
#include <irq_vex.h>
#include "header.h"

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_end()
{
    endflag = 1;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write(int n)
{
    while(((reg_uart_stat>>3) & 1));
    reg_tx_data = n;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write_char(char c)
{
	if (c == '\n')
		uart_write_char('\r');

    // wait until tx_full = 0
    while(((reg_uart_stat>>3) & 1));
    reg_tx_data = c;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write_string(const char *s)
{
    while (*s)
        uart_write_char(*(s++));
}


char __attribute__ ( ( section ( ".mprj" ) ) ) uart_read_char()
{
	char num;
    if((((reg_uart_stat>>5) | 0) == 0) && (((reg_uart_stat>>4) | 0) == 0)){
        for(int i = 0; i < 1; i++)
            asm volatile ("nop");

        num = reg_rx_data;
    }

    return num;
}

int __attribute__ ( ( section ( ".mprj" ) ) ) uart_read()
{
    int num;
    if((((reg_uart_stat>>5) | 0) == 0) && (((reg_uart_stat>>4) | 0) == 0)){
        for(int i = 0; i < 1; i++)
            asm volatile ("nop");

        num = reg_rx_data;
    }
	(*(volatile uint32_t*)0x2600000c) = num << 16;

    return num;
}

//fir=====================================================
void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial your fir
	write(data_length_address,data_length);
	for(int register i=0;i<N;i=i+1){
		write((tap_base+4*i),taps[i]);
	}
	// reg_fir_x = 0;
	// reg_fir_y = 0;
	// outputbuffer[0] = 0;
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) preparedata() {
	//initial your fir
	for(int register i=0;i<M;i=i+1){
		inputsignal[i] = i;
	}

}
void __attribute__ ( ( section ( ".mprjram" ) ) ) start() {
	//check ap_idle = 1(bit[2] = 1), ap_start = 1;
	while(1){
		if (((read(ap_control_address) & (1<<2)) == 0x00000004)){
			write((ap_control_address),((read(ap_control_address) | 1)));
			break;
		}
	}
}

int __attribute__ ( ( section ( ".mprjram" ) ) ) input(int indata) {
	//check fir ready to receive data (bit[4] = 1), then write data;
//	while(1){
//		if (read(ap_control_address) & (1<<4) == 0x00000010){
			write(input_address,indata);
//			break;
//		}
//	}
}

int __attribute__ ( ( section ( ".mprjram" ) ) ) output() {
	//check fir is valid for output data (bit[5] = 1), then read data;
//	while(1){
//		if (read(ap_control_address) & (1<<5) == 0x00000020){
			reg_fir_y = read(output_address);
			return reg_fir_y;
//			break;
//		}
//	}
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();
	//preparedata();
	start();
	for(int register i=0;i<M;i=i+1){

		input(inputsignal[i]);

		outputsignal[i] = output();
	}
		return outputsignal;
	}

//matmul=====================================================
int* __attribute__ ( ( section ( ".mprjram" ) ) ) matmul()
{
	int i=0;
	int j;
	int k;
	int sum;
	int kk;
	unsigned int count = 0;
	for (i=0; i<SIZE_mat; i++){
		for (j=0; j<SIZE_mat; j++){
			sum = 0;
			for(k = 0;k<SIZE_mat;k++)
				sum += A[(i*SIZE_mat) + k] * B[(k*SIZE_mat) + j];
			result[(i*SIZE_mat) + j] = sum;
		}
	}
	return result;
}

//qsort=====================================================
int __attribute__ ( ( section ( ".mprjram" ) ) ) partition(int low,int hi){
	int pivot = C[hi];
	int i = low-1,j;
	int temp;
	for(j = low;j<hi;j++){
		if(C[j] < pivot){
			i = i+1;
			temp = C[i];
			C[i] = C[j];
			C[j] = temp;
		}
	}
	if(C[hi] < C[i+1]){
		temp = C[i+1];
		C[i+1] = C[hi];
		C[hi] = temp;
	}
	return i+1;
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) sort(int low, int hi){
	if(low < hi){
		int p = partition(low, hi);
		sort(low,p-1);
		sort(p+1,hi);
	}
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) qsort(){
	sort(0,SIZE_qsort-1);
	return C;
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) check(){

	while (endflag == 1){
		break;
	};
}