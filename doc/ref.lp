


DECO(1)             UNIX Programmer's Manual              DECO(1)



NNAAMMEE
     deco - visual shell for UNIX

FFOORRMMAATT
     ddeeccoo [directory]

DDEESSCCRRIIPPTTIIOONN
     DECO, or Demos Commander, is a visual interface for the UNIX
     operating system, developed by the motives of the widely
     known Norton Commander.

     Control characters are designated below as ^X, which means:
     CTRL+X. The "~" in file names means "home directory".

FFuunnccttiioonnaall KKeeyyss
     DECO is adjusted to the type of terminal by means of the
     termcap terminal description file. While in operation, DECO
     uses 10 functional keys F1-F10. To determine the keys,

     f0...f9
          for F10, F1...F9 keys

     kl, kr, ku, kd
          for left, right, up, down arrow keys respectively

     kh, kH, kP, kN
          for home screen, screen end, page up, page down,
          respectively

     kI   insert mode

     kD   delete character

     For terminals without an additional keyboard, it is possible
     to enter commands by control characters or <Esc> X sequence.

     Here is the Commands Table:

           Command Key                     Alternative
           (PC key)        VT-220          input
           -------------------------------------
           F1              -1-             ESC 1
           F2              -2-             ESC 2
           F3              -3-             ESC 3
           F4              -4-             ESC 4
           F5              -5-             ESC 5
           F6              -6-             ESC 6
           F7              -7-             ESC 7
           F8              -8-             ESC 8
           F9              -9-             ESC 9
           F10             -0-             ESC 0
           arrow up        up              ESC u



Printed 5/4/91                                                  1






DECO(1)             UNIX Programmer's Manual              DECO(1)



           arrow down      down            ESC d
           arrow left      left            ESC l
           arrow right     right           ESC r
           Home            Home            ESC h
           End             End             ESC e
           PgUp            PrevPage        ESC p
           PgDn            NextPage        ESC n
           Ins             Ins             ^T
           Del             Del             ^G

     Note that for some devices (for example, PC AT console) F1-
     F10 keys are used, while for others - keys 1-9, 0 of the
     additional keyboard.

CCoommmmaanndd CCaanncceelliinngg aanndd EExxiitt ffrroomm DDeeccoo
     In any state of DECO, press F10 to reset and cancel the
     current menu. If DECO is in the usual mode (system command
     input), F10 calls for an exit from the DECO menu:

           Do you want to exit from DECO commander?
           Yes No Shell

     Yes (exit), No (no exit), and Shell (run csh) should be
     selected by the arrow keys and the RETURN key (ENTER for IBM
     PC). If Shell is selected, you have to input the exit com-
     mand in order to return to DECO.

GGeettttiinngg HHeellpp
     F1 provides you with a built-in help message. Press F10 to
     return to DECO.

DDeeccoo WWiinnddoowwss aanndd OOppeerraattiioonn MMooddeess
     Usually, DECO shows two panels (right and left ones), two
     directories are displayed there. One of these panels is the
     current one, where all the operations take place (the name
     of this panel is printed in italics). The second panel is
     used to point out the place to copy, move or link files, as
     well as to present information about the current directory
     (see the ^L command). The TAB command (Tab or ^I key) serves
     as a fast way to select another panel as the current one,
     the key ^U is used to swap panels on the screen.

     System commands are executed from DECO in the same manner,
     as from the usual interpreter sh or csh (see below, Running
     UNIX Commands). DECO calls for the csh interpreter to exe-
     cute commands. The single restriction is that SHELL is res-
     tarted each time, so variable values, aliases, jobs, etc.
     are not memorized.  Initially, DECO is set to the screen
     mode, where panels, status line (in the upper part of the
     screen, which includes the names of machine, user, terminal
     and current time), and hint line (in the lower part of the
     screen) are displayed. In this mode, all DECO commands are



Printed 5/4/91                                                  2






DECO(1)             UNIX Programmer's Manual              DECO(1)



     executed (F1 - F10 and others). After a DECO command is
     over, DECO remains in the command input mode. No panels and
     prompts are displayed in this mode (for faster operation).
     In this mode, only system commands are executed, as well as
     some DECO commands, such as ^B (operation with History com-
     mands journal). Once an empty command (Return) is entered,
     DECO returns to the screen mode, and panels are displayed.
     In some cases, DECO can move to the screen mode without
     highlighting the panels (for example, calling for History
     from the non-screen mode). During operations with different
     menus, DECO moves to the menu mode. In this case, the com-
     mands listed in the menu are executed, arrows move the cur-
     sor along the menu, F10 means always "Cancel the MENU mode".

