import curses


def show_purple_block(window: curses.window, start_y: int, start_x: int, height: int = 2, width: int = 3):
    color = curses.color_pair(5)
    window.addch(start_y, start_x, curses.ACS_ULCORNER, color)
    window.addch(start_y, start_x + (width - 1), curses.ACS_URCORNER, color)
    window.addch(start_y + (height - 1), start_x, curses.ACS_LLCORNER, color)
    window.addch(start_y + (height - 1), start_x + (width - 1), curses.ACS_LRCORNER, color)
    window.addch(start_y, start_x + (width - 2), curses.ACS_HLINE, color)
    window.addch(start_y + (height - 1), start_x + (width - 2), curses.ACS_HLINE, color)


def main(stdscr):
    curses.curs_set(0)
    stdscr.clear()
    curses.init_pair(5, curses.COLOR_MAGENTA, curses.COLOR_BLACK)
    for j in range(1, curses.LINES - 2, 2):
        for i in range(1, curses.COLS - 2, 3):
            show_purple_block(stdscr, j, i)
    stdscr.refresh()
    stdscr.getch()


if __name__ == "__main__":
    curses.wrapper(main)
