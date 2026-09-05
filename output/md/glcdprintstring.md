<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcdprintstring"></span>GLCDPrintString

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    GLCDPrintString( String )
```

<span class="strong">**Explanation:**</span>

Prints string character(s) at a current XY location on the GLCD screen.

Where `String` is a String or String variable of the data to display

This command will <span class="strong">**NOT**</span> move the to start
of the next line after the string has been displayed

<span class="strong">**Example:**</span>

``` programlisting
    GLCDPrintStringLn ( "1.First Ln" )
    GLCDPrintStringLn ( "2.Second Ln" )
    GLCDPrintStringLn ( "" )
    GLCDPrintStringLn ( "4.Forth Ln" )
    GLCDLocateString( 0, 5 )
    GLCDPrintString ( "5." )          ' <<< the GLCDPrintString instruction
    GLCDPrintStringLn ( "Fifth Ln" )

    GLCDPrintStringLn ( "6.Sixth Ln" )
    GLCDLocateString( 0, 3 )
    dim val3 as Byte
    val3 = 3
    GLCDPrintStringLn ( str( val3 ) + ".Third Ln" )
```

<span class="strong">**Key line:**</span>
`GLCDPrintString ( "5." )` — prints "5." without moving to the next
line, so the following `GLCDPrintStringLn ( "Fifth Ln" )` call continues
on the same line, joining the two into "5.Fifth Ln".

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="glcdprintstringln" class="link" title="GLCDPrintStringLn">GLCDPrintStringLn</a> — the
    line-advancing counterpart to this command
-   <a href="glcdlocatestring" class="link" title="GLCDLocateString">GLCDLocateString</a> — positioning
    the string pointer before printing, as used above

</div>

</div>
