<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hefreadblock"></span>HEFReadBlock

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HEFReadBlock ( block_number,  buffer(), [, num_bytes] )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC micro-controllers with HEFM memory.

<span class="strong">**Explanation:**</span>  
  
HEFReadBlock is used to read information from the HEFM data storage into
the buffer.    Once the buffer is populated it can be accessed for use
within a user program.  
  
The parameters are as follows:  
  
`block_number` represents the block to be written to.    The
block\_number parameter is used to calculate the physical memory
location(s) that are updated.  
  
`buffer()` represents an array or string.    The buffer will be used as
the data target for the block read operation.    The buffer is handled
as a buffer of bytes values.    In most cases the buffer should be the
same size as a row/block of HEFM.    For most PIC Microcontrollers this
will be 32 bytes.    For PIC microcontrollers with 2KW or less of Flash
Program Memory this will be 16 Bytes.    Once data is read into the
buffer from HEFM, the user program must handle the data as Byte, Word or
String values, as appropriate.  
  
`num_bytes` is an optional parameter, and can be used to specify number
of bytes to read from HEFM, starting at the first location in the
selected HEFM block.    This parameter is not normally required as the
default is set to the GCBASIC constant `HEF_ROWSIZE_BYTES`.  
  

<span class="strong">**Example 1:**</span>

``` screen
    '... code preamble to select part
    '... code to setup serial

      Dim My_Buffer(HEF_ROWSIZE_BYTES)
      Dim index as byte

      ;Write some data to Block 2
      My_Buffer = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32
      HEFWriteBlock(2, My_Buffer())

      ;Read the data back from HEFM using HEFReadBock
      HEFReadBlock( 2 , My_buffer() )

     ;Send the data to a terminal in decimal format
      index = 1
      Repeat HEF_ROWSIZE_BYTES
          Hserprint(My_Buffer(index))
          HserPrint " "
          index++
     End Repeat
```

  
  
See also
<a href="_hefm_overview.html" class="link" title="HEFM Overview">HEFM Overview</a>,
<a href="_hefread.html" class="link" title="HEFRead">HEFRead</a>,
<a href="_hefreadword.html" class="link" title="HEFReadWord">HEFReadWord</a>,
<a href="_hefwrite.html" class="link" title="HEFWrite">HEFWrite</a>,
<a href="_hefwriteword.html" class="link" title="HEFWriteWord">HEFWriteWord</a>,
<a href="_hefreadblock.html" class="link" title="HEFReadBlock">HEFReadBlock</a>,
<a href="_hefwriteblock.html" class="link" title="HEFWriteBlock">HEFWriteBlock</a>,
<a href="_heferaseblock.html" class="link" title="HEFEraseBlock">HEFEraseBlock</a>

</div>
