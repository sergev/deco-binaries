/*
 * Convert text files to PostScript format.
 *
 * Serge Vakulenko, vak@kiae.su
 */

# include <stdio.h>

# define LINESZ 256
# define INCH   72

int pagelen = 66;

int lpi = 6;
int pointsize = 10;
int hoffset = INCH;
int voffset = 0;
int pageheight = 11 * INCH;

main (argc, argv)
char **argv;
{
	int stdinflag;

	for (++argv; **argv=='-'; ++argv)
		parseflag (*argv + 1);

	stdinflag = 1;
	for (; *argv; ++argv) {
		if (! freopen (*argv, "r", stdin)) {
			fprintf (stderr, "Cannot open '%s'\n", *argv);
			continue;
		}
		printfile ();
		stdinflag = 0;
	}
	if (stdinflag)
		printfile ();
	return (0);
}

parseflag (p)
char *p;
{
	switch (*p) {
	case 'l':               /* page length */
		pagelen = atoi (p + 1);
		break;
	case 'd':               /* lines per inch */
		lpi = atoi (p + 1);
		break;
	case 'p':               /* point size */
		pointsize = atoi (p + 1);
		break;
	case 'h':               /* horisontal offset */
		hoffset = atoi (p + 1);
		break;
	case 'v':               /* vertical offset */
		voffset = atoi (p + 1);
		break;
	}
}

printfile ()
{
	char line [LINESZ];             /* input line */
	int linenum;

	printf ("/Courier findfont %d scalefont setfont\n", pointsize);
	printf ("/P { %d exch %d mul %d exch sub moveto show } def\n",
		hoffset, 72/lpi, pageheight-voffset);

	for (linenum=1; gets (line); ++linenum) {
		expandline (line);
		truncspaces (line);
		if (*line) {
			printf ("(");
			printline (line);
			printf (") %d P\n", linenum);
		}
		if (linenum >= pagelen) {
			printf ("showpage\n");
			linenum = 0;
		}
	}
	if (linenum > 1)
		printf ("showpage\n");
}

printline (line)
char *line;
{
	register c;

	for (;;) {
		switch (c = *line++) {
		case 0:
			return;
		case '(':
		case ')':
		case '\\':
			printf ("\\%c", c);
			continue;
		case '%':
			printf ("\\%o", c);
			continue;
		default:
			putchar (c);
			continue;
		}
	}
}

expandline (line)
char *line;
{
	char buf [LINESZ];
	register char *i, *o;
	register c, col;

	i = line;
	o = buf;
	col = 0;
	while (c = *i++) {
		if (c == '\t') {
			do {
				*o++ = ' ';
				++col;
			} while (col % 8);
		} else {
			*o++ = c;
			col++;
		}
	}
	*o = 0;
	i = buf;
	o = line;
	while (*o++ = *i++);
}

truncspaces (line)
char *line;
{
	register char *p;

	for (p=line; *p; ++p);
	for (--p; p>=line && (*p==' ' || *p=='\t'); *p--=0);
}
