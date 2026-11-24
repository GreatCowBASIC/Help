<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcdprint"></span>GLCDPrint

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    GLCDPrint(PrintLocX, PrintLocY, PrintData_Byte [, Optional Colour] )    ',or
    GLCDPrint(PrintLocX, PrintLocY, PrintData_Word [, Optional Colour] )    ',or
    GLCDPrint(PrintLocX, PrintLocY, PrintData_Long [, Optional Colour] )    ',or

    GLCDPrint(PrintLocX, PrintLocY, PrintData_String [, Optional Colour] )
```

  
  
`PrintLocX` is the X corrdinate location for the data  
`PrintLocY` is the Y coordinate location for the data  
`PrintData_[type]` is a variable or constant to be displayed  
`Optional Colour` sets the foreground colour used to draw the text; only
meaningful on colour GLCD controllers (for example the ST7735, ST7789,
or SSD1331) and ignored on monochrome displays such as the KS0108 or
SSD1306.  
  
<span class="strong">**Explanation:**</span>  
  
Prints data values (byte, word, long or string) at a specified location
on the GLCD screen, using the current GCBASIC font set. `GLCDPrint`
automatically formats numeric variables as decimal text, so a `Byte`,
`Word`, or `Long` variable can be passed directly without first
converting it to a string.  
  
To display an integer use:  
  

``` programlisting
    GLCDPrint(PrintLocX, PrintLocY, strinteger(integer_value) )
```

  
  
<span class="strong">**Example:**</span>

``` programlisting
    #chip mega328p, 16
    #include <glcd.h>
    #define GLCD_TYPE GLCD_TYPE_SSD1306_128_64
    #define GLCD_I2C_Address 0x78

    Dim MyByte as Byte
    Dim MyWord as Word
    Dim MyLong as Long
    Dim MyString as String

    MyByte = 200
    MyWord = 45000
    MyLong = 123456789
    MyString = "GCBASIC"

    GLCDCLS
    GLCDPrint(0, 0, MyString)               ' <<< printing a String directly
    GLCDPrint(0, 16, MyByte)                'prints "200"
    GLCDPrint(0, 32, MyWord)                'prints "45000"
    GLCDPrint(0, 48, MyLong)                'prints "123456789"

    Do
    Loop
```

<span class="strong">**Key line:**</span>
`GLCDPrint(0, 0, MyString)` — writes the string variable starting at
pixel column 0, row 0; the three calls that follow show that `Byte`,
`Word`, and `Long` variables are printed the same way, with GLCDPrint
converting each numeric value to decimal text automatically.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a> — clearing
    the display before printing, as used above
-   <a href="glcddrawstring" class="link" title="GLCDDrawString">GLCDDrawString</a> — printing
    without the GCB font’s built-in numeric formatting
-   <a href="glcdprintlargefont" class="link" title="GLCDPrintLargeFont">GLCDPrintLargeFont</a> — related
    command in the same category
-   <a href="glcdprintwithsize" class="link" title="GLCDPrintWithSize">GLCDPrintWithSize</a> — related
    command in the same category

</div>

</div>
