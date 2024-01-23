<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="other_directives"></span>Other directives

</div>

</div>

</div>

The built-in `#defines` are used to support the `#IFDEF` command set are
as follows. The table also shows which `#defines` are supported as
string in HSerPrint, SerPrint and other string related commands.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constants</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Type</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Usage</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Decription</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">CHIPADC</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The number of A/D inputs on the current chip</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">CHIPASSEMBLER</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The select assemble GCASM/MPASM/PICAS etc</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">CHIPEEPROM</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The number of Bytes in EEPROM memmory</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">CHIPIO</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The number of general purpose IO pins</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">CHIPMHZ</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The microcontroller clock speed</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">CHIPNAME</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation only</p></td>
<td style="text-align: left;"><p>The microcontroller type</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">CHIPNAMESTR</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The microcontroller name</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">CHIPPINS</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The number of microcontroller pins.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">CHIPRESERVEHIGHPROG</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Scripts, Conditional compilation, and output commands</p></td>
<td style="text-align: left;"><p>The value of the words reserved</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">CHIPOSC</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Scripts, Conditional compilation, and output commands</p></td>
<td style="text-align: left;"><p>The frequency selected</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">CHIPUSINGINTOSC</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Scripts, Conditional compilation, and output commands</p></td>
<td style="text-align: left;"><p>The constant exists if the compiler has deternined the program is using the internal oscillator</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">CHIPPROGRAMMERNAMESTR</code></p></td>
<td style="text-align: left;"><p>String constant</p></td>
<td style="text-align: left;"><p>Name of the chip type to be used by a programmer</p></td>
<td style="text-align: left;"><p>The psuedo microcontroller type</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">CHIPRAM</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The RAM size</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">CHIPSHAREDRAM</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The first RAM location</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">CHIPFAMILY</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>See the table below</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">CHIPWORDS</code></p></td>
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The number of WORDS in Flash memmory</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">SOURCEFILE</code></p></td>
<td style="text-align: left;"><p>Constant string</p></td>
<td style="text-align: left;"><p>Conditional compilation or output commands</p></td>
<td style="text-align: left;"><p>The name of the source GCB file</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Function</strong></span></p></td>
<td style="text-align: left;"><p><span class="strong"><strong>Type</strong></span></p></td>
<td style="text-align: left;"><p><span class="strong"><strong>Usage</strong></span></p></td>
<td style="text-align: left;"><p><span class="strong"><strong>Description</strong></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">Var()</code></p></td>
<td style="text-align: left;"><p>Function</p></td>
<td style="text-align: left;"><p>Conditional compilation only</p></td>
<td style="text-align: left;"><p>True if a register is declared (or false if not declared) in the currently specficied microcontroller’s .dat file.</p>
<p>Var(register_name)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">NoVar()</code></p></td>
<td style="text-align: left;"><p>Function</p></td>
<td style="text-align: left;"><p>Conditional compilation only</p></td>
<td style="text-align: left;"><p>True if a register is NOT declared (or false if declared) in the currently specficied microcontroller’s .dat file.</p>
<p>NoVar(register_name)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">Bit()</code></p></td>
<td style="text-align: left;"><p>Function</p></td>
<td style="text-align: left;"><p>Conditional compilation only</p></td>
<td style="text-align: left;"><p>True if a bit is declared (or false if not declared) in the currently specficied microcontroller’s .dat file.</p>
<p>Bit(bit_name)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">NoBit()</code></p></td>
<td style="text-align: left;"><p>Function</p></td>
<td style="text-align: left;"><p>Conditional compilation only</p></td>
<td style="text-align: left;"><p>True if a bit is NOT declared (or false if declared) in the currently specficied microcontroller’s .dat file.</p>
<p>NoBit(bit_name)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">Allof()</code></p></td>
<td style="text-align: left;"><p>Function</p></td>
<td style="text-align: left;"><p>Conditional compilation only</p></td>
<td style="text-align: left;"><p>True if all defines are declared:</p>
<p><code class="literal">AllOf(define1, define2, …)</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">OneOf()</code></p></td>
<td style="text-align: left;"><p>Function</p></td>
<td style="text-align: left;"><p>Conditional compilation only</p></td>
<td style="text-align: left;"><p>True if one of the defines is declared:</p>
<p><code class="literal">OneOf(define1, define2, …)</code></p></td>
</tr>
</tbody>
</table>

