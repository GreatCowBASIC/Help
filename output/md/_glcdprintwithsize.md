<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_glcdprintwithsize"></span>GLCDPrintWithSize

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
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
  

``` screen
    GLCDPrintWithSize(PrintLocX, PrintLocY, "Using font size #2", 2 )
```

  
  

</div>
