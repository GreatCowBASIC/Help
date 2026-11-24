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

Available on all PIC microcontrollers with SAFM memory.

<span class="strong">**Explanation:**</span>  
  
`SAFRead` is used to read information, byte values, from SAFM, so that
it can be accessed for use in a user program.  
  
`location` represents the location or relative address to read. The
location ranges from location 0 to `SAF_BYTES - 1`. This can be 0-127 or
0-255, depending on the specific device. `SAF_BYTES` is a GCBASIC
constant that represents the number of bytes of SAF memory.     
  
`data` is the data to be read from the SAFM data storage area.    This
can be a byte value or a byte variable.  
  
This method reads data from SAFM given the specific relative
location.    This method is similar to the `EPRead` method for EEPROM.  
  
<span class="strong">**Example 1:**</span>

``` programlisting
    '... code preamble to select part
    '... code to setup serial
    '... code to setup PPS

    'The following example reads the SAFM data value into the byte variable byte_value using a subroutine.

    Dim data_byte as byte
    Dim byte_value as byte

    ;Write a byte of data to SAF Location 34
    SAFWrite( 34, 144)

    ;Read the byte back from SAF location 34
    SAFRead( 34, byte_value )          ' <<< the subroutine form of SAFRead this page documents

    ;Display the data on a terminal
    HserPrint "byte_value = "
    Hserprint byte_value
```

<span class="strong">**Key line:**</span>
`SAFRead( 34, byte_value )` — reads the byte stored at SAFM location 34
into `byte_value` using the subroutine form.

<span class="strong">**Example 2:**</span>

``` programlisting
    '... code preamble to select part
    '... code to setup serial
    '... code to setup PPS

    'The following example reads the SAFM data value into the byte variable byte_value using a function.

    Dim byte_value as byte

    ;Write a byte of data to SAF Location 34
    SAFWrite( 34, 144)

    ;Read the byte back from SAF location 34
    byte_value = SAFread( 34 )          ' <<< the function form of SAFRead this page documents

    ;Display the data on a terminal
    HserPrint "byte_value = "
    Hserprint byte_value
```

<span class="strong">**Key line:**</span>
`byte_value = SAFread( 34 )` — the function form of the same read,
returning the value directly instead of writing it into an output
parameter.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="safm_overview" class="link" title="SAFM Overview">SAFM Overview</a>
-   <a href="safreadword" class="link" title="SAFReadWord">SAFReadWord</a>
-   <a href="safwrite" class="link" title="SAFWrite">SAFWrite</a>
-   <a href="safwriteword" class="link" title="SAFWriteWord">SAFWriteWord</a>
-   <a href="safreadblock" class="link" title="SAFReadBlock">SAFReadBlock</a>
-   <a href="safwriteblock" class="link" title="SAFWriteBlock">SAFWriteBlock</a>
-   <a href="saferaseblock" class="link" title="SAFEraseBlock">SAFEraseBlock</a>

</div>

</div>
