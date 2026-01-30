<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="tm_bright_2"></span>TM\_Bright

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    TM_Bright = Brightness
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

<span class="emphasis">*Brightness*</span> sets the brightness for the
display with a range of 8 to 15.   Default to 15.  

TM\_Bright must be defined before the first use the commands: TMDec,
TMHex or TMWriteChar, to set the brightness of the characters (8-15),
without this, the display will be blank.

  
  
  
  

</div>
