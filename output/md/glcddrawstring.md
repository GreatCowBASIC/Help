<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcddrawstring"></span>GLCDDrawString

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    GLCDDrawString(CharLocX, CharLocY, String [, Optional Colour] )
```

`CharLocX` is the X corrdinate location for the character  
`CharLocY` is the Y coordinate location for the character  
`String` is the string of characters to display  
`Colour` can be ON or OFF. For the ST7735 devices this an be any word
value that represents the color palette

<span class="strong">**Explanation:**</span>

Displays an ASCII character at a specified X and Y location.  
On a 128x64 Graphic LCD :  
X = 1 to 128  
Y = 1 to 64  

</div>
