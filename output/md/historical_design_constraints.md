<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="historical_design_constraints"></span>Historical Design Constraints

</div>

</div>

</div>

This is a passing thought for whoever comes this way in the future, to
understand why some things about the compiler are the way they are.

GCBASIC was not originally written to be programmed by typing free-form
text. It was originally constrained, controlled, and syntax-checked by
Great Cow Graphical BASIC (GCGB) - see <span
class="strong">**BACKGROUND**</span> above for GCGB’s origin. In GCGB, a
program is built by dragging and connecting graphical blocks, each
corresponding to a GCBASIC command. Because the palette of blocks and
the ways they can be connected are both fixed by the graphical tool,
GCGB inherently limited both what a program could express and how
complex any single expression could become - you simply could not drag
together a combination the tool didn’t support. That constraint doubled
as a syntax check: if GCGB would let you build it, it was valid GCBASIC
by construction.

Moving to a freehand, text-based IDE removed that built-in ceiling.
Users could now type any combination of operators and conditions they
liked, whether or not anything resembling it had ever been produced by
GCGB. Responsibility for validating what is typed therefore shifted from
GCGB’s graphical constraints onto the compiler itself - and, as Note \#4
above describes, the compiler was never built around a complete
reference grammar; it grew up assuming inputs shaped like what GCGB
could produce. A great deal of the compiler’s ongoing development has
been - and continues to be - closing that gap, adding syntax checking
for cases free-text users reach that GCGB’s graphical constraints made
impossible.

Some of these gaps, though, are not simply unfinished work - they are
places where the underlying calculation and parsing logic was never
designed to handle the complexity a free-text user can now type, because
GCGB could never have produced that complexity in the first place. The
bitwise-comparison limit enforced in `ExpandShifts` (Note \#5 above) is
a clear example: GCGB’s graphical blocks never allowed chaining more
than two AND/OR conditions into a single bitwise compare, so the
expression-evaluation logic underneath was never engineered to resolve
deeper nesting correctly. A free-text user can type such an expression
today, but the compiler cannot reliably evaluate it - and fixing that is
not a small correction to an existing check, it would mean
re-engineering a foundational part of the expression evaluator. That is
a substantially larger undertaking than the current development team can
take on, so this particular limit is enforced rather than supported.

The practical lesson: when something in GCBASIC seems arbitrarily
restrictive rather than simply buggy, it is worth asking whether the
restriction traces back to what GCGB could originally produce. If so,
treat it as a structural constraint inherited from the compiler’s
origins, not an oversight waiting for a quick fix.

  

<span class="strong">**FreeBASIC COMPILATION OF GCBASIC SOURCE
CODE**</span>

The compiler is relatively simple in terms of the compilation.

Use the following versions of the FreeBASIC compiler to compile the
GCBASIC source code.

For Windows 32 bit

``` programlisting
    FreeBASIC Compiler - Version 1.07.1 (2019-09-27), built for win32 (32bit)
    Copyright (C) 2004-2019 The FreeBASIC development team.
```

For Windows 64 bit

``` programlisting
    FreeBASIC Compiler - Version 1.07.1 (2019-09-27), built for win64 (64bit)
    Copyright (C) 2004-2019 The FreeBASIC development team.
```

Using other versions of the Windows FreeBASIC compiler is NOT tested and
may fail. Use the specific versions shown above.

The compiler uses the following command lines. Where `%ProgramFiles%` is
the root location of the FreeBASIC installation, and `$SF` is the
location of the source files and the destination of the compiled
executable.

For Windows 32 bit

``` programlisting
    "%ProgramFiles%\FreeBASIC\win32\fbc.exe"  $SF\gcbasic.bas   -exx -arch 586 -x $SF\gcbasic32.exe
```

For Windows 64 bit

``` programlisting
    "%ProgramFiles%\FreeBASIC\win64\fbc.exe"  $SF\gcbasic.bas   -x $SF\gcbasic64.exe -ex
```

Linux, FreeBSD, and Pi OS are also supported. Please see [Online
Help](https://gcbasic.sourceforge.net/help/) and search for the specific
operating system.

  
  

<span class="strong">**FreeBASIC COMPILER TOOLCHAIN**</span>

To simplify the establishment of a development environment, download a
complete installation from
[here](https://sourceforge.net/projects/gcbasic/files/Support%20Files/GCBASICWindowsToolchain/FreeBASIC.zip/download).
This includes the correct version of FreeBASIC and the libraries - all
ready for use. Simply unzip the ZIP to a folder, and the toolchain is
ready for use. For an IDE, please see the information above.

  
  

<span class="strong">**BUILDING THE GCBASIC EXECUTABLE USING THE FBEDIT
IDE**</span>

To build GCBASIC from the source files. The list shows the installation
of the FBEdit IDE.

Complete the following:

``` programlisting
        1. Download and install FreeBASIC from the url shown above.
        2. Download and install fbedit from https://sourceforge.net/projects/fbedit/?source=dlp[SourceForge]
        3. Download the GCBASIC source using SVN into a gcbasic source folder.
        4. Run fbedit (installed at step #2).  Load project  GCBASIC.fbp  from the GCBASIC source folder.
        5. Hit <f5> to compile.
```

  
  

<span class="strong">**CODING STYLES**</span>

Remember, Hugh was 12 when he started this project. You must forgive him
for being a genius, but he did not implement many programming styles and
conventions that are commonplace today.

There is a general lack of documentation. We are adding documentation as
we progress. This can make the source frustrating initially, but you can
find the code segments, as they are clearly within method blocks.

The following rules are recommended.

``` programlisting
    1. All CONSTANTS are capitalized
    2. Do not use TAB - use two spaces
    3. You can rename a variable to a meaningful name.  Hugh used a lot of single character variables many years ago.  This should be avoided in new code.
    4. Document as you progress.
    5. Ask for help.
```

  

</div>
