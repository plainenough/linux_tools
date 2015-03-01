/**********************************************************************************
 * This program is based directly on munch.c provided by linuxatemyram.com        *
 * I claim no ownership for the code and have modified it from the original       *
 * version. Use "gcc test.c -o test" to compile. This program just uses up RAM    *
 * until the linux kernel desides to envoke OOM killer on it.                     *
 * *******************************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char** argv) {
    int max = -1;
    int mb = 0;
    char* buffer;

    if(argc > 1)
        max = atoi(argv[1]);

    while((buffer=malloc(50*1024*1024)) != NULL && mb != max) {
        memset(buffer, 0, 50*1024*1024);
        mb++;
        printf("Allocated memory %d times.\n", mb);
	sleep(5);

    }
    
    return 0;
}
