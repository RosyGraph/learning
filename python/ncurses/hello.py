import curses

WIDTH = 50


def get_default_char(display_char):
    return curses.ACS_BLOCK if display_char == curses.ACS_HLINE else curses.ACS_HLINE


def identity(x):
    return x


def less_than_n(x, n=WIDTH - 1):
    return n - x


def x_modifier(f):
    return less_than_n if f(0) == 0 else identity


def main(stdscr):
    curses.curs_set(0)
    stdscr.clear()

    stdscr.nodelay(True)
    display_char = curses.ACS_BLOCK
    f = identity

    while True:
        display_char = get_default_char(display_char)
        for x in range(WIDTH):
            key_code = stdscr.getch()
            if key_code == ord("q"):
                return
            if key_code != -1:
                display_char = key_code
            stdscr.addch(0, f(x), display_char)
            curses.napms(100)
            stdscr.refresh()
        f = x_modifier(f)


if __name__ == "__main__":
    curses.wrapper(main)
