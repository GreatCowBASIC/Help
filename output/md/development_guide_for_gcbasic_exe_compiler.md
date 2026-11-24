<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="development_guide_for_gcbasic_exe_compiler"></span>Development Guide for GCBASIC.EXE compiler

</div>

</div>

</div>

There are lots of ways to contribute to the GCBASIC project: coding,
testing, improving the build process and tools, or contributing to the
documentation. This guide provides information that will not only help
you get started as a GCBASIC contributor, but that will also be useful
to you as an experienced contributor wanting to help.

  

<span class="strong">**Need Help?**</span>

The GCBASIC community prides itself on being an open, accessible, and
friendly community for new participants. If you have difficulties
getting involved or finding answers to your questions, please bring
those questions to the forum via the discussion boards, where we can
help you get started.

We know that, even before you start contributing, getting started can be
a challenge. This guide is intended to help. We are always looking for
ways to improve the software: making GCBASIC more open, accessible, and
easier to participate in. If you are having any trouble following this
guide, or hit a barrier you cannot get around, please contact us via the
discussion forum. We will solve hurdles for new contributors and make
GCBASIC better.

This addresses the changes and updates to the GCBASIC compiler.

  
  

<span class="strong">**BACKGROUND**</span>

The compiler was created by Dr. Hugh Considine when he was 12 years old.
That was in 2005. Hugh came up with the idea for a new compiler because
the then-available compilers were hard to use and not free. And he had
some spare time.

Hugh believes that GCBASIC should be free to all - forever.

The original software was called Great Cow BASIC, but he had some
resistance in getting high schools in Australia to agree to the use of
text-based programming. Graphical GCBASIC was created to address the
need for a graphical user interface. Graphical GCBASIC acts like a set
of training wheels. The concept of Graphical GCBASIC is that the icons
make it less intimidating, and since they all share names with the BASIC
commands, it is easy to remember which command corresponds to each icon.
Using Graphical GCBASIC, users can then switch to text mode whenever
they want to, go backwards and forwards a few times if they want, and
finally end up using just the text programming. It is a journey from a
graphical user interface to text-based programming.  
  
Those who already have programming experience can go straight to
GCBASIC, while those who would prefer a lighter learning curve can take
the Graphical GCBASIC option. The two approaches target two different
sets of users who ultimately want to do the same thing.  
  
As for the <span class="strong">**name**</span>, it was the fourth name
Hugh tried. The first name was BASPIC, but it did not seem memorable
enough. Then he considered some animal names - the first thought was
Chipmunk BASIC, but someone already used that. Then Bear BASIC, but he
decided against it on finding out the slang meaning of "bear". The final
name was GCBASIC, named after something his sister and he came up with
(when aged 12 and 15). No one else had that name, it had no meanings
that could offend, and it was something odd enough to be memorable, so
Great Cow BASIC it was.

In 2013 Evan Venn joined the team as a compiler developer, with others
joining including Bernd Dau, Trevor Roydhouse, Pete Everett, Theo
Loermans, Giuseppe D’Elia, Derek Gore, Ian Smith, Urs Hopp, Kent
Schafer, and Frank Steinberg. Some of those who joined drove changes to
the compiler, some changed the source code, some built tools, and some
built libraries. They all had one thing in common - improvements to the
GCBASIC compiler.

In 2021 we were still having new developers join the project, like ToniG
adding a new capability for handling Tables.

In 2023 we renamed to GCBASIC. The Cow is now deadbeef …​ a hex number.

  
  

<span class="strong">**THE COMPILER**</span>

The compiler executable is called GCBASIC.EXE. The compiler source is
written in FreeBASIC. FreeBASIC is a multiplatform, free/open source
(GPL) BASIC programming language and a compiler for Microsoft Windows,
protected-mode MS-DOS (DOS extender), Linux, and FreeBSD.  
  
