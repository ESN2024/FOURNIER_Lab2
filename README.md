# FOURNIER_Lab2

## Introduction

Ce TP met en pratique les concepts de conception conjointe vus en cours en travaillant avec une carte DE10-Lite équipée d'un FPGA MAX10 10M50DAF484C7G de la gamme Altera. L'objectif principal est de créer un compteur 7 segments avec 3 digits déclenché par une interruption de timer.

## Architecture du Système

Le système comprend l'architecture de base avec :
- Un processeur Nios II
- Une mémoire RAM
- Une clock
- Un port JTAG

- Ajouts :
- Trois PIO 8 bits pour les 3 7 segments
- Un Timer

![image](https://github.com/ESN2024/FOURNIER_Lab2/assets/124307686/422a96f5-2896-4845-998c-f63caed12cb8)


## Platform Designer

L'architecture sous Platform Designer (QSYS) inclut les composants mentionnés au-dessus.

![image](https://github.com/ESN2024/FOURNIER_Lab2/assets/124307686/951b7667-fcf3-44be-86ea-1beb5555aefb)

## Quartus et pin planner

Dans Quartus, le fichier toplevel.vhd est rédigé et le , et les assignations de broches sont réalisées dans le pin planner. Il faut prendre soin d'assigner les broches qui correspondent aux ajouts mentionnés au-dessus en se référant à la documentation de la carte.

![image](https://github.com/ESN2024/FOURNIER_Lab2/assets/124307686/117a082b-90ec-43f0-9cda-46c5d15919f5)

Ensuite, la compilation complète du design est effectuée, le design est flashable sur la carte si aucune erreur n'est présente.

## Nios II Flow

À partir du terminal Nios II, le BSP est généré et un Makefile est créé. Ensuite, les scripts C sont écrits, compilés et téléversés sur la carte.

## Travail Effectué

J'ai créé trois scripts C, chacun réalisant une étape spécifique du projet :

### Chenillard seul

Une boucle `while` réalise des décalages à gauche et revient à 0 lorsque l'extrémité gauche des LED est atteinte. Pour allumer les différentes LEDs, nous utiliserons la fonction :
- `IOWR_AERA_AVALON_PIO_DATA(PIO_0_BASE,LED);` où LED est une variable qui définit le numéro des LEDs.

### Chenillard actionné par un bouton-poussoir

Utilisation d'une interruption déclenchée par un bouton. La fonction `alt_irq_register(PIO_1_IRQ, NULL, irqhandler_bp);` est utilisée. `irqhandler_bp` est le nom de le fonction de l'interruption du bouton-poussoir.

### Chenillard contrôlé en vitesse avec les switchs

Les interrupteurs 1 à 8 sont ajoutés au design QSYS, et un masque dans le code logiciel permet de lire la valeur des interrupteurs pour contrôler la variable de temps, affectant ainsi la vitesse. Les fonctions suivantes sont utilisées :
- `IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PIO_2_BASE, 0x0F);` qui effectue le masque sur les quatre premiers switchs.
- `IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_2_BASE, 0x0F);` qui effectue la détection du changement d'état switchs.
Il faut être vigilant au niveau du changement de vitesse pour que les switchs puissent l'effectuer. Il faut que le niveau d'interruption soit plus fort au niveau du switchs que celui du bouton-poussoir. Cela se règle dans QSYS. (voir capture au-dessus)

## Démo

https://github.com/ESN2024/FOURNIER_Lab1/assets/124307686/1757a200-f185-4431-8c81-c4e475ceb9fc

## Conclusion

Ce TP nous a permis de prendre en main les outils de conception conjointe, tout en utilisant nos connaissances acquises en cours, particulièrement au niveau des interruptions.
 
