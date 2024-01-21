/*
 * Convert text files to LaTeX verbatim format.
 *
 * Serge Vakulenko, vak@kiae.su
 */

# include <stdio.h>

# define LINESZ 128
# define PAGESZ 70

char page [PAGESZ] [LINESZ];
int pagelen;
int pagemax = 66;

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
	default:
		fprintf (stderr, "Usage: txt2latex [filename...]\n");
		exit (1);
	}
}

printfile ()
{
	printf ("\\documentstyle{article} \\pagestyle{empty}\n");
	printf ("\\topmargin 0pt \\headheight 0pt \\headsep 0pt \\footskip 0pt\n");
	printf ("\\textheight = 66\\baselineskip\n");
	printf ("\\begin{document}\n");

	for (;;) {
		getpage ();
		if (pagelen <= 0)
			break;
		printf ("\\begin{verbatim}\n");
		putpage ();
		printf ("\\end{verbatim} \\newpage\n");
	}
	printf ("\\end{document}\n");
}

getpage ()
{
	register char *line;

	pagelen = 0;
	while (pagelen < pagemax && gets (line = page [pagelen])) {
		expandline (line);
		truncspaces (line);
		++pagelen;
	}
}

putpage ()
{
	register beg, end;

	beg = 0;
	while (beg < pagelen && ! page[beg][0])
		++beg;
	end = pagelen - 1;
	while (end >= 0 && ! page[end][0])
		--end;
	for (; beg <= end; ++beg)
		puts (page [beg]);
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
