<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcdprintstring"></span>GLCDPrintString

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    GLCDPrintString( String )
```

<span class="strong">**Explanation:**</span>

Prints string character(s) at a current XY location on the GLCD screen.

Where `String` is a String or String variable of the data to display

This command will <span class="strong">**NOT**</span> move the to start
of the next line after the string has been displayed

<span class="strong">**Example:**</span>

``` screen
    GLCDPrintStringLn ( "1.First Ln" )
    GLCDPrintStringLn ( "2.Second Ln" )
    GLCDPrintStringLn ( "" )
    GLCDPrintStringLn ( "4.Forth Ln" )
    GLCDLocateString( 0, 5 )
    GLCDPrintString ( "5." )
    GLCDPrintStringLn ( "Fifth Ln" )

    GLCDPrintStringLn ( "6.Sixth Ln" )
    GLCDLocateString( 0, 3 )
    dim val3 as Byte
    val3 = 3
    GLCDPrintStringLn ( str( val3 ) + ".Third Ln" )
```

</div>
