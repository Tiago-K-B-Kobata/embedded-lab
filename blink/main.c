#include <stdint.h>

volatile uint32_t *GPIO_PORTF_DATA = (uint32_t *)0x400253FC;

int main(void)
{
    // Toggle a fake LED in an infinite loop
    while (1)
    {
        *GPIO_PORTF_DATA ^= (1 << 1);
        for (volatile int i = 0; i < 100000; i++); // crude delay
    }
}

