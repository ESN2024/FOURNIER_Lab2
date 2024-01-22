#include <stdio.h>
#include "system.h"
#include <sys/alt_irq.h>
#include <io.h>
#include <alt_types.h>
#include "sys/alt_sys_init.h"
#include "altera_avalon_pio_regs.h"

#include "alt_types.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "sys/alt_irq.h"



volatile __uint8_t cnt1 = 0,cnt2 = 0, cnt3 = 0;
// Function to display 7-segment representation
static void irqhandler(void* context, alt_u32 id)
{
    

    IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, cnt1);
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_2_BASE, cnt2);
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_3_BASE, cnt3);
    cnt1++;
   
    if (cnt1 == 10) {
        cnt1 = 0;
        cnt2++;
    }
    if (cnt2 == 10) {
        cnt2 = 0;
        cnt3++;
    }
    if (cnt3 == 10) {
        cnt3 = 0;
        cnt2 = 0;
        cnt1 = 0;
        
    }
    IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0x1);
}

int main()
{
    alt_irq_register(TIMER_0_IRQ, NULL, irqhandler);
    // Boucle principale
    while(1) {
    }

    return 0;
}