EExxeeccuuttiinngg UUnniixx CCoommmmaannddss
     DECO is usually set to the screen mode when you can use
     arrows to travel across the directory and select files, as
     well as form a command line by entering characters. You can
     add the names of the current and selected files to the end
     of the command line by the LineFeed or ^J commands. Using ^E
     and ^X commands, it is possible to move along the History,
     i.e. to "recall" previously executed commands. To erase the
     command line, use the ^Y command.

     System commands executed are memorized in the History. You
     can call for History from the DECO main menu, as well as by
     the ^B command. In History, arrows move the cursor along the
     commands, the ^J command serves to insert the current file
     name into the command line, Return - to insert the current
     file name and execute the command.

     The EDIT mode serves to correct the command line. This mode
     is characterized by the fact that a directory name is not
     italicized in DECO panels. The ^P command turns this mode on
     and off. In EDIT, arrows move the cursor along the command
     line and across History. Commands Del or ^G delete charac-
     ters under the cursor.

     Command ^V serves for quoting non-printable characters.
     Next symbol, following this command, will be inserted into
     command line.

FFiillee TTyyppeess
     DECO differs regular, special files and directories.  Type
     of file is marked to the left of file name by character tag.
     There are following file tags:

     space
          regular file

     *    executable file




Printed 5/4/91                                                  3






DECO(1)             UNIX Programmer's Manual              DECO(1)



     /    directory

     &    inaccessible directory

     $    character device

     #    block device

     =    FIFO file

     ~    symbolic link

     @    inaccessible symbolic link

     !    named socket

HHaannddlliinngg SSeelleecctteedd FFiilleess
     Selected files are used to set filenames for commands. Only
     regular files can be selected. To select the files (and to
     cancel the selection), the following commands can be used:

     Ins or ^T
          Toggle selection of current file

     +    Select group of files according to the pattern

     -    Unselect group of files according to the pattern

     If there are no selected files, the current file is used in
     the command.

EEnntteerriinngg MMeennuu
     F9 brings you to the MENU mode. To execute the command,
     select the desired command and press Return.

     The menu's structure is given below. Many commands can be
     called for without panel mode, the corresponding keys are
     given in the right column:

           Left /
                Brief
                Long
                Full
                Status                  ^L
                Align extensions
                Sort by name
                Extension
                Time
                Size
                Unsorted
                Reverse
                Sort by type



Printed 5/4/91                                                  4






DECO(1)             UNIX Programmer's Manual              DECO(1)



                Re-read                 ^R
                Pattern
           Files /
                Help                    F1
                User menu               F2
                View                    F3
                Edit                    F4
                Copy                    F5
                Link
                Symlink
                Rename/move             F6
                Make directory          F7
                Delete                  F8
                Select group            +
                Unselect group          -
                Quit                    F10
           Commands /
                Run subshell
                Compare directories
                Find file               ^K
                History                 ^B
                Home directory          ^\
                Root directory          ^_
                Redraw screen           ^]
                Menu file edit
                Extensions file edit
           Options /
                Switch panels           ^I
                Swap panels             ^U
                Full screen             ^F
                Double width            ^W
                Command line mode       ^P
                Show hidden files
                Viewer...
                Editor...
                Shell...
                Save setup
           Right /
                Brief
                Long
                Full
                Status                  ^L
                Align extensions
                Sort by name
                Extension
                Time
                Size
                Unsorted
                Reverse
                Sort by type
                Re-read                 ^R
                Pattern



Printed 5/4/91                                                  5






DECO(1)             UNIX Programmer's Manual              DECO(1)



     Commands from the menu are described in detail below.

