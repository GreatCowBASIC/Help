<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="safread"></span>SAFRead

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    'as a subroutine
    SAFRead ( location, data )

    'as a function
    data = SAFRead ( location )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC micro-controllers with SAFM memory

<span class="strong">**Explanation:**</span>  
  
SAFRead is used to read information, byte values, from SAFM, so that it
can be accessed for use in a user program.  
  
`location` represents the location or relative address to read. The
location will range from location 0 to SAF\_BYTES - 1. This cab be from
0-127 or 0-255m depending upon the specific device. HEF\_BYTES is a
GCBASIC constant that represents the number of bytes of SAF Memory.     
  
`data` is the data that is to be read from the SAFM data storage
area.    This can be a byte value or a byte variable.  
  
This method reads data from SAFM given the specific relative
location.    This method is similar to the EPRead method for EEPROM.  
  
<span class="strong">**Example 1:**</span>

``` screen
    '... code preamble to select part
    '... code to setup serial
    '... code to setup PPS

    'The following example reads the SAFM data value into the byte variable “byte_value” using a subroutine.

    Dim data_byte as byte

    ;Write a byte of data to SAF Location 34
    SAFWrite( 34, 144)

    ;Read the byte back from SAF location 34
    byte_value = SAFread( 34 )

    ;Display the data on a terminal
    HserPrint "byte_value = "
    Hserprint byte_value
```

  
  
<span class="strong">**Example 2:**</span>

``` screen
    '... code preamble to select part
    '... code to setup serial
    '... code to setup PPS

    'The following example reads the SAFM data value into the byte variable “byte_value” using a function.

    Dim data_byte as byte

    ;Write a byte of Data to SAF Location 34
    SAFWrite( 34, 144)

    ;Read the byte back from SAF location 34
    byte_value = SAFread( 34 )

    ;Display the data on a terminal
    HserPrint "byte_value = "
    Hserprint byte_value
```

  
  
See also
<a href="safm_overview" class="link" title="SAFM Overview">SAFM Overview</a>,
<a href="safread" class="link" title="SAFRead">SAFRead</a>,
<a href="safreadword" class="link" title="SAFReadWord">SAFReadWord</a>,
<a href="safwrite" class="link" title="SAFWrite">SAFWrite</a>,
<a href="safwriteword" class="link" title="SAFWriteWord">SAFWriteWord</a>,
<a href="safreadblock" class="link" title="SAFReadBlock">SAFReadBlock</a>,
<a href="safwriteblock" class="link" title="SAFWriteBlock">SAFWriteBlock</a>,
<a href="saferaseblock" class="link" title="SAFEraseBlock">SAFEraseBlock</a>

</div>
