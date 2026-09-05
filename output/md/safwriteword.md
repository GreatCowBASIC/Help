<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="safwriteword"></span>SAFWriteWord

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    SAFWriteWord ( location, data_word_value )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC microcontrollers with SAFM memory.

<span class="strong">**Explanation:**</span>  
  
`SAFWriteWord` is used to write information, word values, to the SAFM
data storage, so it can be accessed later by a programmer on a PC, or by
the `SAFRead` commands.  
  
`location` represents the location or relative address to write. The
location ranges from 0 to `SAF_BYTES - 1`.    Each data word requires 2
SAF locations, so the location ranges from either 0 to 254 or 0 to 126
(in steps of 2), depending on the device.  
  
`data` is the data to be written to the SAFM location.   This can be a
word value or a word variable.  
  
This method writes information to SAFM given the specific location in
SAFM.    This method is similar to the methods for EEPROM, but supports
word values.  
  
<span class="strong">**Example 1:**</span>

``` programlisting
    '... code preamble to select part
    '... code to setup serial

    'The following example stores the word value 0x1234 at SAFM location 34

    SAFWriteWord( 34, 0x1234 )          ' <<< the SAFWriteWord instruction
```

<span class="strong">**Key line:**</span>
`SAFWriteWord( 34, 0x1234 )` — stores the 16-bit value `0x1234` at SAFM
location 34.

<span class="strong">**Example 2:**</span>

``` programlisting
    #chip 18F24K42, 16
    '... code to setup PPS
    '... code to setup serial

    'This example will write two word values to two specific locations.

     dim Word_Variable1 as Word
     dim Word_Variable2 as Word

    ;Write the data
    SAFWriteWord (16, 0x1234)   ' <<< the SAFWriteWord instruction. Location 16, in this device, equates to 0x7F10
    SAFWriteWord (18, 0x4321)   'location 18, in this device, equates to 0x7F12

   ;Read the data and send to terminal
    SAFReadWord(16, Word_Variable1 )
    SAFReadWord(18, Word_Variable2 )

   HserPrint "Word_Variable1 = "
   Hserprint Word_Variable1
   HSerPrintCRLF
   HserPrint "Word_Variable2 = "
   Hserprint Word_Variable2
   HSerPrintCRLF
```

<span class="strong">**Key line:**</span>
`SAFWriteWord (16, 0x1234)` — stores the 16-bit value 0x1234 at SAFM
location 16, which the subsequent `SAFReadWord` calls read back and
print.

If example 2 were displayed on a serial terminal, the result would show:

``` programlisting
Word_Variable1 = 4660
Word_Variable2 = 17185
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="safm_overview" class="link" title="SAFM Overview">SAFM Overview</a>
-   <a href="safread" class="link" title="SAFRead">SAFRead</a>
-   <a href="safreadword" class="link" title="SAFReadWord">SAFReadWord</a>
-   <a href="safwrite" class="link" title="SAFWrite">SAFWrite</a>
-   <a href="safreadblock" class="link" title="SAFReadBlock">SAFReadBlock</a>
-   <a href="safwriteblock" class="link" title="SAFWriteBlock">SAFWriteBlock</a>
-   <a href="saferaseblock" class="link" title="SAFEraseBlock">SAFEraseBlock</a>

</div>

</div>
