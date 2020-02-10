#include "stm8s.h"
#include "clk.h"

int main()
{
	clk_init();
	while(1)
	{
		for(volatile uint32_t i = 0x1FFFF; i > 0; i--);
		GPIOB->ODR |= (1 << 5);
		for(volatile uint32_t i = 0x1FFFF; i > 0; i--);
		GPIOB->ODR &= ~(1 << 5);
	}
}