CCuussttoommiizziinngg PPaanneellss
     LEFT and RIGHT sections are used to alter states of the left
     and right panels, respectively. The commands Brief, Long,
     Full set different levels of detailization of information
     about files. The command Status turns the status panel on
     and off, this panel is situated in the opposite panel.  Com-
     mand Align extensions switches mode of flushing file name
     extensions to the right margin.

     The next group of commands manages sorting of file names
     inside window.  Files are sorted by type (directory, block
     device, etc.) and inside each type - by some parameter
     (name, extension, size, modification time).  Commands
     Sort by name, Extension, Time, Size choose mode of sorting
     by parameter.  Command Unsorted turns off parameter sorting
     mode.  Command Sort by type turns off sorting by file type.
     Command Reverse sets reverse sorting mode.

     The command Re-read re-reads the directory. The command Pat-
     tern sets a pattern of "visible" filenames. The pattern is
     set according to the usual UNIX rules of handling filenames:
     ? means "any symbol", * means "any number of any symbols",
     [symbols] - "any of these symbols", ^ in the first position
     - "every file not matching the pattern". See `File Patterns'
     for more detail. For example, the pattern "^*.[bo]" means
     "not to show object and backup files".

HHaannddlliinngg FFiilleess
     The FILES section is intended for operating files. Most com-
     mands of this section are placed on the functional keyboard.
     Copy, link, and move commands use another panel to show the
     place to copy, move or link files to by default.

     Help - F1
          Get help.

     User menu - F2
          Enter user-defined menu.

     View - F3
          View the contents of the current file. The built-in
          facility is used by default. Using the command
          Options/Viewer, you can set the name of an external
          utility, e.g., ``more''. The command `Options/Save
          setup' saves the set-up.

     Edit - F4
          Edit the current file. The built-in editor is used by
          default. Using the Options/Editor command, you can set
          the name of an external editor, e.g., ``vi'', and, by



Printed 5/4/91                                                  6






DECO(1)             UNIX Programmer's Manual              DECO(1)



          means of the command Options/Save, you can store it for
          future recalling.

     Copy - F5
          Copy the current or selected files.

     Rename/move - F6
          Move the files or the directory.

     Make directory - F7
          Create a new directory.

     Delete - F8
          Delete the files or the directory.

     Link Make a reference to the file.

     Symlink
          Make a symbolic reference to the file.

     Select group - +
          Select group of files.

     Unselect group - -
          Unselect group of files.

OOtthheerr CCoommmmaannddss
     The Commands section includes various commands:

     Run subshell
          Temporary exit into system shell (cshell). The exit
          command returns you to DECO.

     Compare directories
          Compare the left and right directories. Files, which
          are different, are selected.

     Find file
          Place the cursor onto the file by its name.

     History
          Enter the command history menu. Select the command and
          press Return or ^M to execute it. Pressing LineFeed or
          ^J, you can insert the command into the command line
          and re-edit it.

     Home directory
          Return to the home directory.

     Root directory
          Return to the root directory (/).




Printed 5/4/91                                                  7






DECO(1)             UNIX Programmer's Manual              DECO(1)



     Redraw screen
          Redraw the screen.

     Menu file edit
          Edit user menu file.

     Extensions file edit
          Edit extension file.

AAddjjuussttiinngg MMooddeess
     The Options section serves to set and save DECO operation
     modes:

     Switch panels
          Move to the opposite panel.

     Swap panels
          Swap panels on the screen

     Full screen
          Adjust the panels' height to the full-screen size

     Double width
          Adjust the panels' width to the full-screen size

     Command line mode
          Switch the command line editing mode on and off. In
          this mode, the arrows move only along the command line.

     Show hidden files
          Hide files, whose names begin with dot.

     Viewer
          Sets an external viewer utility to go through the files

     Editor
          Sets a new external editor utility

     Shell
          Choose one of system command interpreters, /bin/sh or
          /bin/csh.

     Save setup
          Saves the settings in the file ~/.decoini. When DECO is
          started up, the files ~/.decoini, or
          /usr/local/lib/deco/initfile, or /usr/lib/deco/initfile
          are read.

BBuuiilltt--iinn CCoommmmaannddss
     cd

     chdir



Printed 5/4/91                                                  8






DECO(1)             UNIX Programmer's Manual              DECO(1)



          Go to home directory.

     cd dirname

     chdir dirname
          Go to specified directory.

     set name value

     setenv name value
          Set value of global variable.

     unset name

     unsetenv name
          Delete global variable.

     env

     printenv
          Print list of global variables.

     pwd  Print current directory name.

     exit Exit from DECO.

BBuuiilltt--iinn EEddiittoorr CCoommmmaannddss
     The following commands are available in the built-in editor:

     Arrows
          Move cursor through the file.

     Printable characters
          Insert characters into the text.

     Del  Delete the character under the cursor.

     BackSpace
          Delete the character to the left of the cursor.

     ^Y   Delete the current line.

     ^K   Delete the text starting from the cursor till the end
          of line.

     Save - F2
          Save the file.

     Raw - F3
          Switch the displaying characters with codes greater
          than 127.




Printed 5/4/91                                                  9






