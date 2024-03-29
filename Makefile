#
#       Demos commander, Copyright (C) 1989-1992 Serge Vakulenko
#

#       -DTERMIO        use termio.h instead sgtty.h
#       -DNOKEYPAD      don't use keypad
#       -DINITFILE      send 'if' file to initialize terminal
#       -DDIRENT        use Posix readdir() library
#       -DMYREADDIR     use my own readdir() library
#       -DSTRINIT       send is, fs when VRestore, VReopen
#       -DHOSTNAME      use gethostname
#       -DHARDKEYS      cannot differ key escape codes by two last chars
#       -DBCOPY         use bcopy, bcmp instead of memcpy, memcmp
#       -DLONGPTR       sizeof (char *) == sizeof (long)
#       -DCOMPAT32      build menu, compatible with deco version 3.2
#       -DMYLOCALTIME   use my own version of localtime
#       -DSIGTYPE=void  if signal handlers must be of type void
#       -DNEEDLITOUT    set LITOUT mode of terminal
#       -DCYRILLIC      emulate cyrillic koi8 letters using
#                       CY, Cs, Ce, Ct, and ^N, ^O
#       -DSTDMALLOC     use standart malloc library instead of own one (NEXT)
#       -DGROUPS        use getgroups() call for groups list (BSD, POSIX)
#	-DVARARGS	use varargs.h

DEST          = /usr/local/bin
MAKEFILE      = Makefile
PRINT	      = pr
GLOBCFLAGS    = -O -DCYRILLIC
LINTFLAGS     = -abch $(CFLAGS)
GCC           = gcc

# For AT&T Unix PC
# CFLAGS        = $(GLOBCFLAGS) -DTERMIO -DMYREADDIR
# LDFLAGS       = -i

# For Labtam NS 32332
# CFLAGS        = $(GLOBCFLAGS) -DTERMIO -DSTRINIT -DMYREADDIR
# LDFLAGS       = -i

# For Xenix-286
# CFLAGS        = $(GLOBCFLAGS) -K -M2l -DTERMIO -DLONGPTR -DMYREADDIR
# LDFLAGS       = -i -M2l

# For Xenix-386
# CFLAGS        = $(GLOBCFLAGS) -K -DTERMIO -DMYREADDIR
# LDFLAGS       = -i

# For Xenix-386 with gnu compiler
# CFLAGS        = $(GLOBCFLAGS) -DTERMIO -DMYREADDIR
# CC            = $(GCC)

# For ISC 386 Version 2.0.2 with standard compiler
# CFLAGS        = $(GLOBCFLAGS) -DTERMIO -DDIRENT -DGROUPS

# For ISC 386 Version 2.0.2 with gnu compiler
# CFLAGS        = $(GLOBCFLAGS) -DTERMIO -DDIRENT -DGROUPS
# CC            = $(GCC)

# For ISC 386 Version 2.2 with standard compiler
# CFLAGS        = $(GLOBCFLAGS) -DTERMIO -DDIRENT -DSIGTYPE=void -Dsignal=sigset -DGROUPS

# For ISC 386 Version 2.2, 3.0 with gnu compiler
# CFLAGS        = $(GLOBCFLAGS) -DTERMIO -DDIRENT -DSIGTYPE=void -Dsignal=sigset -DGROUPS
# CC            = $(GCC)
# LIBS          = -lcposix

# For Ultrix
# CFLAGS        = $(GLOBCFLAGS) -DHOSTNAME -DBCOPY -DVFORK -DGROUPS

# For Ultrix with gnu compiler
# CFLAGS        = $(GLOBCFLAGS) -DHOSTNAME -DBCOPY -DVFORK -DGROUPS
# CC            = $(GCC)

# For Bsd43
# CFLAGS        = $(GLOBCFLAGS) -DNEEDLITOUT -DHOSTNAME -DBCOPY -DVFORK -DGROUPS

# For Bsd43 with gnu compiler
# CFLAGS        = $(GLOBCFLAGS) -DNEEDLITOUT -DHOSTNAME -DBCOPY -DVFORK -DGROUPS
# CC            = $(GCC)

# For SunOS
# CFLAGS        = $(GLOBCFLAGS) -DTERMIOS -DHOSTNAME -DVFORK -DDIRENT -DVARARGS -DSIGTYPE=void

# For SunOS with GCC
CFLAGS        = $(GLOBCFLAGS) -DTERMIOS -DHOSTNAME -DVFORK -DDIRENT -DVARARGS -DSIGTYPE=void
CC            = $(GCC)
LIBS	      = -lnsl

# For NeXT
# CFLAGS        = $(GLOBCFLAGS) -DGETWD -DSTDDIR -DHOSTNAME -DBCOPY -DVFORK -DSTDMALLOC -DGROUPS
# LDFLAGS       = -object

# For NeXT with gnu compiler
# CFLAGS        = $(GLOBCFLAGS) -DGETWD -DSTDDIR -DHOSTNAME -DBCOPY -DVFORK -DSTDMALLOC -DGROUPS
# LDFLAGS       = -object
# CC            = $(GCC)

