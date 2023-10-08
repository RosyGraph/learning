#include <stdlib.h>
#include <ncurses.h>

int main(int argc, char *argv[])
{
	int ch;

	initscr();
	raw();
	keypad(stdscr, TRUE);
	noecho();

	mvprintw(10, 10, "Type in any character to see it reversed");
	ch = getch();

	if (ch == KEY_F(1))
	{
		printw("F1 Key pressed");
	}
	else
	{
		mvprintw(11, 10, "The pressed key is ");
		attron(A_REVERSE);
		printw("%c", ch);
		attroff(A_REVERSE);
	}
	refresh();
	getch();
	endwin();
	return EXIT_SUCCESS;
}
