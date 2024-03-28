<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="development_guide_for_gcbasic_preferences_editor"></span>Development Guide for GCBASIC Preferences Editor

</div>

</div>

</div>

This section deals with the GCBASIC Preferences Editor (Pref Editor).  
The Prefs Editor is the software enables the user to select programmers,
select the options when compiling, select the assembler and other
settings.   The Prefs Editor uses an ini to read and store the compiler
settings.   The INI structure is explained the first section, then, the
Prefs Editor in detail.

  

<span class="strong">**ABOUT THE INI FILES**</span>

You can provide the compiler an INI file with a number of settings and
programmers.  

The following section provide details of the specifics within an example
INI file.   The comments are NOT part of an INI file.  

The settings are in the INI section called \[gcbasic\].  

``` screen
    [gcbasic]
    programmer = arduinouno, pickitpluscmd1, lgt8f328p-1, xpress, pickit2cmdline, nsprog            - the currently selected available programmers
    showprogresscounters = n                                                                        - show percent values as compiler runs. requires Verbose = y
    verbose = y                                                                                     - show verbose compiler information
    preserve = n                                                                                    - preservice source program in ASM
    warningsaserrors = n                                                                            - treat Warnings from scripts as errors. Errors will cause the compiler to cease on an Error(s)
    pauseaftercompile = n                                                                           - pause after compiler. Do not do this with IDEs
    flashonly = n                                                                                   - Flash the chip is source older that hex file
    assembler = GCASM                                                                               - currently selected Assembler
    hexappendgcbmessage = n                                                                         - appends a message in the HEX file
    laxsyntax = n                                                                                   - use lax syntax when Y, the compiler will not check that reserved words are being used
    mutebanners = n                                                                                 - mutes the post compilation messages
    evbs = n                                                                                        - show extra verbose compiler information, requires Verbose = y
    nosummary = n                                                                                   - mutes almost all messages psot compilation
    extendedverbosemessages = n                                                                     - show even more verbose compiler information, requires Verbose = y
    conditionaldebugfile =                                                                          - creates CDF file
    columnwidth = 180                                                                               - ASM width before wrapping
    picasdebug = n                                                                                  - adds PIC-AS preprocessor message to .S file
    datfileinspection = y                                                                           - inspects DAT for memory validation
    methodstructuredebug  = n                                                                       - show method structure start & end for validation
    floatcapability =  1                                                                            - 1 = singles
                                                                                                    - 2 = doubles
                                                                                                    - 4 = longint
                                                                                                    - 8 = uLongINT
    compilerdebug =  0                                                                              - 1 = COMPILECALCADD
                                                                                                    - 2 = VAR SET
                                                                                                    - 4 = CALCOPS
                                                                                                    - 8 = COMPILECALCMULT
```

The section shows an example \[tool\] assembler section.  

``` screen
    [tool=pic-as]
    'An assember
    type = assembler
    'Location of the assember using a parameter substitution.
    command = %picaslocation%\pic-as.exe
    'Parameters
    params = -mcpu=%ChipModel%  "%Fn_NoExt%.S" -msummary=-mem,+psect,-class,-hex,-file,-sha1,-sha256,-xml,-xmlfull  -Wl -mcallgraph=std -mno-download-hex -o"%Fn_NoExt%.hex"  -Wl,-Map="%Fn_NoExt%.map" -Wa,-a

    [tool=mpasm]
    'An assember
    type = assembler
    'Location of the assember using a parameter substitution.
    command = %mpasmlocation%\mpasmx.exe
    'Paramters
    params = /c- /o- /q+ /l+ /x- /w1 "%FileName%"
```

The section shows an example \[patch\] section.

This section shows and explicit set of patches applied to PIC-AS
assembler.

``` screen
    [patch=asm2picas]
    desc = PICAS correction entries.  Format is STRICT as follows:  Must have quotes and the equal sign as the delimeter. PartName +COLON+"BadConfig"="GoodConfig"    Where BadConfig is from .s file and GoodConfig is from .cfgmap file
    16f88x:"intoscio = "="FOSC=INTRC_NOCLKOUT"
    16f8x:"intrc = IO"="FOSC=INTOSCIO"
    12f67x:"intrc = OSC_NOCLKOUT"="FOSC=INTRCIO"
```

The section shows an example \[programmer\] section.  

``` screen
    [tool = pk4_pic_ipecmd_program_release_from_reset]
    'Description
    desc = MPLAB-IPE PK4 CLI for PIC 5v0
    'A programmer
    type = programmer
    'Command line using a parameter substitution.
    command = %mplabxipedirectory%\ipecmd.exe
    'Parameters using a parameter substitution.
    params = -TPPK4 -P%chipmodel%  -F"%filename%" -M  -E -OL -W5
    'Worting direcroty using a parameter substitution.
    workingdir = %mplabxipedirectory%
    'Useif constraints - this shows none
    useif =
    'Mandated programming config constraints - this shows none
    progconfig =
```

<span class="strong">**ABOUT THE PREFS EDITOR**</span>

This is a utility for editing GCBASIC ini files.   It is derived from
the Graphical GCBASIC utilities, and requires some files from Graphical
GCBASIC to compile.  

The software is developed using Sharp Develop v.3.2.1 ( not Visual
Studio ).  

  

<span class="strong">**COMPILING**</span>

Ensure that the "Programmer Editor" folder is in the same folder as a
"Graphical GCBASIC" folder.   The "Graphical GCBASIC" folder must
contain the following files from GCGB: - Preferences.vb -
PreferencesWindow.vb - ProgrammerEditor.vb - Translator.vb -
ProgrammerEditor.resources

Once these files are in place, it should be possible to compile the
Programmer Editor using SharpDevelop 3.2 (or similar).

  

<span class="strong">**USING PREFS EDITOR**</span>

If run without any parameters, this program will create an ini file in
whatever directory it is located in.   If it is given the name of an ini
file as a command line parameter, it will use that file.  

As well as the ini file it is told to load, this program will also read
any files that are included from that file..   This makes it possible to
keep the settings file in the Application Data folder if GCBASIC is
installed in the Program Files directory..   To put the settings file
into the Application Data folder, create a small ini file containing the
following 3 lines and place it in the same directory as this program:

``` screen
    include %appdata%\gcgb.ini
    [gcgb]
    useappdata = true
```

The include line tells the program (and GCBASIC) to read from the
Application Data folder.   The useappdata=true line in the \[gcgb\]
section will cause this program to write any output to a file in
Application Data called gcgb.ini.   The hard coding of GCGB is required
this program is based on GCGB.   It will result in programmer
definitions being shared between GCGB and any other environment using
this editor, which may be a positive side effect.

  

<span class="strong">**BUILDING THE PROGRAMMER EDITOR EXECUTABLE USING
SHARP DEVELOP**</span>

To build Prefs Editor from the source files.   The list shows the
installation of the Sharp Develop IDE.

Complete the following:

``` screen
        1. Download and install Sharp Develop from  https://sourceforge.net/projects/sharpdevelop/files/SharpDevelop%203.x/3.2/[SourceForge]
        2. Download the Prefs Editor source using SVN into a source folder.  This is the folder ..\utils\Programmer Editor
        4. Run Sharp Develop (installed at step #1).  Load project  "Programmer Editor.sln"  from source source folder.
        5. Hit <f8> to compile.
```

  
  
  
  

</div>
