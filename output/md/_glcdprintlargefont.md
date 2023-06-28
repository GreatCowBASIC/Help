<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_glcdprintlargefont"></span>GLCDPrintLargeFont

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
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
  
To display an integer use:  
  

``` screen
    GLCDPrintLargeFont( 0, 0, "13 Pixels Fixed Font" )
```

  
  

</div>
