SHELL   = /bin/sh
NROFF   = nroff
CFLAGS  = -O
LDFLAGS = -s
CC      = cc

#--- English versions

all:    dvi lp ps rus

dvi:    guide.dvi title.dvi notes.dvi adv.dvi ref.dvi

lp:     ref.lp

ps:     guide.ps title.ps notes.ps adv.ps ref.ps

#--- Russian versions

rus:    rusdvi ruslp rusps

rusdvi: cyrguide.dvi cyrtitle.dvi cyrnotes.dvi cyradv.dvi cyrref.dvi cyrlic.dvi

ruslp:  cyrref.lp

rusps:  cyrguide.ps cyrtitle.ps cyrnotes.ps cyradv.ps cyrref.ps cyrlic.ps

txt2ps: txt2ps.c
	$(CC) $(LDFLAGS) txt2ps.c -o txt2ps

txt2latex: txt2latex.c
	$(CC) $(LDFLAGS) txt2latex.c -o txt2latex

refresh: dvi #rusrefresh
	latex guide.tex

rusrefresh: rusdvi
	latex cyrguide.tex

clean:
	rm -f *.b *.o txt2ps txt2latex .,* *.lo[gft] *.aux *.dvi *.toc\
		cyrnotes.tex notes.tex cyrref.tex ref.tex

guide.dvi: guide.sty pic/header.ps

cyrguide.dvi: cyrguide.sty pic/header.ps

pic/header.ps:
	cd pic; make

guide.ps: guide.dvi
	dvips -Z -h pic/header.ps guide.dvi -o

cyrguide.ps: cyrguide.dvi
	dvips -Z -h pic/header.ps cyrguide.dvi -o

cyrlic.dvi: cyrlic.tex
	tex cyrlic.tex

title.dvi: title.tex
	tex title.tex

cyrtitle.dvi: cyrtitle.tex
	tex cyrtitle.tex

cyrnotes.dvi: cyrnotes.tex

notes.dvi: notes.tex

notes.ps: txt2ps notes.txt
	txt2ps -h108 -v72 -l54 notes.txt > notes.ps

ref.ps: txt2ps ref.lp
	col -b < ref.lp | txt2ps -h108 -v0 > ref.ps

cyrref.dvi: cyrref.tex

ref.dvi: ref.tex

cyrref.tex: txt2latex cyrref.lp

ref.tex: txt2latex ref.lp

.SUFFIXES: .dvi .ps .tex .txt .man .lp

.txt.tex:
	echo '\\documentstyle{article}' > $@
	echo '\\begin{document} \\begin{verbatim}' >> $@
	expand < $< >> $@
	echo '\\end{verbatim} \\end{document}' >> $@

.man.lp:
	$(NROFF) -man $< > $@

.lp.tex:
	col -b < $< | txt2latex > $@

.tex.dvi:
	latex $<

.dvi.ps:
	dvips -Z $< -o
