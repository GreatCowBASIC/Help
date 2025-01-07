<div class="section">

<div class="titlepage">

<div>

<div>

<span id="_command_line_parameters"></span>Command Line Parameters
------------------------------------------------------------------

</div>

</div>

</div>

<span class="strong">**About the Command Line Parameters**</span>

``` screen
    GCBASIC [/O:output.asm] [/A:assembler] [/P:programmer] [/K:{C|A}] [/H:[Y/1 | N/0]] [/V] [/L] [/NP] [/M:[Y/1 | N/0]]  filename

    GCBASIC [/O:output.asm] [/A:assembler] [/P:programmer] [/K:{C|A}] [/H:[Y/1 | N/0]] [/V] [/L] [/WX] [/M:[Y/1 | N/0]] [/NP] filename

    GCBASIC [/O:output.asm] [/A:assembler] [/P:programmer] [/K:{C|A}] [/H:[Y/1 | N/0]] [/V] [/L] [/WX] [/M:[Y/1 | N/0]] [/S:Use.ini] [/NP] filename

    GCBASIC [/O:output.asm] [/A:assembler] [/P:programmer] [/K:{C|A}] [/H:[Y/1 | N/0]] [/V] [/L] [/WX] [/M:[Y/1 | N/0]]  [/S:Use.ini] [/F[O]] [/NP] filename

    GCBASIC /version
```

<div class="informaltable">

| <span class="strong">**Switch**</span> | <span class="strong">**Description**</span>                                                                                                                                                                                                                                                                                                          | <span class="strong">**Default**</span>                           |
|:---------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------|
| `/O:filename`                          | Sets the name of the assembly file generated to `filename`.                                                                                                                                                                                                                                                                                          | Same name as the input file, but with a `.asm` extension.         |
| `/A:assembler`                         | Batch file used to call assembler<sup>(1)</sup>. If `/A:GCASM` is given, GCBASIC will use its internal assembler.                                                                                                                                                                                                                                    | The program will not be assembled                                 |
| `/CP`                                  | Exports the config bits automatically selected by the compiler to an output file called `source_filename.config`. The output file is the source filename with the extension of config.                                                                                                                                                               | None                                                              |
| `/H:[Y/1 | N/0]`                       | Set the production, or not, of the hex output file. /H:1 is the default. To prevent production of the hex output file - use /H:0                                                                                                                                                                                                                     | The default is to produce the hex output file                     |
| `/M:[Y/1 | N/0]`                       | Mute the banner messages, or not. /M:1 is the default. To prevent banner messages - use /M:0                                                                                                                                                                                                                                                         | The default is to output banner messages                          |
| `/P:programmer`                        | Batch file used to call programmer<sup>(1)</sup>. This parameter is ignored if the program is not assembled.                                                                                                                                                                                                                                         | The program will not be downloaded.                               |
| `/K:[C|A]`                             | Keep original code in assembly output. `/K:C` will save comments, `/K:A` will preserve all input code.                                                                                                                                                                                                                                               | No original code left in output.                                  |
| `/V[:[0|F][1|T]`                       | Verbose mode - compiler gives more detailed information about its activities. /Vx will overide any configuration in the user ini file.                                                                                                                                                                                                               | \-                                                                |
| `/L`                                   | Show license and exit.                                                                                                                                                                                                                                                                                                                               | \-                                                                |
| `/NP`                                  | Do not pause on errors. Use with IDEs.                                                                                                                                                                                                                                                                                                               | Pause when an error occurs, and wait for the user to press a key. |
| `/WX`                                  | Force compiler to ensure all include files are valid.                                                                                                                                                                                                                                                                                                |                                                                   |
| `/version`                             | Shown build date and version of the compiler.                                                                                                                                                                                                                                                                                                        |                                                                   |
| `/S:fsp`                               | Load the settings from a specified file, rather than use the defaults.                                                                                                                                                                                                                                                                               | /S:use.ini                                                        |
| `/F[:[0|F][1|T]`                       | Used to bypass compilation when not needed, compiler will verify that config settings in the already compiled file match those required for the programmer. If not, a recompilation will be forced. Skip compilation if the hex file is up to date and has correct config. /F:x ( F or 0) to force a fresh compile regardless of what ini specifies. |                                                                   |
| `/FO`                                  | Used to bypass compilation and program only. Compiler will verify that config settings in the already compiled file match those required for the programmer. If not, a recompilation will be forced.                                                                                                                                                 |                                                                   |
| `filename`                             | The file to compile.                                                                                                                                                                                                                                                                                                                                 | \-                                                                |

</div>

<span class="small"><sup>(1)</sup> For the `/A:` and `/P:` switches,
there are special options available. If `%FILENAME%` is present, it will
be replaced by the name of the `.asm` file. `%FN_NOEXT%` will be
replaced by the name of the `.asm` file but without an extension, and
`%CHIPMODEL%` will be replaced with the name of the chip. The name of
the chip will be the same as that on the chip data file.</span>

