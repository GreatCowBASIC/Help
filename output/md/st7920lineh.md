<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920lineh"></span>ST7920lineh

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ST7920lineh ( Xpos, Ypos, xUnitsStyle, )
```

<span class="strong">**Explanation:**</span>

This command draws a horizontal line with the specific style. The style
can be ON or OFF. Default is ON.

This is called by the GLCD common routines.

<span class="strong">**Example usage:**</span>

``` screen
    ST7920lineh ( 0, 31,128 , ON) ‘will draw a line
```

</div>
