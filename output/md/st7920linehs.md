<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920linehs"></span>ST7920LineHs

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ST7920LineHs ( Xpos, Ypos, XLength, Style)
```

<span class="strong">**Explanation:**</span>

This command draws a line with a specific style. The style is based on
the bits value of the byte passed to the routine.

<span class="strong">**Example usage:**</span>

``` screen
    ST7920LineHs ( 0, 31,128 , 0x55) ‘will draw a dashed line
```

</div>
