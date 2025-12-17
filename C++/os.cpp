#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
int main() {
pid_t pid1, pid2, pid3;
pid1 = fork();
if (pid1 == 0) {
printf("Horcrux destroyed: Tom Riddle’s Diary!\n");
pid3 = fork();
if (pid3 == 0) {
printf("Horcrux destroyed: Hufflepuff’s Cup!\n");
exit(0);
} else if (pid3 > 0) {
wait(NULL);
exit(0);
}
}
else if (pid1 > 0) {
pid2 = fork();
if (pid2 == 0) {
printf("Horcrux destroyed: Slytherin’s Ring!\n");
exit(0);
}
else if (pid2 > 0) {
wait(NULL);
printf("At least one Horcrux gone!\n");
}
}
return 0;
}