# For 386bsd, FreeBSD, BSD/386 (BSDI)
# CFLAGS        = $(GLOBCFLAGS) -DTERMIOS -DHOSTNAME -DVFORK -DGROUPS -DSIGTYPE=void
# CC            = $(GCC)

# For linux
# CFLAGS        = $(GLOBCFLAGS) -DTERMIO -DDIRENT -DSIGTYPE=void
# CC            = $(GCC)

# For HPUX 8.0
# CFLAGS        = $(GLOBCFLAGS) -DTERMIO -DHOSTNAME -DVFORK -DGROUPS -DVARARGS -DSIGTYPE=void

HDRS          = cap.h deco.h dir.h env.h key.h mem.h menu.h rec.h scr.h tm.h

OBJS          = cap.o choice.o cmd.o com.o dir.o draw.o edit.o env.o ex.o\
		help.o hexview.o key.o main.o match.o mem.o menu.o mh.o pw.o\
		rec.o run.o scr.o time.o tm.o tty.o ut.o view.o

SRCS          = cap.c choice.c cmd.c com.c dir.c draw.c edit.c env.c ex.c\
		help.c hexview.c key.c main.c match.c mem.c menu.c mh.c pw.c\
		rec.c run.c scr.c time.c tm.c tty.c ut.c view.c

all:            deco #ech decoserial decoinst decogenkey

deco:           $(OBJS)
		$(CC) $(LDFLAGS) $(OBJS) $(LIBS) -o deco

decoserial:     decoserial.o
		$(CC) $(LDFLAGS) decoserial.o -o decoserial

decoinst:       decoinst.o
		$(CC) $(LDFLAGS) decoinst.o -o decoinst

decogenkey:     decogenkey.o
		$(CC) $(LDFLAGS) decogenkey.o -o decogenkey

ech:            ech.o
		$(CC) $(LDFLAGS) ech.o -o ech

clean:;         rm -f *.o *.b z* core core.* a.out deco decoinst decogenkey\
		decoserial ech ptime deathtime

depend:;        mkmf -f $(MAKEFILE) DEST=$(DEST)

index:;		@ctags -wx $(HDRS) $(SRCS)

install:        deco
		-rm -f $(DEST)/deco /tmp/deco
		-mv $(DEST)/deco /tmp
		cp deco $(DEST)
		strip $(DEST)/deco
		chmod 711 $(DEST)/deco
		chgrp bin $(DEST)/deco
		chown bin $(DEST)/deco

print:;		@$(PRINT) $(HDRS) $(SRCS)

tags:           $(HDRS) $(SRCS); @ctags $(HDRS) $(SRCS)

lint:           $(HDRS) $(SRCS); @lint $(LINTFLAGS) $(SRCS) >lint

$(DEST)/deco:   $(SRCS) $(HDRS) $(EXTHDRS)
		make -f $(MAKEFILE) DEST=$(DEST) install

dist:           deco decoinst ech doc/ref.man doc/cyrref.man doc/ref.lp\
		doc/cyrref.lp doc/notes.txt doc/cyrnotes.txt lib\
		inst.sh uninst.sh
		rm -rf distrib
		mkdir distrib
		cp deco distrib
		strip distrib/deco
		cp ech distrib
		strip distrib/ech
		cp decoinst distrib
		strip distrib/decoinst
		cp doc/ref.man distrib
		cp doc/cyrref.man distrib
		cp doc/ref.lp distrib
		cp doc/cyrref.lp distrib
		cp doc/notes.txt distrib/README
		cp doc/cyrnotes.txt distrib/RUSREADME
		mkdir distrib/lib
		cp lib/* distrib/lib
		mkdir distrib/help
		cp help/* distrib/help
		cp inst.sh distrib/INSTALL
		chmod +x distrib/INSTALL
		cp uninst.sh distrib/UNINSTALL
		chmod +x distrib/UNINSTALL
		chmod og-rwx distrib distrib/* distrib/*/*

ser:            decoserial decogenkey ech ser.sh
		rm -rf serializer
		mkdir serializer
		cp decoserial serializer
		strip serializer/decoserial
		cp ech serializer
		strip serializer/ech
		cp decogenkey serializer
		strip serializer/decogenkey
		cp ser.sh serializer/SERIALIZE
		chmod +x serializer/SERIALIZE
		chmod og-rwx serializer serializer/* serializer/*

###
cap.o: cap.h mem.h env.h
choice.o: scr.h dir.h deco.h
cmd.o: dir.h deco.h scr.h mem.h env.h
com.o: scr.h dir.h deco.h mem.h env.h
dir.o: dir.h deco.h mem.h
draw.o: dir.h deco.h scr.h
edit.o: scr.h rec.h mem.h
env.o: mem.h
ex.o: dir.h deco.h scr.h mem.h
help.o: scr.h env.h
hexview.o: scr.h rec.h mem.h
key.o: key.h cap.h mem.h
main.o: key.h scr.h dir.h deco.h mem.h env.h
mem.o: mem.h
menu.o: scr.h menu.h
mh.o: scr.h dir.h deco.h menu.h
pw.o: mem.h
rec.o: rec.h mem.h
run.o: mem.h env.h
scr.o: scr.h key.h mem.h env.h cap.h
time.o: tm.h
tm.o: tm.h env.h
view.o: scr.h rec.h
