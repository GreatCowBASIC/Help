<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_converters"></span>Converters

</div>

</div>

</div>

<span class="strong">**About Converters**</span>

Converters allow GCBASIC to read files that have been created by other
programs. A converter can convert these files into GCBASIC libraries or
any GCBASIC instruction or a GCBASIC dataset.

A typical use case is when you have a data source file from another
computer system and you want to consume the data within your GCBASIC
program. The data source file could be database, graphic, reference data
or music file. The converter will read these source files and convert
them into a format that can be processed by GCBASIC. The conversion
process is completed by external application which can be written by the
developer or you can use one of the converters provided with the GCBASIC
release.

The GCBASIC release includes the converter for BMP files and standard
Text files.

With an appropriate Converter installed, and an associated `#include` to
these non-GCBASIC files, GCBASIC will detect that the file extension and
hand the processing to the external converting program. When the
external converting program had complete, GCBASIC will then continue
with the converted source file as a GCBASIC source file.

An example of a converter is to read an existing picture file, convert
the picture file to a GCB table and then refer to the picture file table
to display the picture file on a GLCD.

Conversion is achieved by including a command within the source program
to transform external data. The command used is the instruction
`#include` followed by the data source. An example:

``` screen
    'Convert ManLooking.BMP to a GCBASIC usable format.

    #include <..\converters\ManLooking.BMP>
```

The inclusion of the \#include line within a GCBASIC program will enable
the commencement of the following process:

<div class="orderedlist">

1.  GCBASIC will examine the `..\converters` folder structure for a
    configuration file that will handle the file extension specified in
    the include statement.

2.  GCBASIC will examine the configuration file(s) `*.INI` for command
    line instructions.

3.  GCBASIC will at stage examine the folder structure for the source
    file and the target transformed file. If the source file is older
    than the transformed file the next step will not be executed, goto
    step 6.

4.  GCBASIC will execute the command as specified within the
    configuration file to transform the source file to the target file.

    The Conversion program must create the output file extension as
    specified in the configuration file. If the include statement as an
    extension of `.TXT` and the configuration files states the input
    file extension as `.TXT` and the output as `.GCB` the converted file
    must have the extension of `.GCB`.

    ``` literallayout
    #include <..\converters\ManLooking.BMP>
    ```

    Init file is input file as BMP and output as GCB, then the file
    expected is `..\converters\ManLooking.GCB`

5.  GCBASIC will attempt to include the transformed target file (with
    the file extension as specified in the configuration file) within
    the GCBASIC program.

6.  GCBASIC will resume normal processing of the GCBASIC program
    including the transformed target file, therefore, with normal
    compiling and errors handling.

</div>

For example programs see
<a href="_converters.html#XX0" class="link">here</a>.

<span class="strong">**More about Converters**</span>

<div class="orderedlist">

1.  The configuration file

    The configuration file MUST have the extension of `.INI`. No leading
    spaces are permitted in the configuration file. Specification of the
    configuration file. The file has four items: `desc`, `in`, `out` and
    `exe`. Where:

    ``` literallayout
    desc         : Is the description shown in GCGB
    in           : Is the source file extension to be transformed
    out          : Is the target transformed file extension.
    exe          : Is the executable to be run for this specific configuration file.
    params       : Optional, is the required parameter to be passed from the compiler.  Example:  params = %filename% %chipmodel%
    deletetarget : Optional, will always recreate the target transformed file. The default is to retain the target transformed file unless source has changed. Options are Y or N
    ```

    You can have multiple configuration files within the
    `..\converters folder structure`.

    GCBASIC will examine all configuration file to match the extension
    as specified in the `#include` command.

    <span class="strong">**Example 1 :**</span>

    <div class="informalexample">

    BMP (Black and White) conversion configuration file is called
    `BMP2GCBasic.ini`. The source extension is `.bmp`, the transformed
    file extension is `.GCB`, and the executable is called
    `BMP2GCBASIC.exe`.

    ``` literallayout
    desc = BMP file (*.bmp)
    in = bmp
    out = GCB
    exe = BMP2GCBASIC .exe
    ```

    An example :

    ``` literallayout
    #include <..\converters\ManLooking.BMP>
    ```

    Will be converted by the `BMP2GCBASIC .EXE` to
    `..\converters\ManLooking.GCB`

    </div>

    <span class="strong">**Example 2 :**</span>

    <div class="informalexample">

    Data file conversion configuration file is called `TXT2GCB.ini`. The
    source extension is `.TXT`, the transformed file extension is
    `.GCB`, and the command line called `AWKRUN.BAT` .

    ``` literallayout
    desc = Infrared Patterns (*.txt)
    in = txt
    out = GCB
    exe = awkrun.bat
    ```

    An example :

    ``` literallayout
    #include <..\converters\InfraRedPatterns.TXT>
    ```

    Will be converted by the `AWKRUN.BAT` to
    `..\converters\ InfraRedPatterns.GCB`

    The example would require a supporting batch file and a script
    process to complete the transformation.

    </div>

