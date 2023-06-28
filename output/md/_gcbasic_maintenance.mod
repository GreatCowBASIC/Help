<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="gcbasic_maintenance"></span>GCBASIC Maintenance

</div>

</div>

</div>

<span class="strong">**Introduction:**</span> GCBASIC maintenance covers
the key processes that the developers use to maintain and build the
solution.

These insights are not distribution specific.

<span class="strong">**Solution Architecture:**</span> These components
are key for a complete solution:

<div class="orderedlist">

1.  GCBASIC installer
2.  GCBASIC chip specific .DAT files
3.  GCBASIC Help
4.  GCBASIC IDE

</div>

  
  
<span class="strong">**GCBASIC installers:**</span>  
  
The Windows GCBASIC installer uses the <span
class="emphasis">*InnoSoft*</span> installer with packaging completed
using R2Build.  

The process uses a Gold build structure. The R2Build software creates
four packages for Windows and one package for the Linux distribution.
The process is automated with automatic versioning and configuration.

The macOS GCBASIC installer uses the <span
class="emphasis">*Packages*</span> installer
(<http://s.sudre.free.fr/Software/Packages/about>) with packaging
completed using the Bourne shell script `pkg2dmg.sh` to create a
compressed disk image file containing the installer.

  
  
<span class="strong">**GCBASIC chip specific .DAT files:**</span>  
  
What are the .DAT files?

The DAT files are the GCBASIC representation of the capabilities of a
specific microcontroller.  The DAT is based upon a number of vendor
sources and corrections/omissions added by the GCBASIC development
team.  The DAT file is exposed to the user program as a set of registers
and register bits that can used to configure the program in terms of the
microcontroller specifics.  
  

The process to create the .DAT file for microcontrollers is as follows:

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Step</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>1</p></td>
<td style="text-align: left;"><p>Obtain the MPASM *.INC or the AVR *.XML files to be used. These files determine the scope of registers and register bits.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>2</p></td>
<td style="text-align: left;"><p>For Microchip only. Place the source INC files in the ..DAT\incfiles\OrgFiles.</p>
<p>Process the file using 'Preprocess.bat'.    This is an AWK text processor - you will need AWK.EXE in the executing folder.</p>
<p>This preprocessing will examine all the INC files in the ..DAT\incfiles\OrgFiles folder.  The resulting files will be placed in the ..DAT\incfiles folder.  The resulting files will have the 'BITS' section sorted in port priority - this priority ensures the bits are assigned in the target DAT in the same order every time.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>3</p></td>
<td style="text-align: left;"><p>Update the database of support microcontrollers.  This database contains the microcontroller configuration that GCBASIC requires as the core information for the DAT files.</p>
<p>The database is called <code class="literal">chipdata.csv</code> or <code class="literal">avr_chipdata.csv</code> for Microchip and AVR respectively. - These files are comma delimited.  The first row of data specifies the field name - these field names control the chip conversion program, see later notes.  </p>
<p>The database fields are controlled by the GCBASIC development team and the specification of the database may change between releases to support new capabilities.</p>
<p>Database fields will have the suffix of <code class="literal">Variant</code> such as PWMTimerVariant and SMTClockSourceVariant and are microcontroller specific configuration settings to support the various microcontroller settings.  The values of these <code class="literal">variants</code> are determined by the examination of the microcontroller datasheets as this information is NOT specified in the source files.  Variants are exposed in the user program with the prefix of Chip.  If the variant is called <code class="literal">PWMTimerVariant</code> a constant called <code class="literal">ChipPWMTimerVariant</code> will be exposed in the user program.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>4</p></td>
<td style="text-align: left;"><p>Update the <code class="literal">CriticalChanges.txt</code> file, if required.  The <code class="literal">CriticalChanges.txt</code> file contains changes to the INC file during processing that are corrections or additions to the source files.</p>
<p>The format of each line is the <code class="literal">filename</code> , <code class="literal">Append (new line) or Replace</code>, <code class="literal">find</code>, <code class="literal">replace</code>.</p>
<p>Each line is comma delimited and spaces are NOT critical.   Essentially, the processing with find a partial line and replace or append the whole line.</p>
<p>example: p16lf1615.inc,R,OSCFIE EQU H'0007',OSFIE EQU H'0007'     - so, when processing p16lf1615.inc find the line OSCFIE EQU H'0007' and replace with OSFIE EQU H'0007'.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>5</p></td>
<td style="text-align: left;"><p>If required.   This is not normally edited.    Update the <code class="literal">18FDefaultASMConfig.txt</code> to set the 18f configuration defaults.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>6</p></td>
<td style="text-align: left;"><p>Maintain the conversion program.  The conversion program may require maintenance.   The programs are written in FreeBASIC and therefore require compilation.</p>
<p>An example of maintenance is a new variant field is required.  The source program will need to be updated to support the new variant - simply edit the source, compile and publish.  Another example is the addition of a new Interrupt - follow the same process to edit, compile and publish.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>7</p></td>
<td style="text-align: left;"><p>Execute the program to convert the source files to the DAT files for Microchip or AVR.  There are two programs for each architecture.</p>
<p>Executing the conversion program without a parameter will process ALL the entries in the database (the csv file), passing a single parameter to the conversion program will only convert the single microcontroller.</p>
<p>The conversion program will process as follows:</p>
<p>a) Read the database for the chip specifics</p>
<p>b) If a .DEV file or .INFO file is not present a routine called GuessDefaultConfig is invoked. This method sets the bit(s).</p>
<p>In all cases the default mask is sometimes specified for a particular config option and that is used for ASMConfig</p>
<p>See the section below for the processing of a .DEV file.</p>
<p>c) For all microcontrollers read the <code class="literal">CriticalChanges.txt</code> file and process.</p>
<p>d) For 18f microcontrollers read the <code class="literal">18FDefaultASMConfig.txt</code>. This simply overwrites all options stated in 18FDefaultASMConfig.TXT and marks this in the output DAT file.</p>
<p>e) Create the output DAT file.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>8</p></td>
<td style="text-align: left;"><p>Test and publish the DAT file(s) to the distribution as required.</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**An example the processing of a .DEV**</span>.

This is the 18F25K20 example. For this microcontroller `Disabled` is
default:

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/xml2.PNG)

</div>

</div>

  
  
Where the default is selected from the Info\_Type.  
  

<span class="strong">**Prog = . An explanation of the
parameter**</span>. The Prog value is measured in words. It is the same
in the device specific.dat files.  

Microchip in the past have used words, but then they started using bytes
on the website instead to make their chips appear to have larger
capacity.  

An example: If a device has 8192 words, which is 8192 \* 14 = 114688
bits, or 14336 bytes.  It is an odd measurement because dividing 14336
by 14/8 to see how many instructions you can use is extra maths work
within the compiler.  

The GCBASIC PROGram memory analysis are in words.  

  

</div>
