<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hefread"></span>HEFRead

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    'as a subroutine
    HEFRead ( location, data )

    'as a function
    data = HEFRead ( location )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC micro-controllers with HEFM memory

<span class="strong">**Explanation:**</span>  
  
HEFRead is used to read information, byte values, from HEFM, so that it
can be accessed for use in a user program.  
  
`location` represents the location or relative address to read. The
location will range from location 0 to HEF\_BYTES - 1, or for all
practical purposes 0-127 since all PIC Microcontrollers with HEF support
128 bytes of HEF Memory. HEF\_BYTES is a GCBASIC constant that
represents the number of bytes of HEF Memory.     
  
`data` is the data that is to be read from the HEFM data storage
area.    This can be a byte value or a byte variable.  
  
This method reads data from HEFM given the specific relative
location.    This method is similar to the EPRead method for EEPROM.  
  
<span class="strong">**Example 1:**</span>

``` screen
    '... code preamble to select part
    '... code to setup PPS
     '... code to setup serial

    'The following example reads the HEFM data value into the byte variable “byte_value” using a subroutine.

    Dim data_byte as byte

    ;Write a byte of data to HEFM Location 34
    HEFWrite( 34, 144)

    ;Read the byte back from HEFM location 34
    HEFread( 34, byte_value )

    ;Display the data on a terminal
    HserPrint "byte_value = "
    Hserprint byte_value
```

  
  
<span class="strong">**Example 2:**</span>

``` screen
    '... code preamble to select part '... code preamble to select part
    '... code to setup PPS
     '... code to setup serial

    'The following example reads the HEFM data value into the byte variable “byte_value” using a function.

    Dim data_byte as byte

    ;Write a byte of data to HEF Location 34
    HEFWrite( 34, 144)

    ;Read the byte back from HEF location 34
    byte_value = HEFread( 34 )

    ;Display the data on a terminal
    HserPrint "byte_value = "
    Hserprint byte_value
```

  
  
See also
<a href="hefm_overview" class="link" title="HEFM Overview">HEFM Overview</a>,
<a href="hefread" class="link" title="HEFRead">HEFRead</a>,
<a href="hefreadword" class="link" title="HEFReadWord">HEFReadWord</a>,
<a href="hefwrite" class="link" title="HEFWrite">HEFWrite</a>,
<a href="hefwriteword" class="link" title="HEFWriteWord">HEFWriteWord</a>,
<a href="hefreadblock" class="link" title="HEFReadBlock">HEFReadBlock</a>,
<a href="hefwriteblock" class="link" title="HEFWriteBlock">HEFWriteBlock</a>,
<a href="heferaseblock" class="link" title="HEFEraseBlock">HEFEraseBlock</a>

</div>