DECO(1)             UNIX Programmer's Manual              DECO(1)



     Top - F5
          Go to the beginning of the file.

     Bottom - F6
          Go to the end of the file.

     Search - F7
          Text/binary search.

     Home - F8
          Go to the beginning of the screen.

     Spaces - F9
          Switch on/off the space and tabulation displaying mode.
          Spaces are designated by dim points, and tabulations -
          by dim underlines.

     Quit - F10
          Exit the editor.

UUsseerr MMeennuuss
     DECO has a possibility to create menus defined by the user.
     The Command F2 reads the file .menu, which includes the
     description of the menu. If the file .menu is not found, the
     file ~/.menu, or /usr/local/lib/deco/menu, or
     /usr/lib/deco/menu is being read. The menu description file
     has the following structure:

           # Comments

           <character>    <description of command>
                    <command>

           <character>    <description of command>
                    <command>
           . . .

     The character is either a Roman letter, or a digit, or a
     name of the functional keys F1- F10. If you press the key, a
     command of the menu is executed. The command may include
     macros like %X which are replaced in the following way:

           %f     name of current file
           %b     name of current file without extension
           %t     list of selected files
           %d     name of current catalogue
           %c     full name of current catalogue
           %h     full name of home catalogue
           %u     name of user
           %g     name of group of users
           %%     symbol '%'




Printed 5/4/91                                                 10






DECO(1)             UNIX Programmer's Manual              DECO(1)



     Command can begin with the following control symbols:

     -    Remain in the panel mode after execution.

     @    Don't append this command to command history.

     !    Interpret command string as file name and read user
          menu from this file.  Using this feature you can imple-
          ment submenus.

     Here is an example of the user menu file:

           F1     Main menu
               !%h/.menu
           F2     Default menu
               !/usr/lib/deco/menu
           w      Count lines of source code
               wc *.h *.c
           b      Remove bak files
               -@rm -f *.b *.b
           d      Show my processes
               ps -fu %u
           s      Synchronize disks
               -@sync

EExxeeccuuttiinngg FFiilleess
     If the command line is empty when Return or ^M is pressed in
     the panel mode, and the current file is the directory, DECO
     moves to this directory. If the current file is an execut-
     able one, it is executed. If the current file is a usual
     regular one, then the command that corresponds its name is
     executed. The command is described in the file ~/.deco. This
     allows the user to fulfill operations for each file, which
     depend on the name of this file, e.g., to start the C com-
     piler for the files named *.c, to start the make utility for
     the file Makefile, etc.

     If the file ~/.deco is not found, file
     /usr/local/lib/deco/profile, or /usr/lib/deco/profile is
     being read.

     The file, in which operations are described by name, has the
     following structure:

           # Comments

           <pattern 1> <pattern 2>...<pattern N>
               <command>

           <pattern 1> <pattern 2>...<pattern N>
               <command>
           . . .



Printed 5/4/91                                                 11






DECO(1)             UNIX Programmer's Manual              DECO(1)



     The command can include macros (see User's menu).

     An example of the file ~/.deco:

           .menu .deco .cshrc .login *.c *.h
                 re %f
           *.b
                 rm %f
           Makefile makefile *.mk
                 make -f %f
           core
                 adb
           *.o
                 nm %f | more
           *.a
                 ar tv %f | more

FFiillee nnaammee ppaatttteerrnnss
     Patterns of filenames can include the following metasymbols:

     *    Arbitrary symbol sequence. It can be empty.

     ?    Arbitrary symbol.

     [abcx-y]
          Arbitrary symbol from the selected set.

     [^abcx-y]
          Arbitrary symbol outside the set.

     ^    If placed at the beginning of pattern, this metasymbol
          negates the meaning of pattern.

FFIILLEESS
     ~/.decoini
     /usr/local/lib/deco/initfile
     /usr/lib/deco/initfile

          Files of modes and initial settings.

     .menu
     ~/.menu
     /usr/local/lib/deco/menu
     /usr/lib/deco/menu

          Menu description files.

     ~/.deco
     /usr/local/lib/deco/profile
     /usr/lib/deco/profile

          Files for describing of operations by name.



Printed 5/4/91                                                 12






DECO(1)             UNIX Programmer's Manual              DECO(1)



NNOOTTEESS
     If the screen display is distorted, you can restore it by
     the command ^].

RREEFFEERREENNCCEESS
     csh (1), termcap (5)

















































Printed 5/4/91                                                 13



