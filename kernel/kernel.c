void screen_write(char* message);

void kernel_main() {
    screen_write("JOS kernel loaded!");
    
    while (1) {}
}