2.  Conversion Executable

    The conversion executable may be written in any language (compiled
    or interpreted).

    The conversion executable MUST create the converted file with the
    correct file extension as specified in the configuration file.

    The conversion executable will be passed one parameter - the source
    file name. Using example \#1 the conversion executable would be
    passed `..\converters\ManLooking.BMP`

    The conversion executable MUST create a GCBASIC compatible source
    file. Any valid commands/instruction are permitted.

3.  Installation

    The `INI` file, the source file and the conversion executable MUST
    be located in the `..\converters folder`. The converters folder is
    relative to the `GCBASIC.EXE` compiler folder.

</div>

<span id="XX0"></span><span class="strong">**Example 3 : Converter
Program**</span>

<div class="informalexample">

This program converts the `InfraRedPatterns.TXT` into
`InfraRedPatterns.GCB` that will have a GCBASIC table called
`DataSource`. This example is located in the converter folder of the
GCBASIC installation.

``` screen
  #chip16f877a, 16
  #include <..\converters\InfraRedPatterns.TXT>

  dir portb out

  ' These must be WORDs as this could be large table.
  dim TableReadPosition, TableLen as word

  dir portb out

  ' Read the table length
  TableReadPosition = 0
  ReadTable DataSource, TableReadPosition, TableLen


  Do Forever
      For TableReadPosition = 1 to TableLen step 2
          ReadTable DataSource, TableReadPosition, TransmissionPattern
          ReadTable DataSource, TableReadPosition+1 , PulseDelay
          portb = TransmissionPattern
          wait PulseDelay ms
      next
  Loop
```

</div>

<span class="strong">**Example 4 : Dynamic Import**</span>

<div class="informalexample">

This program converts a chip specific configuration file into
`manifest.GCB` that will have a GCBASIC functions called `DataIn` and
`DataOut`. This example is located in the converter folder of the
GCBASIC installation.

``` screen
    #chip 16f18326

    #include <..\converters\manifest.mcc>

    DataOut ( TX, RA0 )  'this method is created during the convert process. They do not exist withiut the converter.
    DataIn  ( Rx, RC6 )  'this method is created during the convert process. They do not exist withiut the converter.
```

This example would use the optional parameters of `params` and
`deletetarget` in the converter configuration file as follows:

``` screen
    desc = PPS file (*.PPS)
    params = %filename% %chipmodel%
    in = mcc
    out = GCB
    exe = DataHandler.exe
    deletetarget= y
```

</div>

<span class="strong">**Example 5 : Add build numbers and time/date
details to your programs**</span>

This converter is used to expose two string variables as follows:

``` screen
    GCBBuildStr
    GCBBuildTimeStr
```

The user code is simple. Using the \#include statement specify any
filename with an extension must be `cnt`. As follows:

``` screen
    #include "GCBVersionNumber.cnt"
```

Complete code would like this - this not optimised - this shows the use
of the exposed strings.

``` screen
    #include "GCBVersionNumber.cnt"

    dim versionString as string * 40
    versionString = "Max7219 build"+GCBBuildStr
    versionString = versionString + "@"+GCBBuildTimeStr
    Print versionString
```

This outputs the following - where \#20 is the current build and the
date/time is correct for build time.

``` screen
    Max7219 build20@01-06-2021 08:00:21
    Commence main program
```

This works as the support INI file instructs the compiler to call a
utility that automatically creates a build number tracker file and the
supportting string functions. The utility creates a tracker file and the
methods files in the same folder as your source program - so, each
tracker is specific to each project. The converter requires the
following files - these are included within your Installation.

``` screen
    GCBVersionStamp.exe - the utility called by the converter capability.
    cnt2gcb.ini - the supporting ini file used by the compiler to handle this converter.
```

</div>
