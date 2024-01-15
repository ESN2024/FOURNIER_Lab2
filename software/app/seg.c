#include <stdio.h>
#include "system.h"
#include <sys/alt_irq.h>
#include <io.h>
#include <alt_types.h>
#include "sys/alt_sys_init.h"
#include "altera_avalon_pio_regs.h"

// Function to display 7-segment representation
void display_7seg(__uint8_t cnt, __uint8_t *seg_output) {
    
}

int main()
{
    alt_printf("main() started\n");

    volatile __uint8_t cnt1 = 0,cnt2 = 0, cnt3 = 0;
    

    // Boucle principale
    while(1) {
        // Logique principale ici (si nécessaire)
        
        
        IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, cnt1);
        IOWR_ALTERA_AVALON_PIO_DATA(PIO_2_BASE, cnt2);
        IOWR_ALTERA_AVALON_PIO_DATA(PIO_3_BASE, cnt3);
        cnt1++;
        usleep(10000);
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
    }

    return 0;
}
