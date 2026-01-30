<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hefwriteblock"></span>HEFWriteBlock

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HEFWriteBlock ( block_number,  buffer(), [, num_bytes] )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC micro-controllers with HEFM memory.

<span class="strong">**Explanation:**</span>  
  
HEFWriteBlock is used to write information from a user buffer to
HEFM.    Once the block is written it can be accessed for use within a
user program.  
  
The parameters are as follows:  
  
`block_number` represents the block to be written to.    The
block\_number parameter is used to calculate the physical memory
location(s) that are updated.  
  
`buffer()` represents an array or string.    The buffer will be used as
the data source that is written to the HEFM block.    The buffer is
handled as a buffer of bytes values.    In most cases the buffer should
be the same size as a row/block of HEFM.    For most PIC
Microcontrollers this will be 32 bytes.    For PIC microcontrollers with
2KW or less of Flash Program Memory this will be 16 Bytes.    Best
practice is to size the buffer using the HEF\_ROWSIZE\_BYTES
constant.    If the size of the buffer exceeds the device specific
HEF\_ROWSIZE\_BYTES, the excess data will not be handled and the buffer
will be truncated at the HEF\_ROWSIZE\_BYTES limit.     
  
`num_bytes` is an optional parameter, and can be used to specify number
of bytes to write to HEFM, starting at the first location in the
selected HEFM block.    This parameter is not normally required as the
default is set to the GCBASIC constant `HEF_ROWSIZE_BYTES`.  
  
<span class="strong">**Example 1:**</span>

``` screen
    '... code preamble to select part
    '... code to setup serial

   Dim My_Buffer(HEF_ROWSIZE_BYTES)

   My_Buffer = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32

    'HEFwriteBlock operation!!
    HEFwriteBlock(2, My_Buffer)

    'A utility method to show the contents of HEFM.
     HEFM_Dump
```

For HEFM\_Dump routine, see
<a href="hefread" class="link" title="HEFRead">HEFRead</a>  
  
If example 1 were displayed on a serial terminal using HEFM\_Dump.   
The result would show. Note the value display at the start of block 2 @
0x3F80.

``` screen
Block0  1 0   3 2   5 4   7 6   9 8   B A   D C   F E
7F00    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF
7F10    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF
7F20    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF
7F30    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF

Block1  1 0   3 2   5 4   7 6   9 8   B A   D C   F E
7F40    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF
7F50    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF
7F60    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF
7F70    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF

Block2  1 0   3 2   5 4   7 6   9 8   B A   D C   F E
7F80    0201  0403  0605  0807  0A09  0C0B  0E0D  100F
7F90    1211  1413  1615  1817  1A19  1C1B  1E1D  201F
7FA0    2120  2322  2524  2726  2928  2B2A  2D2C  2F2E
7FB0    3130  3332  3534  3736  3938  3B3A  3D3C  3F3E

Block3  1 0   3 2   5 4   7 6   9 8   B A   D C   F E
7FC0    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF
7FD0    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF
7FE0    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF
7FF0    FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF  FFFF
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
