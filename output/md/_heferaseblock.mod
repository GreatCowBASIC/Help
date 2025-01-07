<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="heferaseblock"></span>HEFEraseBlock

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HEFEraseBlock ( block_number )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC micro-controllers with HEFM memory.

<span class="strong">**Explanation:**</span>  
  
HEFEraseBlock is used to erase all data locations within the HEFM
block.    HEFM data within the HEFM block to the erase state value of
the device.    This Value is 0xFF and will read 0x3FFF if the entire
14bit program memory word is displayed. Use Caution. Once the HEFM block
is erased, the HEFM data is gone forever and cannot be recovered unless
it was previpusly saved.  
  
The single parameter is as follows:

`block_number` represents the block to be erased.    The block\_number
parameter is used to calculate the physical memory location(s) that are
updated.  
  

<span class="strong">**Example 1:**</span>

Erase a specific block of HEFM.

``` screen
    '... code preamble to select part
    '... code to setup serial, if needed


    'Erase block 2 of HEFM
    HEFEraseBlock ( 2)
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
