<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcddrawchar"></span>GLCDDrawChar

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    GLCDDrawChar(CharLocX, CharLocY, CharCode [, Optional Colour] )
```

`CharLocX` is the `X` coordinate location for the character  
`CharLocY` is the `Y` coordinate location for the character  
`CharCode` is the ASCII number of the character to display. Can be
decimal hex or binary.

Colour can be `ON` or `OFF`. For the ST7735 devices this an be any word
value that represents the color palette.

<span class="strong">**Explanation:**</span>

Displays an ASCII character at a specified X and Y location. On a 128x64
Graphic LCD:

X = 1 to 128  
Y = 1 to 64  

</div>
