<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920glcdreadbyte"></span>ST7920GLCDReadByte

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    byte_variable = ST7920GLCDReadByte
```

<span class="strong">**Explanation:**</span>

This function return the word value (16 bits) of the GLCD display for
the current XY position.

This is called by the GLCD common routines.

See the data sheet for more information.

<span class="strong">**Example usage:**</span>

``` programlisting
    SET GLCD_RS OFF

    ST7920WriteByte( SysCalcPositionY )
    ST7920WriteByte( SysCalcPositionX )
    ' read data
    GLCDDataTempWord = ST7920GLCDReadByte          ' <<< the ST7920GLCDReadByte instruction
    GLCDDataTempWord = ST7920GLCDReadByte
    GLCDDataTempWord = (GLCDDataTempWord*256) + ST7920GLCDReadByte
```

<span class="strong">**Key line:**</span>
`GLCDDataTempWord = ST7920GLCDReadByte` — reads one byte from the
display’s DDRAM at the position set by the two `ST7920WriteByte` calls
above; a full word is assembled by calling it twice and combining the
results, as shown on the final line.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920writebyte" class="link" title="ST7920WriteByte">ST7920WriteByte</a> — positioning
    the read/write address before reading
-   <a href="st7920greaddata" class="link" title="ST7920gReaddata">ST7920gReaddata</a> — reading
    a full word in a single call

</div>

</div>
