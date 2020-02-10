#include "stm8s.h"

int main()
{
	CLK->CKDIVR = 0;
    GPIOB->DDR |= (1 << 5);
	while(1)
	{
		for(volatile uint32_t i = 0x1FFFF; i > 0; i--);
		GPIOB->ODR |= (1 << 5);
		for(volatile uint32_t i = 0x1FFFF; i > 0; i--);
		GPIOB->ODR &= ~(1 << 5);
	}
}