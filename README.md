# FOURNIER_Lab2

## Introduction

Ce TP met en pratique les concepts de conception conjointe abordés en cours en utilisant une carte DE10-Lite équipée d'un FPGA MAX10 10M50DAF484C7G de la gamme Altera. L'objectif principal est de créer un compteur à 3 digits avec affichage 7 segments déclenché par une interruption de timer.
## Architecture du Système

Le système comprend l'architecture de base avec :
- Un processeur Nios II
- Une mémoire RAM
- Une clock
- Un port JTAG

- Ajouts :
- Trois PIO 8 bits pour les 3 7 segments
- Un Timer

![image](https://github.com/ESN2024/FOURNIER_Lab2/assets/124307686/fbc1512e-5bee-4bea-ba95-e23c8737be42)


## Platform Designer

L'architecture sous Platform Designer (QSYS) inclut les composants mentionnés au-dessus.

![image](https://github.com/ESN2024/FOURNIER_Lab2/assets/124307686/951b7667-fcf3-44be-86ea-1beb5555aefb)

## Quartus et pin planner

Dans Quartus, le fichier toplevel.vhd est rédigé, et un autre fichier VHDL est ajouté au projet pour convertir un nombre binaire codé sur 4 bits (cnt) en une représentation 7 segments (seg_bcd_output). Chaque valeur possible de cnt est associée à une configuration spécifique des segments 7, conformément à la logique commune des afficheurs 7 segments. Une fois les signaux reliés dans le top level, les assignations de broches sont effectuées dans le pin planner. Il est essentiel d'assigner correctement les broches pour les ajouts mentionnés en se référant à la documentation de la carte.

![image](https://github.com/ESN2024/FOURNIER_Lab2/assets/124307686/efe4975d-4b67-4501-88a4-1339c37658da)

Ensuite, la compilation complète du design est effectuée, le design est flashable sur la carte si aucune erreur n'est présente.

## Nios II Flow

À partir du terminal Nios II, le BSP est généré et un Makefile est créé. Ensuite, les scripts C sont écrits, compilés et téléversés sur la carte.

## Travail Effectué

J'ai découpé ce projet en plusieur partie, chacune réalisant une étape spécifique du projet :

### Compteur à 1 digit

Une boucle `while` réalise un compteur de 0 à 9 qui retourne à 0 lorsque la valeur atteint 10. Pour allumer l'afficheur 7 segments, la fonction suivante est utilisée :
- `IOWR_AERA_AVALON_PIO_DATA(PIO_0_BASE, cnt);` où cnt est le compteur. Selon la valeur de cnt, un affichage est effectué selon le paramétrage dans le fichier seg_bcd.vhd.

### Compteur à 3 digit

La même logique est utilisée, mais pour des nombres allant jusqu'à 999. Lorsque le premier compteur cnt1 atteint la valeur 10, le deuxième compteur est incrémenté pour les dizaines, et ainsi de suite. Une fois que le nombre 999 est atteint (les trois compteurs sont égaux à 9), toutes les valeurs des compteurs sont remises à 0, le tout en allumant les afficheurs 7 segments.

### Compteur à 3 digit avec timer

Pas de changement majeur ici, sauf l'ajout de la déclaration de l'interruption du timer avec la fonction : `alt_irq_register(TIMER_0_IRQ, NULL, irqhandler);`. avec `irqhandler` le nom de l'interruption. 
Au préalable le timer est paramétré avec une fréquence de 500 ms dans QSYS. Lorsqu'il y a une occurrence de l'interruption du timer, les étapes précédemment expliquées sont effectuées. Une fois les incrémentations effectuées, le flag d'interruption est effacé.

## Démo

https://github.com/ESN2024/FOURNIER_Lab2/assets/124307686/23a308cc-c77f-41e5-8aa1-909f3612a659


## Conclusion

Ce TP nous a permis de mettre en pratique les concepts de conception conjointe tout en exploitant nos compétences nouvellement acquises, notamment dans la gestion des interruptions. Plus spécifiquement, sur la mise en place d'un afficheur 7 segments, en implémentant un compteurs à trois chiffres.