</div>

  
  
The table below shows two special directives that support the mapping
for one variable or bit to anoher variable or bit. This is useful when
creating portable code or libraries to ensure GCBASIC  
  
  
  

<div class="informaltable">

<table data-border="1" width="100%">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Directive</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Explanation</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Usage</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>#samebit</p></td>
<td style="text-align: left;"><p>The compiler checks each item in the list to see which ones are implemented on the current microcontroller.<br />
If any of the bits do not exist, the compiler will create a constant mapping to the name of the first parameter in the list of parameters that does exist. + If none of the bits exist the no constant is created.</p></td>
<td style="text-align: left;"><p>  #samebit PLLEN, SPLLEN, SPLLMULT<br />
    Set SPLLEN On<br />
</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>#samevar</p></td>
<td style="text-align: left;"><p>The compiler checks each item in the list to see which ones are implemented on the current microcontroller.<br />
If any of the variables do not exist, the compiler will create a constant mapping to the name of the first parameter in the list of parameters that does exist. + If none of the variables exist the no constant is created.</p></td>
<td style="text-align: left;"><p>  #samevar CMCON, CMCON0, CMCONbob<br />
  #ifdef Var(CMCONbob)<br />
      CMCONbob = 7<br />
  #endif<br />
<br />
  Compiles to:<br />
  ;CMCONbob = 7<br />
  movlw 7<br />
  movwf CMCON,ACCESS<br />
<br />
</p></td>
</tr>
</tbody>
</table>

</div>

  
  

This table shows the ChipFamily constants mapped to the microcontroller
architecture.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>ChipFamily Value</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Microcontroller Characteristics</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>PIC</strong></span></p></td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>100</p></td>
<td style="text-align: left;"><p>AVR core version V0E class microcontrollers</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>110</p></td>
<td style="text-align: left;"><p>AVR core version V1E class microcontrollers</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>120</p></td>
<td style="text-align: left;"><p>AVR core version V2E class microcontrollers</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>-120 Subtype: 121</p></td>
<td style="text-align: left;"><p>AVR core version AVR8L, also called AVRrc, reduced core class microcontrollers. ATTiny4-5-9-10 and ATTiny102-104 with only 16 GPR’s from r16-r31 and only 54 instructions.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>-120 Subtype: 122</p></td>
<td style="text-align: left;"><p>LGT microcontrollers.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>-120 Subtype: 123</p></td>
<td style="text-align: left;"><p>AVR core version V2E class microcontrollers with one USART like the mega32u4, mega16u4 - they have different registers for the usart.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>121</p></td>
<td style="text-align: left;"><p>Tiny4-5-9-10 and tiny102-104. Only 16 GPR’s from r16-r31 and only 54 instructions.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>130</p></td>
<td style="text-align: left;"><p>AVR core version V3E class microcontrollers but essentially the mega32u6 only</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>AVR</strong></span></p></td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>12</p></td>
<td style="text-align: left;"><p>Baseline devices. 12 Bit instruction set</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>15</p></td>
<td style="text-align: left;"><p>Mid-range core devices. 14 Bit instruction set with enhanced instruction set class</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>15 plus familyVariant=1</p></td>
<td style="text-align: left;"><p>Mid-range core devices. 14 Bit instruction set with enhanced instruction set and with large memory capability class</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>16</p></td>
<td style="text-align: left;"><p>High end core devices. 16 Bit instruction set, memory addressing architecture and an extended instruction set.</p>
<p>Chip family 16 also have a sub chip family Constant.   These constants are shown below:</p>
<p>    ChipFamily18FxxQ10 = 16100</p>
<p>    ChipFamily18FxxQ43 = 16101</p>
<p>    ChipFamily18FxxQ41 = 16102</p>
<p>    ChipFamily18FxxK42 = 16103</p>
<p>    ChipFamily18FxxK40 = 16104</p>
<p>    ChipFamily18FxxQ40 = 16105</p>
<p>    ChipFamily18FxxQ84 = 16106</p>
<p>    ChipFamily18FxxK83 = 16107</p>
<p>    ChipFamily18FxxQ83 = 16108</p></td>
</tr>
</tbody>
</table>

</div>

  
  

</div>