The official website is [FreeBASIC
website](https://www.freebasic.net/)  
  
FreeBASIC provides syntax compatibility with programs originally written
in Microsoft QuickBASIC (QB). FreeBASIC is a command-line-only compiler,
unless users manually install an external integrated development
environment (IDE) of their choice. IDEs specifically made for FreeBASIC
include FBide and FbEdit, while more graphical options include WinFBE
Suite and VisualFBEditor.  
  
The source code is Open Source, and has a GNU GENERAL PUBLIC LICENSE.  
  
The source code for the compiler can be found on
[SourceForge](https://sourceforge.net/p/gcbasic/code/HEAD/tree/GCBASIC/trunk/)  
  
Use SVN to update and commit code changes. You require developer access
to SourceForge, but if you have got this far then you already know this.
You are therefore required to use SVN for source code management.

When committing, you MUST update the change log; when you commit an
update, use the change log entry with the SourceForge commit number.
Then add the new change at the end of the change log. The commit message
should be the same as the description in the change log. Add the
`[COMMIT NUMBER]` to the description in the change log to show the
commit number.

You will find the changelog
[here](https://onedrive.live.com/Edit.aspx?resid=2F87FFE77F3DBEC7!67634&wd=cpe&authkey=!ADmkT3exl5l4Pkc).
The change log is an Excel spreadsheet.

  
  

<span class="strong">**COMPILER ARCHITECTURE**</span>

The compiler is relatively simple in terms of the architecture. There is
a main source program with a set of header files that contain other
methods or declarations. The GCBASIC header files are the following:

``` programlisting
    1. preprocessor.bi -  methods, statements, defines, declarations, prototypes, constants, enumerations, or similar types of statements
    2. utils.bi - methods that are shared across the architecture
    3. variables.bi - methods that control the creation and management of variables
    4. assembly.bi - methods specific to the generation of GCAssembler (GCASM)
    5. file.bi - the FreeBASIC files library
    6. string.bi - the FreeBASIC string library
```

The supporting files are:

``` programlisting
    1. messages.dat - the English messages source file.  All user messages from the compiler are sourced from this file.
    2. reservedwords.dat - the list of system reserved words
    3. lowlevel.dat - the list of header files, from include\lowlevel\, that are included by default
```

  
  

`lowlevel.dat` is a plain text file, one file name per line, such as
`usart.h`, `hwspi.h` and `string.h`. Every header file it lists is
loaded into every compile by default, without the user needing an
explicit `#include` - see Note \#6 below for exactly where and how this
happens. The compiler process is simple. The process, shown below,
generates the ASM source and the HEX file from the user source program.

``` programlisting
    1. Create the indexes
    2. Declare the methods, arrays and variables
    3. Process the user source programs using PreProcessor method. This includes
        i.     Loading of all source files including include files (see Note #6 below)
        ii.    Translate files, if needed
        iii.   Examine source for comments, tables, asm, rawasm, functions;subs;macros, set origin of valid code
                    Origin = ";?F" + Str(RF) + "L" + Str(LC) + "S" + Str(SBC) + "?"
                    RF = File number
                    L  = Line number in source file
                    S  = Sub Routine number
        iv.    Find compiler directives, except SCRIPT, ENDSCRIPT, IFDEF and ENDIF - including all the #DEFINEs outside of conditional statements
        v.     If GLCD_TYPE in user source program is found, then determine the library and load that library with all dependent libraries. This method improves compiler performance by only loading the required libraries
        vi.    ReadChipData
        vii.   CheckClockSpeed
        viii.  ReadOptions
        ix.    PreparePageData
        x.     PrepareBuiltIn.  Initialise built-in data, and prepare built-in subs.
        xi.    RunScripts
        xii.   BuildMemoryMap
        xiii.  Process samevar and samebit
        xiv.   RemIfDefs.  Remove any #IFDEFs that do not apply to the program.
        xv.    Prepare programmer, need to know chip model and need to do this before checking config
        xvi.   Replace Constants
        xvii.  ExpandShifts.  Normalise shift-operator (<<, >>) expressions in the source so they parse correctly, ahead of table/constant substitution.  Also enforces a bitwise-comparison complexity limit - a line combining more than two AND/OR operations is rejected (see Note #5 below).
        xviii. Replace table value.  Replace constants and calculations in tables with actual values
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
         xx.   FindAssembly.  Anything not matched by the steps above is checked against the target chip's real instruction set and, if recognised, passed through as assembly (see Note #4 below).
    5. Allocate RAM using the AllocateRAM method
    6. Optimise the generated code using the TidyProgram method
    7. Combine and locate the subroutines and functions for the selected chip using the MergeSubroutines method
    8. Complete the final optimisation using the FinalOptimise method
    9. Recalculate subroutine sizes using the RecalcSubSizes method, so that program-memory usage reflects the actual post-optimisation word counts (Step 8's call-to-rcall optimisation, for example, changes instruction sizes)
    10. Write the assembly using the WriteAssembly method
    11. Assemble and generate the hex file using GCASM, MPASM, PICAS or some other defined Assembler
    12. Optionally, pass programming operations to the programmer
    13. Write compilation report using the WriteCompilationReport method
    14. If needed, write the error and warning log using the WriteErrorLog method
    15. Exit, setting the ERRORLEVEL
```

Note \#1: Constants can be created in many places, and the order is
critical when trying to understand the process.

Step 3.iv; Step 3.xi, 3.xiv and xvi. These are Find compiler directives;
RunScripts, process IFDEFs, and replace Constants values, respectively.
This means constants that are not created by the Find compiler
directives step are clearly not available in the RunScripts step, and
the same applies to the process IFDEFs step. So, please consider the
order of constant creation in terms of these steps. Always think about
the precedence of constant creation.

Note \#2: When using IFDEFs conditional statements, you should
`#UNDEFINE` all constants prior to `#DEFINE`. Whilst there will be cases
where the constant does not exist, or where the preprocessor can
determine the outcome of the conditional statements, there will be
cases, specifically nested IFDEFs conditional statements, where you will
be required to use `#UNDEFINE` to remove all warnings.

Note \#3: Good practice is NOT to create constants in a library where
the user can overwrite the value of the same constant. You must
determine if the user has created the constant, and then create a
default value if the user has not defined one. An example:

``` programlisting
  IF NODEF(AD_DELAY) THEN
     'Acquisition time. Can be reduced in some circumstances - see PIC manual for details
     AD_DELAY = 2 10US
  END IF
```

This will create the constant AD\_DELAY only when the user program does
not define a value.  

Note \#4: GCBASIC has no reference grammar that every line of source
must match. Step 3.x (`PrepareBuiltIn`) indexes every Sub and Function
the compiler recognizes - the built-in commands, plus everything defined
by the libraries the program has loaded - before a single line of the
user’s code is compiled. From that point, compiling a line of code (Step
4) works by elimination: if the line is a recognized GCBASIC command, or
a call to one of the indexed Subs/Functions, it is compiled as such. If
it is neither, the compiler assumes the line must be assembly and passes
it to the target chip’s assembler unchanged (aside from substituting any
GCBASIC constants/variables it recognizes on the line). This check is
performed by `IsASM` (`assembly.bi`), which looks the line’s leading
word up in the real instruction table for the selected chip family - so
a line such as `MOVWF Display,ACCESS` needs no `Asm` or `#asmraw`
keyword at all; it is recognized as a genuine instruction for the target
chip and passed straight through. `#asmraw` is the one exception to this
lookup - a `#asmraw` line is always treated as assembly unconditionally,
regardless of whether its content matches a known instruction.  

This is also why the compilation summary’s `Subroutines` line can look
surprising, for example:

``` programlisting
    Summary:
         Compiled:
              Program lines: 2
              Subroutines:  User: 0 ; System: 1 of 486 ; Total: 1
```

The `486` is the total number of system Subs/Functions indexed in Step
3.x for this compile (built-in commands plus whatever the loaded
libraries define) - not how many were actually used. `System: 1 of 486`
means only 1 of those 486 indexed routines was actually called by this
particular two-line program; the rest were indexed (so the compiler
could recognize a call to any of them) but never referenced, and so
contribute nothing to the compiled output.  

One direct consequence: because unrecognized lines fall through to
assembly rather than being rejected outright, GCBASIC’s own compile step
is not a full syntax check. A line with a typo in an intended command
name, or a genuine assembly mnemonic used incorrectly, can compile
without error at the GCBASIC stage and only surface as a failure when
GCASM, MPASM, PIC-AS, or AVR2ASM actually assembles the generated ASM
into the HEX file. Treat a successful GCBASIC compile as "no
unrecognized commands, and everything that looked like assembly was
valid enough to pass through" - the true syntax check is the assembler
step that follows.  

Note \#5: Step 3.xvii (`ExpandShifts`) is also where the compiler
enforces a hard limit on bitwise-comparison complexity - a line
combining more than two AND/OR operations is rejected with "More than
two AND/OR statements - reduce complexity." This is not an arbitrary
restriction the current team could simply lift; see
<a href="historical_design_constraints" class="link" title="Historical Design Constraints">Historical Design Constraints</a>
below for why.  

Note \#6: Step 3.i (loading of all source files) is implemented in
`preprocessor.bi`, not `gcbasic.bas` itself. It first resolves every
explicit `#include` in the user’s own program, and every `#include`
found inside those files in turn, repeating until a pass discovers no
new files. Only once that is exhausted does it load `lowlevel.dat`: it
opens `include\lowlevel.dat` (the extension is normally `.dat`, but can
be overridden with `overridelowleveldatfileextextension` for testing),
reads it one line at a time, skips comment lines (starting with `'`),
and for every other line builds the path `include\lowlevel\<filename>`
and adds that file to the source-file list with `SystemInclude = -1`,
unless it is already loaded or listed in the compiler’s ignore-file
list. This means every file `lowlevel.dat` names - `usart.h`, `hwspi.h`,
`string.h`, and the rest - is loaded into every single compile
unconditionally; there is no check here for whether the user actually
defined `USART_BAUD_RATE` or any other enabling constant. It is the
conditional-compilation guards inside each of those header files (their
own `#IF`/`#IFDEF` checks against the user’s constants) that decide
whether any of the loaded code actually ends up in the compiled program.
This is also why a command like `HSerSend` needs no explicit `#include`:
`usart.h` is already loaded by the time the user’s program is compiled,
purely because it is listed in `lowlevel.dat`. If one of these listed
files cannot be found on disk - a broken or incomplete installation -
the compiler reports it immediately with "Essential file missing" and
stops, naming the missing file, rather than silently continuing without
it (see
<a href="constraints_and_error_messages_overview" class="link" title="Constraints and Error Messages Overview">Constraints and Error Messages</a>).  

</div>
