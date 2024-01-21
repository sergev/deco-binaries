	       Demos Commander Release Notes
	       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		       Version 3.6.0
			  for the

		    *  SCO Xenix 286
		    *  SCO Xenix 386
		    *  SCO Unix 386
		    *  Interactive 386/ix
		    *  Interactive Unix 386
		    *  UnixWare 386


1. Preface

These Release Notes contain information
for the Demos Commander Version 3.6.0.

Copyright (c) 1989, 1990, 1991 Cronyx Ltd.

2. Release Documentation

The documentation accompanying this release of the Demos
Commander includes:

    *  These Release Notes

    *  Demos Commander User's Guide

    *  Demos Commander Online Manual Pages

Release Notes and Online Manual are available on distribution
media as /usr/lib/deco/README and /usr/lib/deco/ref.lp.

3. System Configuration Requirements

    Hardware Requirements

    *  Process size of 300 kilobyte or be a virtual
       memory version of the Operating System.

    *  350 kilobyte of disk space available for the
       installed version of Demos Commander

    *  Terminal must have at least 80 columns and cursor
       addressing capability.

    System Requirements

    *  The system must have a termcap database file installed.

3. Contents of the distribution media

This distribution contains the following files:

    /usr/bin/deco             - Demos Commander
    /usr/lib/deco/README      - Release Notes
    /usr/lib/deco/ref.man     - User's Manual
    /usr/lib/deco/INSTALL     - script for installing package
    /usr/lib/deco/UNINSTALL   - script for uninstalling package
    /usr/lib/deco/termcap     - terminal description appendix
    /usr/lib/deco/profile     - description of default actions
    /usr/lib/deco/menu        - default user menu
    /usr/lib/deco/help/       - multilanguage help files

4. Installing Demos Commander

To install the Demos Commander Package, use the following
procedure:

    *  Log in to the system as root.

    *  Create temporary directory, then enter it:

	    mkdir /tmp/deco
	    cd /tmp/deco

    *  Insert the Demos Commander diskette into drive 0.

    *  Read distribution into current directory:

	    tar xvbf 18 /dev/rfd048ds9

    *  Run installation script:

	    ./INSTALL

    *  After completion of the installation remove the temporary
       directory:

	    cd /tmp
	    rm -r deco

To remove Demos Commander, use script /usr/lib/deco/UNINSTALL.

Running Demos Commander on Xenix console you may use terminal
types 'ansi' or 'xenix'. In fact, Terminal type 'ansi' is not
true ansi description, but is adjusted to Xenix console.
If you are running real ansi device, you must use TERM=trueansi.

To setup terminal type, use:

    $ TERM=termtype
    $ export TERM

in shell, or

    % setenv TERM termtype

in cshell.

5. Adding a new terminal type.

Demos Commander handles a terminal using a terminal capability
database termcap. Commander has its own termcap appendix
/usr/lib/deco/termcap, which is read before standard
/etc/termcap. Indirections tc=name in deco's own termcap refer
to the entry 'name' in the default terminal database. You can
use your own terminal database instead of the default
/etc/termcap. To do this, set the global variable TERMCAP to
the full name of your file (for example,
TERMCAP=/usr/my/termcap).

Demos Commander uses the following termcap entries.
See termcap(M) for additional information.

Base descriptors:

    li#     - number of lines
    co#     - number of columns
    cl=     - clear screen
    cm=     - cursor addressing
    ms      - can move cursor while in reverse mode
    ti=     - enable cursor addressing
    te=     - disable cursor addressing
    ks=     - enable keypad
    ke=     - disable keypad
    is=     - initiate terminal
    if=     - 'cat' this file to initiate terminal
    fs=     - restore terminal to default modes

Scrolling:

    al=     - insert line at current position
    dl=     - delete line at current position
    cs=     - set scrolling window (like cm)
    sf=     - scroll forward
    sr=     - scroll reverse

Attributes:

    vs=     - enable attribute switching
    ve=     - disable attribute switching
    so=     - turn reverse on
    se=     - turn reverse off
    md=     - set bold
    mh=     - set dim
    mr=     - set reverse (if not so)
    me=     - turn all attributes off (set normal, reverse off)

Color management:

    Nf#   * - number of foreground colors
    Nb#   * - number of background colors
    Cf=   * - set foreground color (like cm)
    Cb=   * - set background color (like cm)
    Mf=   * - map foreground colors
    Mb=   * - map background colors
    C2    * - set back- and foreground simultaneously (only Cf)

Line drawing:

    gs=   * - enable line drawing mode
    ge=   * - disable line drawing mode
    g1=   * - single line drawing characters
    g2=   * - double line drawing characters

Keys:

    kl=     - cursor left
    kr=     - cursor right
    ku=     - cursor up
    kd=     - cursor down
    kh=     - cursor home
    kN=   * - next page (Page Down)
    kP=   * - previous page (Page Up)
    kI=   * - Ins key (Insert)
    kD=   * - Del key (Delete)
    kH=   * - End key (additional home)
    f1=   * - F1 key
    f2=   * - F2 key
    f3=   * - F3 key
    f4=   * - F4 key
    f5=   * - F5 key
    f6=   * - F6 key
    f7=   * - F7 key
    f8=   * - F8 key
    f9=   * - F9 key
    f0=   * - F10 key
    k1=   * - F1 key
    k2=   * - F2 key
    k3=   * - F3 key
    k4=   * - F4 key
    k5=   * - F5 key
    k6=   * - F6 key
    k7=   * - F7 key
    k8=   * - F8 key
    k9=   * - F9 key
    k0=   * - F10 key

Descriptors, not contained in standard termcap, are marked
with '*'.

Descriptors cm, cs, Cf, Cb are in tgoto format.
See termcap(M) for details. Some terminals require
more complex escapes. In this case, you can use tparm
format (see terminfo(M) for more information).

Line drawing descriptors g1 and g2 consist of 11 characters
in the following order: horizontal line, vertical line,
lower left corner, lower center, lower right corner,
left center, center cross, right center,
upper left corner, upper center, upper right corner.

6. Choosing help language.

You can choose language of help screens, by setting global
variable MSG.  This release supports five languages
according to the following table:

	  MSG   Language
	 -----------------
	   e    English
	   d    German
	   f    French
	   r    Russian
	   u    Ukrainian

You can add other languages by creating additional help files
in /usr/lib/deco/help directory.

7. Known problems with this Release

No color setup in this version.

Cannot set language from Options menu. Use MSG variable instead.
