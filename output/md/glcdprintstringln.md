<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcdprintstringln"></span>GLCDPrintStringLn

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    GLCDPrintStringLn( String )
```

<span class="strong">**Explanation:**</span>

Prints string character(s) at a current XY location on the GLCD screen.

Where `String` is a String or String variable of the data to display

This command will move to the start of the next line after the string
has been displayed

<span class="strong">**Example:**</span>

``` programlisting
    GLCDPrintStringLn ( "1.First Ln" )          ' <<< the GLCDPrintStringLn instruction
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

<span class="strong">**Key line:**</span>
`GLCDPrintStringLn ( "1.First Ln" )` — prints the string and then
advances the string pointer to the start of the next line, so each
successive call in this example lands on its own line without an
explicit `GLCDLocateString` call.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="glcdprintstring" class="link" title="GLCDPrintString">GLCDPrintString</a> — printing
    without advancing to the next line
-   <a href="glcdlocatestring" class="link" title="GLCDLocateString">GLCDLocateString</a> — explicitly
    positioning the string pointer, as used later in this example

</div>

</div>
