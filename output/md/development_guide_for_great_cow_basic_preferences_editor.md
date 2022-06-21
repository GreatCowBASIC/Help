<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="development_guide_for_great_cow_basic_preferences_editor"></span>Development Guide for Great Cow BASIC Preferences Editor

</div>

</div>

</div>

This section deals with the Great Cow BASIC Preferences Editor (Pref
Editor).   The Prefs Editor is the software enables the user to select
programmers, select the options when compiling, select the assembler and
other settings.   The Prefs Editor uses an ini to read and store the
compiler settings.   The INI structure is explained the first section,
then, the Prefs Editor in detail.

  

<span class="strong">**ABOUT THE INI FILES**</span>

You can provide the compiler an INI file with a number of settings and
programmers.  

The following section provide details of the specifics within an example
INI file.   The comments are NOT part of an INI file.  

The settings are in the INI section called \[gcbasic\].  

``` screen
    [gcbasic]
    'The current order of the programmers as shown in Prefs Editor
    programmer = tinybootloader, lgt8fx8p, arduinouno, pickitpluscmd0, nsprog

    'Show the progress counters when compiling.  This can be changed in the INI or by a command line switch. There is no support in Prefs Editor to change this parameter.
    showprogresscounters = n

    'Show verbose when compiling.  This can be changed in the INI or by a command line switch
    verbose = n

    'Show source code in the generated ASM or .S files. This can be changed in the INI or by a command line switch
    preserve = a

    'Treat warning as errors. This can be changed in the INI or by a command line switch.&#160;&#160;There is no support in Prefs Editor to change this parameter.
    warningsaserrors = n

    'Pause after compilation. This can be changed in the INI or by a command line switch.&#160;&#160;There is no support in Prefs Editor to change this parameter.
    pauseaftercompile = n

    'Flash the chip only. This can be changed in the INI or by a command line switch. There is no support in Prefs Editor to change this parameter.
    flashonly = n

    'Selected assembler. This can be changed in the INI or by a command line switch.
    assembler = PIC-AS

    'Add comments to hex to show source compiler. This can be changed in the INI or by a command line switch.
    hexappendgcbmessage = n

    'Mute banners when compiling. This can be changed in the INI or by a command line switch. There is no support in Prefs Editor to change this parameter.
    mutebanners = n

    'Show the extended verbose messages when compiling. his can only be changed in the INI. There is no support in Prefs Editor or a command line switch to change this parameter.  Not managed by Prefs Editor.
    evbs = n

    'Use LAXSYNTAX insupport lax validation.  This disables reserved word inspection, permits use of reserved words in GOTO statement.  Not managed by Prefs Editor.
    laxsyntax = y
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
the Great Cow Graphical BASIC utilities, and requires some files from
Great Cow Graphical BASIC to compile.  

The software is developed using Sharp Develop v.3.2.1 ( not Visual
Studio ).  

  

<span class="strong">**COMPILING**</span>

Ensure that the "Programmer Editor" folder is in the same folder as a
"Great Cow Graphical BASIC" folder.   The "Great Cow Graphical BASIC"
folder must contain the following files from GCGB: - Preferences.vb -
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
