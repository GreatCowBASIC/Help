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

Available on all PIC microcontrollers with SAFM memory.

<span class="strong">**Explanation:**</span>  
  
`SAFEraseBlock` is used to erase all data locations within the SAFM
block, setting SAFM data within the block to the erase-state value of
the device.    This value is 0xFF for each location, and will read
0xFFFF if the program memory word is displayed. Use caution: once the
SAFM block is erased, the SAFM data is gone forever and cannot be
recovered unless it was previously saved.  
  
The single parameter is as follows:

`block_number` represents the block to be erased.    The block\_number
parameter is used to calculate the physical memory location(s) that are
updated.  
  

<span class="strong">**Example 1:**</span>

Erase a specific block of SAFM.

``` programlisting
    '... code preamble to select part
    '... code to setup PPS, if needed
    '... code to setup serial, if needed

    'Erase block 2 of SAFM
    SAFEraseBlock ( 2 )          ' <<< the SAFEraseBlock instruction
```

<span class="strong">**Key line:**</span> `SAFEraseBlock ( 2 )` — erases
every location in SAFM block 2, resetting it to 0xFF before new data is
written with `SAFWrite`, `SAFWriteWord`, or `SAFWriteBlock`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="safm_overview" class="link" title="SAFM Overview">SAFM Overview</a>
-   <a href="safread" class="link" title="SAFRead">SAFRead</a>
-   <a href="safreadword" class="link" title="SAFReadWord">SAFReadWord</a>
-   <a href="safwrite" class="link" title="SAFWrite">SAFWrite</a>
-   <a href="safwriteword" class="link" title="SAFWriteWord">SAFWriteWord</a>
-   <a href="safreadblock" class="link" title="SAFReadBlock">SAFReadBlock</a>
-   <a href="safwriteblock" class="link" title="SAFWriteBlock">SAFWriteBlock</a>

</div>

</div>
