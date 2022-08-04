#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VtestScala.h"
#include "VtestScala___024root.h"


typedef int                     int32;
typedef unsigned int            uint32;
typedef long long int           int64;
typedef unsigned long long int  uint64;


int main(){
    VtestScala *dut = new VtestScala;
    dut->eval();


    dut->io_a = 1;
    dut->eval();
    printf("input = %d, the output is %d\n", dut->io_a, dut->io_out);

    dut->io_a = 4;
    dut->eval();
    printf("input = %d, the output is %d\n", dut->io_a, dut->io_out);


    dut->io_a = 2;
    dut->eval();
    printf("input = %d, the output is %d\n", dut->io_a, dut->io_out);

    dut->io_a = 1;
    dut->eval();
    printf("input = %d, the output is %d\n", dut->io_a, dut->io_out);


    dut->io_a = 4;
    dut->eval();
    printf("input = %d, the output is %d\n", dut->io_a, dut->io_out);

    dut->io_a = 4;
    dut->eval();
    printf("input = %d, the output is %d\n", dut->io_a, dut->io_out);





    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}