A batch file to load the `ASM` from GCBASIC into `MPASM`. Command line
should be like this:

``` screen
    C:\progra~1\microc~1\mpasms~1\MPASMWIN /c- /o- /q+ /l- /x- /w1 %code%.asm
```

A batch file to compile in GCBASIC then load the `ASM` from GCBASIC into
`GPASM`. Command line should be like this:

``` screen
    gcbasic.exe %1 /NP /K:A /A:"..\gputils\bin\gpasm.exe %~d1%~p1%~n1.asm"
```

To instruct MAKEHEX.BAT to use `GPASM`. You have GPUTILS installed. The
batch file should be edited as follows:

``` screen
    REM Create the ASM
    gcbasic.exe /NP /K:A %1
    REM Use GPASM piping to the GCB error log
    gpasm.exe "%~d1%~p1%~n1.asm" -k -i -w1 >> errors.txt
```

To summarise, you can use any of the following:

``` screen
    gcbasic.exe filetocompile.gcb /A:GCASM /P:"icprog -L%FILENAME%" /V /O:compiled.asm
```

GCBASIC will compile the file, then assemble the program, and run this
command:

``` screen
    `icprog -Lcompiled.hex`
```

You can also create/edit the gcbasic.ini file :

``` screen
Assembler settings
    Assembler = C:\Program Files\Microchip\MPASM Suite\mpasmwin
    AssemblerParams = /c- /o- /q+ /l+ /x- /w1 "%FileName%"

Programmer settings
    Programmer = C:\Program Files\WinPic\Winpic.exe
    ProgrammerParams = /device=PIC%ChipModel% /p "%FileName%"
```

This example will use MPASM to assemble the program. It will run the
program specified in the assembler = line, and give it these parameters:

``` screen
    `/c- /o- /q+ /l+ /x- /w1 "compiled.asm"`
```

Then, it will run the programmer, and give it these parameters when it
calls it:

``` screen
    `/device=PIC16F88 /p "compiled.hex"`
```

`%ChipModel%` will get replaced with the chip you are using, so this the
chip GCBASIC will pass to WinPIC.

<span class="strong">**Errors.txt**</span>

The compiler only produces the file errors.txt if there is an error. The
creation of the errors.txt file makes it easier for IDEs to detect if
the program compiled successfully - if the file was not produced then
the IDE would be unalbe to present the error message to the user.

The file error.txt is always produced in the same folder as the
compiler. Typically: C:\\GCStudio\\GCBASIC\\Errors.txt

<span class="strong">**USE.INI**</span>

USE.INI is the provided setup file for the compiler.  The name of
`use.ini` is historic and of no relevance.

USE.INI is generally updated by using the `PREFERENCES EDITOR`.  

USE.INI is self documenting and open `use.ini` in an editor will shown
the full capabilities of setting file.

The details below show the self documentation in a typical `use.ini`

``` screen
Preferences file for GC BASIC
Location: GCB install (or custom) dir

Documentation for the [gcbasic] section of the use.ini file
    programmer = arduinouno   - the currently selected available programmers
    showprogresscounters = n  - show percent values as compiler runs. requires Verbose = y
    verbose = y               - show verbose compiler information
    preserve = n              - preservice source program in ASM
    warningsaserrors = n      - treat Warnings from scripts as errors.
    pauseaftercompile = n     - pause after compiler. Do not do this with IDEs
    flashonly = n             - Flash the chip is source older that hex file
    assembler = GCASM         - currently selected Assembler
    hexappendgcbmessage = n   - appends a message in the HEX file
    laxsyntax = n             - use lax syntax when Y, the compiler will not check that reserved words
    mutebanners = n           - mutes the post compilation messages
    evbs = n                  - show extra verbose compiler information, requires Verbose = y
    nosummary = n             - mutes almost all messages psot compilation
    extendedverbosemessages = n  - show even more verbose compiler information, requires Verbose = y
    conditionaldebugfile =    - creates CDF file
    columnwidth = 180         - ASM width before wrapping
    picasdebug = n            - adds PIC-AS preprocessor message to .S file
    datfileinspection = y     - inspects DAT for memory validation
    methodstructuredebug  = n - show method structure start & end for validation
    floatcapability =  1      - 1 = singles
                             - 2 = doubles
                             - 4 = longint
                             - 8 = uLongINT
    compilerdebug =  0       - 1 = COMPILECALCADD
                             - 2 = VAR SET
                             - 4 = CALCOPS
                             - 8 = COMPILECALCMULT
                             - 16 = AUTOPINDIR
                             - 32 = ADRDX
                             - 64 = GCASM
```

</div>
