<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="development_guide_for_gcbasic_exe_compiler"></span>Development Guide for GCBASIC.EXE compiler

</div>

</div>

</div>

There are lots of ways to contribute to the Great Cow BASIC project:
coding, testing, improving the build process and tools, or contributing
to the documentation. This guide provides information that will not only
help you get started as a Great Cow BASIC contributor, but that you will
inform you as an experienced contributor wanting to help.

  

<span class="strong">**Need Help?**</span>

The Great Cow BASIC community prides itself on being an open,
accessible, and friendly community for new participants.   If you have
difficulties getting involved or finding answers to your questions,
please bring those questions to the forum via the discussion boards,
where we can help you get started.

We know EVEN before you start contributing that getting can be a
challenge.   This guide is intended to help.   We are always looking for
ways to improve the software: making Great Cow BASIC more open,
accessible, and easier to participate with.   If you are having any
trouble following this guide, or hit a barrier you cannot get around,
please contact us via the discussion forum.   We will solve hurdles for
new contributors and make Great Cow BASIC better.  

This addresses the changes and updates to the Great Cow BASIC
compiler.  

  
  

<span class="strong">**BACKGROUND**</span>

The compiler was created by Dr. Hugh Considine when he was 12 years
old.  That was in 2005.  Hugh came up with the idea for a new compiler -
of the then available compilers - they were hard to use and not free.
  And, he had some spare time.

Hugh believes that Great Cow BASIC should be free to all - forever.  

The original software was called GCBASIC, but, he had some resistance in
getting high schools in Australia to use and agree to the use of text
based programming.   Great Cow Graphical BASIC was created to address
the need for a graphical user interface.  Great Cow Graphical BASIC acts
like a set of training wheels.    The concept of Great Cow Graphical
BASIC is that the icons make it less scary, and since they all share
names with the BASIC commands it is then easy to remember what command
corresponds to each icon..   Using Great Cow Graphical BASIC users can
then switch to text mode whenever they want to, go backwards and
forwards a few times if they want, and finally end up using just the
text programming.   It is a journey from a graphical user interface to
text based programming.    
  
Those who already have programming experience can go straight to Great
Cow BASIC, while those who would prefer a lighter learning curve can
take the Great Cow Graphical BASIC option.    The two approaches targets
two different sets of users who ultimately want to do the same thing.  
  
As for the <span class="strong">**name**</span>, it was about the fourth
name Hugh tried.   First name was BASPIC, but it did not seem memorable
enough.   Then, he considered some animal names - first thought was
Chipmunk BASIC, but someone already used that!   Then, Bear BASIC, but
decided against it on finding out the slang meaning of bear.   Final
name was Great Cow BASIC, which is named after something his sister and
he came up with (when aged 12 and 15!!).   No-one else had that name, it
had no meanings that could offend, and it was something odd enough to be
memorable, so Great Cow BASIC it was.

In 2013 Evan Venn joined the team as a compiler developer, with others
joining in Bernd Dau, Trevor Roydhouse, Pete Everett, Theo Loermans,
Giuseppe D’Elia, Derek Gore, Ian Smith, Bernd Dau, Theo Loermans, Urs
Hopp, Kent Schafer, and Frank Steinberg.   Some those that joined in
drove changes to the compiler, some changed the source code, some built
tools and some built libraries.   They all had one thing in common -
improvements to the Great Cow BASIC compiler.

In 2021 we are still having new developers join the project like ToniG
adding a new capability for handling Tables.

  
  

<span class="strong">**THE COMPILER**</span>

The compiler executable is called GCBASIC.EXE.    The compiler source is
written in FreeBASIC.   FreeBASIC is a multiplatform, free/open source
(GPL) BASIC programming language and a compiler for Microsoft Windows,
protected-mode MS-DOS (DOS extender), Linux and FreeBSD.     
  
The official website is <https://www.freebasic.net/>  
  
