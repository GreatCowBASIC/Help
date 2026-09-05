<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="comments"></span>Comments

</div>

</div>

</div>

<span class="strong">**About Comments**</span>

Adding comments to your GCBASIC program can be done using a number of
methods. Comments are explanatory notes embedded within the code. They
are used to remind yourself, and to inform others, about the function of
your program. Comments are ignored by the compiler.

You can comment out sections of code by placing an apostrophe at the
beginning of each line. The GCBASIC IDE has a feature to do this
automatically.  
  
You can also use REM (for REMark statement), a semi-colon, or two
forward slashes.  
  
Multiline comments are supported for large text descriptions of code, or
to comment out chunks of code while debugging applications.

<span class="strong">**Syntax:**</span>

``` programlisting
    /*
      block comment
    */
```

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

### Warning

Graphical GCBASIC uses semi-colons to mark comments that it has inserted
automatically. It does not read these comments when opening a file, so
any comments in a GCBASIC program starting with a semi-colon will be
deleted if the program is opened using Graphical GCBASIC.

</div>

<span class="strong">**Example:**</span>

``` programlisting
    ' The number of pins to flash
    #define FlashPins 2

    REM You can create a header using an apostrophe before each line
    REM This is a great way to describe your program
    REM You can also use it to describe the hardware connections.

    ' You can place comments above the command or on the same line
    Dir PORTB Out ' Initialise PORTB to all Outputs

    ; The Main loop
    do
    PORTB = 0 ' All Pins off          ' <<< a same-line comment following a real instruction
    Wait 1 S ' Delay 1 second
    PORTB = 0xFF ' All pins on
    Wait 1 s ' Delay 1 second
    Loop
```

<span class="strong">**Key line:**</span>
`PORTB = 0 ' All Pins off` — everything from the apostrophe onward is a
comment and is ignored by the compiler; only `PORTB = 0` is actually
compiled.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="compiler_insights" class="link" title="Compiler Insights">Compiler Insights</a> — forcing
    custom comments into the generated ASM output
-   <a href="miscellaneous" class="link" title="Miscellaneous">Miscellaneous</a> — combining
    statements on a single line

</div>

</div>
