<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcdprintlargefont"></span>GLCDPrintLargeFont

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    GLCDPrintLargeFont( PrintLocX, PrintLocY, PrintData_String [, Optional Colour] )
```

GLCD supports for a larger fixed font of 13 pixels.   GLCDPrintLargeFont
supports strings only.

  
  
`PrintLocX` is the X corrdinate location for the data  
`PrintLocY` is the Y coordinate location for the data  
`PrintData_[type]` is a variable or constant to be displayed  
  
<span class="strong">**Explanation:**</span>  
  
Prints data values (byte, word, long or string) at a specified location
on the GLCD screen.  
  
As an exmaple, to display an string use:  
  

``` programlisting
    GLCDPrintLargeFont( 0, 0, "13 Pixels Fixed Font" )          ' <<< the GLCDPrintLargeFont instruction
```

<span class="strong">**Key line:**</span>
`GLCDPrintLargeFont( 0, 0, "13 Pixels Fixed Font" )` — draws the string
at pixel coordinates (0, 0) using the larger 13-pixel fixed font; unlike
`GLCDPrint`, this command accepts strings only, not byte/word/long
values.  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a> — the
    standard-font equivalent, which also accepts numeric values
-   <a href="glcdprintwithsize" class="link" title="GLCDPrintWithSize">GLCDPrintWithSize</a> — selecting
    a specific font size instead of the fixed large font

</div>

</div>
