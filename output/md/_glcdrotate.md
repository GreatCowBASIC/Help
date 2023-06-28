<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_glcdrotate"></span>GLCDRotate

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    GLCDROTATE LANDSCOPE | PORTRAIT_REV | LANDSCAPE_REV  | PORTRAIT
```

<span class="strong">**Explanation:**</span>

Rotate the GLCD display to a relative position.

GLCD rotation needs to be supported by the GLCD chipset. <span
class="strong">**NOT**</span> all GLCD chipset support these commands.

The options are:

``` screen
    LANDSCAPE
    PORTRAIT_REV
    LANDSCAPE_REV
    PORTRAIT
```

The command will rotate the screen and set the following variables using
the global variables shown below.

``` screen
    GLCD_WIDTH
    GLCD_HEIGHT
```

The command is supported by the following global constants.

``` screen
    #define LANDSCAPE       1
    #define PORTRAIT_REV    2
    #define LANDSCAPE_REV   3
    #define PORTRAIT        4
```

</div>
