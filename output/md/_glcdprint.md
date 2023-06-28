<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_glcdprint"></span>GLCDPrint

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    GLCDPrint(PrintLocX, PrintLocY, PrintData_Byte [, Optional Colour] )    ',or
    GLCDPrint(PrintLocX, PrintLocY, PrintData_Word [, Optional Colour] )    ',or
    GLCDPrint(PrintLocX, PrintLocY, PrintData_Long [, Optional Colour] )    ',or

    GLCDPrint(PrintLocX, PrintLocY, PrintData_String [, Optional Colour] )
```

  
  
`PrintLocX` is the X corrdinate location for the data  
`PrintLocY` is the Y coordinate location for the data  
`PrintData_[type]` is a variable or constant to be displayed  
  
<span class="strong">**Explanation:**</span>  
  
Prints data values (byte, word, long or string) at a specified location
on the GLCD screen.  
  
To display an integer use:  
  

``` screen
    GLCDPrint(PrintLocX, PrintLocY, strinteger(integer_value) )
```

  
  

</div>
