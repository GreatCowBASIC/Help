<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920glcdreadbyte"></span>ST7920GLCDReadByte

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    byte_variable = ST7920GLCDReadByte
```

<span class="strong">**Explanation:**</span>

This function return the word value (16 bits) of the GLCD display for
the current XY position.

This is called by the GLCD common routines.

See the data sheet for more information.

<span class="strong">**Example usage:**</span>

``` screen
    SET GLCD_RS OFF

    ST7920WriteByte( SysCalcPositionY )
    ST7920WriteByte( SysCalcPositionX )
    ' read data
    GLCDDataTempWord = ST7920GLCDReadByte
    GLCDDataTempWord = ST7920GLCDReadByte
    GLCDDataTempWord = (GLCDDataTempWord*256) + ST7920GLCDReadByte
```

</div>
