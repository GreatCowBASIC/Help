<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcdlocatestring"></span>GLCDLocateString

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    GLCDLocateString(PrintLocX, PrintLocY )
```

<span class="strong">**Explanation:**</span>

Moves the GLCD string pointer to the specified location on the GLCD
screen.

`PrintLocX` is the X corrdinate location for the data  
`PrintLocY` is the Y coordinate location for the data  

For the purpose of this command. The screen addressing is the first line
equates to the parameter 1, the second line equates to the paramter 2
etc.

An example:

``` programlisting
    GLCDLocateString( 0, 1 )    'The first line of the display
    GLCDLocateString( 0, 6 )    'The sixth line of the display
```

<span class="strong">**Example:**</span>

``` programlisting
    GLCDPrintStringLn ( "1.First Ln" )
    GLCDPrintStringLn ( "2.Second Ln" )
    GLCDPrintStringLn ( "" )
    GLCDPrintStringLn ( "4.Forth Ln" )
    GLCDLocateString( 0, 5 )          ' <<< the GLCDLocateString instruction
    GLCDPrintString ( "5." )
    GLCDPrintStringLn ( "Fifth Ln" )

    GLCDPrintStringLn ( "6.Sixth Ln" )
    GLCDLocateString( 0, 3 )
    dim val3 as Byte
    val3 = 3
    GLCDPrintStringLn ( str( val3 ) + ".Third Ln" )
```

<span class="strong">**Key line:**</span>
`GLCDLocateString( 0, 5 )` — moves the string pointer to line 5 before
the following `GLCDPrintString`/`GLCDPrintStringLn` calls write there,
letting the program jump between lines out of sequence (as also shown by
the later jump back to line 3).

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="glcdprintstring" class="link" title="GLCDPrintString">GLCDPrintString</a> — printing
    without moving to the next line
-   <a href="glcdprintstringln" class="link" title="GLCDPrintStringLn">GLCDPrintStringLn</a> — printing
    and advancing to the next line

</div>

</div>
