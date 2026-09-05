<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="safreadblock"></span>SAFReadBlock

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    SAFReadBlock ( block_number,  buffer(), [,  num_bytes] )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC microcontrollers with SAFM memory.

<span class="strong">**Explanation:**</span>  
  
`SAFReadBlock` is used to read information from the SAFM data storage
into the buffer.    Once the buffer is populated, it can be accessed for
use within a user program.  
  
The parameters are as follows:  
  
`block_number` represents the block to be read.    The block\_number
parameter is used to calculate the physical memory location(s) that are
read.  
  
`buffer()` represents an array or string.    The buffer is used as the
data target for the block read operation.    The buffer is handled as a
buffer of byte values.    In most cases the buffer should be the same
size as a row/block of SAFM.    For most PIC microcontrollers with SAFM
this will be 32 bytes.     
  
`num_bytes` is an optional parameter, and can be used to specify the
number of bytes to read from SAFM, starting at the first location in the
selected SAFM block.    This parameter is not normally required, as the
default is set to the GCBASIC constant `SAF_ROWSIZE_BYTES`.  
  
<span class="strong">**Example 1:**</span>

``` programlisting
    #chip 18F24K42, 16
    '... code preamble to setup PPS
    '... code to setup serial

      Dim My_Buffer(SAF_ROWSIZE_BYTES)
      Dim index as byte

      ;Write some data to Block 2
      My_Buffer = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32
      SAFWriteBlock(2, My_Buffer())

      ;Read the data back from SAFM using SAFReadBlock
      SAFReadBlock( 2 , My_buffer() )          ' <<< the SAFReadBlock instruction

     ;Send the data to a terminal in decimal format
      index = 1
      Repeat SAF_ROWSIZE_BYTES
          Hserprint(My_Buffer(index))
          HserPrint " "
          index++
     End Repeat
```

<span class="strong">**Key line:**</span>
`SAFReadBlock( 2 , My_buffer() )` — reads the entire row of block 2 back
into `My_Buffer()` after it was written by `SAFWriteBlock` above.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="safm_overview" class="link" title="SAFM Overview">SAFM Overview</a>
-   <a href="safread" class="link" title="SAFRead">SAFRead</a>
-   <a href="safreadword" class="link" title="SAFReadWord">SAFReadWord</a>
-   <a href="safwrite" class="link" title="SAFWrite">SAFWrite</a>
-   <a href="safwriteword" class="link" title="SAFWriteWord">SAFWriteWord</a>
-   <a href="safwriteblock" class="link" title="SAFWriteBlock">SAFWriteBlock</a>
-   <a href="saferaseblock" class="link" title="SAFEraseBlock">SAFEraseBlock</a>

</div>

</div>
