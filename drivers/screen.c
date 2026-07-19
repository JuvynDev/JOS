#include "screen.h"

#define VGA_WIDTH 80
#define VGA_HEIGHT 25

static char* video = (char*)0xB8000;

void screen_clear() {
    for (int i = 0; i < VGA_WIDTH * VGA_HEIGHT; i++) {
        video[i * 2] = ' ';
        video[i * 2 + 1] = 0x07;
    }
}

void screen_write(char* message) {
    for (int i = 0; message[i] != '\0'; i++) {
        video[i * 2] = message[i];
        video[i * 2 + 1] = 0x07;
    }
}
