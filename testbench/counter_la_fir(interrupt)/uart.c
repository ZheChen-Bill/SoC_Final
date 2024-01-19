#include <defs.h>
#include <user_uart.h>
#include <irq_vex.h>
#include "header.h"

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_start()
{
    startflag = 1;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_end()
{
    endflag = 1;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) transmission(int fifo_size)
{
    int finish;
	char buffer[fifo_size];
	int idx;
	while(1){
		if(startflag){
			if(((reg_uart_stat) & 0X00000002) == 0X00000002 && idx < fifo_size){
				int data = uart_read();
				char c = (char)data;
				if(data == 0x0a) finish = 1;
				buffer[idx] = c;
				idx++;
			}
			else{
				startflag = 0;
			}
		}
		else(
			uart_write_string(buffer,idx);
			idx = 0;
		)
		if(idx == 0 & finish){
			break;
		}
	}
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
	write(data_length_address,data_length);
	for(int register i=0;i<N;i=i+1){
		write((tap_base+4*i),taps[i]);
	}
}


void __attribute__ ( ( section ( ".mprjram" ) ) ) ap_start() {
	while(1){
		if (((read(ap_control_address) & (1<<2)) == 0x00000004)){
			write((ap_control_address),((read(ap_control_address) | 1)));
			break;
		}
	}
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) input() {
	write(input_address,reg_fir_x);

}
int __attribute__ ( ( section ( ".mprjram" ) ) ) output() {
	reg_fir_y = read(output_address);
	return reg_fir_y;
}
/*
void __attribute__ ( ( section ( ".mprjram" ) ) ) start_DMA2() {
	write(DMA2_address, output_base);
	write(DMA2_length, data_length);
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) start_DMA1() {
	write(DMA1_address, input_base);
	write(DMA1_length, data_length);
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) endflag_check() {
	while(1){
		if(read(endflag_address) == 0x00000001){
			break;
		}
	}
}
*/
int __attribute__ ( ( section ( ".mprjram" ) ) ) check_output(int index) {
	reg_fir_y = read(input_base + 4*index);
	return reg_fir_y;
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();

	ap_start();

	for(int register i=0;i<M;i=i+1){
		reg_fir_x = inputsignal[i];

		//check fir ready to receive data (bit[4] = 1), then write data;
		input();

		//check fir is valid for output data (bit[5] = 1), then read data;
		outputsignal[i] = output();
	}
	
//	start_DMA2();
	
//	start_DMA1();
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