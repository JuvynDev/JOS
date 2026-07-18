#include <stddef.h>

void screen_write(char* message) {
    char* video = (char*)0xb8000;

    for (int i = 0; message[i] != '\0'; i++) {
        video[i * 2] = message[i];
        video[i * 2 + 1] = 0x07;
    }
}
