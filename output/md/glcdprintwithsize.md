<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcdprintwithsize"></span>GLCDPrintWithSize

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    GLCDPrintWithSize(PrintLocX, PrintLocY, PrintData_Byte , FontSize [, Color ] )    ',or
    GLCDPrintWithSize(PrintLocX, PrintLocY, PrintData_Word , FontSize [, Color ] )    ',or
    GLCDPrintWithSize(PrintLocX, PrintLocY, PrintData_Long , FontSize [, Color ] )    ',or

    GLCDPrintWithSize(PrintLocX, PrintLocY, PrintData_String , FontSize [, Color ] )
```

  
  
`PrintLocX` is the X corrdinate location for the data  
`PrintLocY` is the Y coordinate location for the data  
`PrintData_[type]` is a variable or constant to be displayed  
`FontSize` is the GLCD fontsize.   Typical values are 1, 2 or 3  
`Color` is an optional parameter to change the color the GLCD printed
text.  
  
<span class="strong">**Explanation:**</span>  
  
Prints data values (byte, word, long or string) at a specified location
on the GLCD screen with a specific font size.  
  
To display a string using font size two use:  
  

``` programlisting
    GLCDPrintWithSize(PrintLocX, PrintLocY, "Using font size #2", 2 )          ' <<< the GLCDPrintWithSize instruction
```

<span class="strong">**Key line:**</span>
`GLCDPrintWithSize(PrintLocX, PrintLocY, "Using font size #2", 2 )` — the
fourth parameter (2) selects the font size, letting the same string be
drawn larger or smaller than \`GLCDPrint’s single fixed size.  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a> — the
    fixed-size equivalent of this command
-   <a href="glcdprintlargefont" class="link" title="GLCDPrintLargeFont">GLCDPrintLargeFont</a> — a
    dedicated large fixed font, string-only

</div>

</div>
