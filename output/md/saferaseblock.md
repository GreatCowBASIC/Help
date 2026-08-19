<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="saferaseblock"></span>SAFEraseBlock

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    SAFEraseBlock ( block_number )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC micro-controllers with SAFM memory. <span
class="strong">**Explanation:**</span>  
  
SAFEraseBlock is used to erase all data locations within the SAFM
block.    HEFM data within the HEFM block to the erase state value of
the device.    This Value is 0xFF for each location and will read 0xFFFF
if the program memory word is displayed. Use Caution. Once the SAFM
block is erased, the SAFEM data is gone forever and cannot be recovered
unless it was previpusly saved.  
  
The single parameter is as follows:

`block_number` represents the block to be erased.    The block\_number
parameter is used to calculate the physical memory location(s) that are
updated.  
  

<span class="strong">**Example 1:**</span>

Erase a specific block of SAFEM.

``` screen
    '... code preamble to select part
    '... code to setup PPS, if needed
    '... code to setup serial, if needed

    'Erase block 2 of HEFM
    HEFEraseBlock ( 2)
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
