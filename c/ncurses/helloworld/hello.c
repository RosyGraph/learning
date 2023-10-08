#include <ncurses.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	initscr();
	printw("Hello, world!");
	refresh();
	getch();
	endwin();
	return EXIT_SUCCESS;
}