FreeBASIC provides syntax compatibility with programs originally written
in Microsoft QuickBASIC (QB).   FreeBASIC is a command line only
compiler, unless users manually install an external integrated
development environment (IDE) of their choice.   IDEs specifically made
for FreeBASIC include FBide and FbEdit, while more graphical options
include WinFBE Suite and VisualFBEditor.    
  
The source code is Open Source.   And, has a GNU GENERAL PUBLIC
LICENSE.    
  
The source code for the compiler can be found on
<a href="https://sourceforge.net/p/gcbasic/code/HEAD/tree/GCBASIC/trunk/" class="link">SourceForge</a>  
  
Use SVN to UPDATE and COMMIT code changes.   You require developer
access to SourceForge but if you have got this far then you already know
this.   You are therefore required to use SVN for source code
management.

When COMMITting you MUST update the change log, then, when you commit an
update use the change log with the SourceForge commit number.   Then,
add the new change at the end of the change log.   The COMMIT message
should be the same as the description in the change log.   Add the
\[<span class="emphasis">*COMMIT NUMBER\]*</span> to the description in
the change log to show the COMMIT number.  

You will find the changelog
<a href="https://onedrive.live.com/Edit.aspx?resid=2F87FFE77F3DBEC7!67634&amp;wd=cpe&amp;authkey=!ADmkT3exl5l4Pkc" class="link">here</a>.  
The change log is an EXCEL spreadsheet.  

  
  

<span class="strong">**COMPILER ARCHITECTURE**</span>

The compiler is relatively simple in terms of the architecture.   There
is a main source program with a set of header files that contain other
methods or declarations.   The GCBASIC header files are the following:

``` screen
    1. preprocessor.bi -  methods, statements, defines, declarations, prototypes, constants, enumerations, or similar types of statements
    2. utils.bi - methods that are shared across the architecture
    3. variables.bi - methods that control the creation and management of variables
    4. assembly.bi - methods specific to the generation of Great Cow Assembler (GCASM)
    5. file.bi - the FreeBASIC files library
    6. string.bi - the FreeBASIC string library
```

The supporting files are:

``` screen
    1. messages.dat - the English messages source file.  All user messages from the compiler are sourced from this file.
    2. reservedwords.dat - the list of system reserved words
```

  
  
The compiler process is simple.   The process, shown below, generates
the ASM source and the HEX file from the user source program.

``` screen
    1. Create the indexes
    2. Declare the methods, arrays and variables
    3. Process the user source programs using PreProcessor method
    4. Compile the program using the CompileProgram method
         i.    Compile calls to other subroutines, insert macros
         ii.   Compile DIMs again, in case any come through from macros
         iii.  Compile FOR commands
         iv.   Process arrays
         v.    Add system variable(s) and bit(s)
         vi.   Compile Tables
         vii.  Compile Pot
         viii. Compile Do
         ix.   Compile Dir
         x.    Compile Wait
         xi.   Compile On Interrupt
         xii.  Compile Set(s)
         xiii. Compile Rotate
         xiv.  Compile Repeat
         xv.   Compile Select
         xvi.  Compile Return
         xvii. Compile If(s)
         xviii Compile Exit Sub
         xix.  Compile Goto(s)
    5. Allocate RAM using the AllocateRAM method
    6. Optimise the generated code using the TidyProgram method
    7. Combine and locate the subroutines and functions for the selected chip using the MergeSubroutines method
    8. Complete the final optimisation using the FinalOptimise method
    9. Write the assembly using the WriteAssembly method
    10. Assemble and generate the hex file using GCASM, MPASM, PICAS or some other define Assembler
    11. Optionally, pass programming operations to the programmer
    12. Write compilation report using the WriteCompilationReport method
    13. If needed, write the error and warning log using the WriteErrorLog method
    14. Exit, setting the ERRORLEVEL
```

  

