<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="about_the_preferences_editor"></span>About the Preferences Editor

</div>

</div>

</div>

This is a utility for editing GCBASIC ini files. It is derived from the
Graphical GCBASIC utilities, and requires some files from Graphical
GCBASIC to compile.

The software is developed using SharpDevelop v.3.2.1 (not Visual
Studio).

The latest source is on SourceForge.

  

<span class="strong">**COMPILING**</span>

Ensure that the "Programmer Editor" folder is in the same folder as a
"Graphical GCBASIC" folder. The "Graphical GCBASIC" folder must contain
the following files from GCGB: - Preferences.vb - PreferencesWindow.vb -
ProgrammerEditor.vb - Translator.vb - ProgrammerEditor.resources

Once these files are in place, it should be possible to compile the
Programmer Editor using SharpDevelop 3.2 (or similar).

  

<span class="strong">**USING PREFS EDITOR**</span>

If run without any parameters, this program will create an ini file in
whatever directory it is located in. If it is given the name of an ini
file as a command line parameter, it will use that file.

As well as the ini file it is told to load, this program will also read
any files that are included from that file. This makes it possible to
keep the settings file in the Application Data folder if GCBASIC is
installed in the Program Files directory. To put the settings file into
the Application Data folder, create a small ini file containing the
following 3 lines and place it in the same directory as this program:

``` programlisting
    include %appdata%\gcgb.ini
    [gcgb]
    useappdata = true
```

The include line tells the program (and GCBASIC) to read from the
Application Data folder. The `useappdata=true` line in the `[gcgb]`
section will cause this program to write any output to a file in
Application Data called gcgb.ini. The hard coding of GCGB is required,
as this program is based on GCGB. It will result in programmer
definitions being shared between GCGB and any other environment using
this editor, which may be a positive side effect.

  

<span class="strong">**BUILDING THE PROGRAMMER EDITOR EXECUTABLE USING
SHARPDEVELOP**</span>

To build Prefs Editor from the source files. The list shows the
installation of the SharpDevelop IDE.

Complete the following:

``` programlisting
        1. Download and install SharpDevelop from  https://sourceforge.net/projects/sharpdevelop/files/SharpDevelop%203.x/3.2/[SourceForge]
        2. Download the Prefs Editor source using SVN into a source folder.  This is the folder ..\utils\Programmer Editor
        4. Run SharpDevelop (installed at step #1).  Load project  "Programmer Editor.sln"  from the source folder.
        5. Hit <f8> to compile.
```

  
  
  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="development_guide" class="link" title="Development Guide">Development Guide</a> — the
    equivalent contributor guide for GCBASIC libraries
-   <a href="gcbasic_maintenance" class="link" title="GCBASIC Maintenance">GCBASIC Maintenance</a> — the
    release/build/DAT-file maintenance process
-   <a href="command_line_parameters" class="link" title="Command Line Parameters">Command Line Parameters</a> — the
    use.ini settings this compiler reads

</div>

</div>
