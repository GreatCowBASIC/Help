<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcdrotate"></span>GLCDRotate

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    GLCDROTATE LANDSCOPE | PORTRAIT_REV | LANDSCAPE_REV  | PORTRAIT
```

<span class="strong">**Explanation:**</span>

Rotate the GLCD display to a relative position.

GLCD rotation needs to be supported by the GLCD chipset. <span
class="strong">**NOT**</span> all GLCD chipset support these commands.

The SSD1306 supports `LANDSCAPE` and `LANDSCAPE_REV` (180 degrees), in
the controller: draw the screen again after a rotate. See
<a href="ssd1306_controllers" class="link" title="SSD1306 Controllers">SSD1306 Controllers</a>.

The options are:

``` programlisting
    LANDSCAPE
    PORTRAIT_REV
    LANDSCAPE_REV
    PORTRAIT
```

The command will rotate the screen and set the following variables using
the global variables shown below.

``` programlisting
    GLCD_WIDTH
    GLCD_HEIGHT
```

The command is supported by the following global constants.

``` programlisting
    #define LANDSCAPE       1
    #define PORTRAIT_REV    2
    #define LANDSCAPE_REV   3
    #define PORTRAIT        4
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a> — related
    command in the same category
-   <a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a> — related
    command in the same category

</div>

</div>