<span class="strong">**FreeBASIC COMPILATION OF GCBASIC SOURCE
CODE**</span>

The compiler is relatively simple in terms of the compilation.  

Use the following versions of the FreeBASIC compiler to compile the
GCBASIC source code.

For Windows 32 bit

``` screen
    FreeBASIC Compiler - Version 1.07.1 (2019-09-27), built for win32 (32bit)
    Copyright (C) 2004-2019 The FreeBASIC development team.
```

For Windows 64 bit

``` screen
    FreeBASIC Compiler - Version 1.07.1 (2019-09-27), built for win64 (64bit)
    Copyright (C) 2004-2019 The FreeBASIC development team.
```

Using other version of Windows FREEBASIC compiler are NOT tested and may
fail.   Use the specific versions shown above.

The compile use the following command lines. Where "%ProgramFiles% is
the root location of the FreeBASIC installation, and $SF is the location
of the source files and the destination of the compiled executable.

For Windows 32 bit

``` screen
    "%ProgramFiles%\FreeBASIC\win32\fbc.exe"  $SF\gcbasic.bas   -exx -arch 586 -x $SF\gcbasic32.exe
```

For Windows 64 bit

``` screen
    "%ProgramFiles%\FreeBASIC\win64\fbc.exe"  $SF\gcbasic.bas   -x $SF\gcbasic64.exe -ex
```

Linux, FreeBSD and Pi OS are also supported.   Please see
<a href="http://gcbasic.sourceforge.net/help/" class="link">Online Help</a>
and search for the specific operating system.  

  
  

<span class="strong">**FreeBASIC COMPILER TOOLCHAIN**</span>

To simplify the establishment of development enviroment download a
complete installation from
<a href="https://sourceforge.net/projects/gcbasic/files/Support%20Files/GreatCowBASICWindowsToolchain/FreeBASIC.zip/download" class="link">here</a>.  
This includes the correct version of FreeBASIC and the libraries - all
ready for use.   Simply unzip the ZIP to a folder and the toolchain is
ready for use.   For an IDE please see the information above.  

  
  

<span class="strong">**BUILDING THE GCBASIC EXECUTABLE USING THE FBEDIT
IDE**</span>

To build Great Cow Basic from the source files.   The list shows the
installation of the FBEdit IDE.

Complete the following:

``` screen
        1. Download and install FreeBASIC from  url shown above.
        2. Download and install fbedit from https://sourceforge.net/projects/fbedit/?source=dlp
        3. Download the GCBASIC source using SVN into a gcbasic source folder.
        4. Run fbedit (installed at step #2).  Load project  GCBASIC.fbp  from GBASIC source folder.
        5. Hit <f5> to compile.
```

  
  

<span class="strong">**CODING STYLES**</span>

Remember, Hugh was 12 when he started this project.   You must forgive
him for being a genius, but, he did not implement many programming
styles and conventions that are common place today.  

There is a general lack of documentation.   We are adding documentation
as we progress.   This can make the source frustrating initially but can
find the code segments as they are clearly within method blocks.  

The following rules are recommended.

``` screen
    1. All CONSTANTS are capitalized
    2. Do not use TAB - use two spaces
    3. You can rename a variable to a meaningful name.  Hugh used a lot of single character variables many years ago.  This should be avoided in new code.
    4. Document as you progress.
    5. Ask for help.
```

  

<span class="strong">**COMPILER SOURCE INSIGHTS**</span>

<span class="emphasis">*There are many very useful methods*</span>, a
lot of methods, look at existing code before adding any new method.  
The compiler is mature from a functionality standpoint.   Just immature
in terms of documentation.  

<span class="emphasis">*To isolate a specific issue*</span> use a binary
chop and lots of debug using PRINT.   Whilst, this may not be ideal this
is the best approach.  

<span class="emphasis">*Revert*</span> code using SVN to remove all
debug!.  Do not leave debug in the source code.  

  
  

  
  
  

</div>
