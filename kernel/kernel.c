#include "../drivers/screen.h"

void kernel_main() {
    screen_clear();
    screen_write("Welcome to JOS!");

    while (1) {}
}
