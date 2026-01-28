/*
 * main.c
 *
 *  Created on: Jan 23, 2026
 *      Author: tiago-kobata
 */


#include "stm32f1xx_hal.h"

//Function prototype
void GPIO_Config(void);
void delay(uint32_t delayVal);
void SysTick_Handler(void);

//Main function
int main(void){

	HAL_Init();
	SysTick_Handler();
	GPIO_Config();
	while(1){
		HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
		delay(50000);
	}
}

void GPIO_Config(void){
	__HAL_RCC_GPIOA_CLK_ENABLE();

	GPIO_InitTypeDef GPIOA_init = {};

	GPIOA_init.Pin = GPIO_PIN_5;
	GPIOA_init.Mode = GPIO_MODE_OUTPUT_PP;
	GPIOA_init.Speed = GPIO_SPEED_FREQ_LOW;


	HAL_GPIO_Init(GPIOA, &GPIOA_init);
}

void delay(uint32_t delayVal){
	volatile uint32_t i;
	for(i = 0; i < delayVal; i++){

	}
}

void SysTick_Handler(void){
  HAL_IncTick();
}

