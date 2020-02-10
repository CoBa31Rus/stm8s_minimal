#include "clk.h"

void clk_init(void)
{
	CLK->CKDIVR = 0;
    GPIOB->DDR |= (1 << 5);
}