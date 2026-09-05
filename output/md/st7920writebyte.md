<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920writebyte"></span>ST7920WriteByte

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920WriteByte ( byte_variable )
```

<span class="strong">**Explanation:**</span>

This command write to the appropriate location as specified by the
current XY position.

This is called by the GLCD common routines.

See the data sheet for more information.

<span class="strong">**Example usage:**</span>

``` programlisting
    ...

    SET GLCD_RS OFF

    ST7920WriteByte( SysCalcPositionY )          ' <<< the ST7920WriteByte instruction
    ST7920WriteByte( SysCalcPositionX )
    ' read data
    GLCDDataTempWord = ST7920GLCDReadByte
    GLCDDataTempWord = ST7920GLCDReadByte
    GLCDDataTempWord = (GLCDDataTempWord*256) + ST7920GLCDReadByte
    ...
```

<span class="strong">**Key line:**</span>
`ST7920WriteByte( SysCalcPositionY )` — with `GLCD_RS` set off, this
writes an address byte (rather than display data) to select the Y
position that the following `ST7920GLCDReadByte` calls will read from.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920glcdreadbyte" class="link" title="ST7920GLCDReadByte">ST7920GLCDReadByte</a> — reading
    back a byte from the position set here
-   <a href="st7920writedata" class="link" title="ST7920WriteData">ST7920WriteData</a> — writing
    display data rather than an address byte

</div>

</div>
