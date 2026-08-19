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
methods.    Explanatory notes embedded within the code.   Comments are
used to remind yourself and to inform others about the function of your
program.   Comments are ignored by the compiler

You can comment out sections of code if you want just by placing an
apostrophe at the beginning of each line. The GCBASIC IDE has a feature
to do this automatically.  
  
You can also use a REM (for REMark statement), a semi-colon or two
forward slashes.  
  
Multiline comments are support for large text descriptions of code or to
comment out chunks of code while debugging applications.

<span class="strong">**Syntax:**</span>

``` screen
    /*
      block comment
    */
```

Warning: Graphical GCBASIC uses semi-colons to mark comments that it has
inserted automatically. It does not read these comments when opening a
file, so any comments in a GCBASIC program starting with a semi-colon
will be deleted if the program is opened using Graphical GCBASIC.

<span class="strong">**Example:**</span>

``` screen
    ' The number of pins to flash
    #define FlashPins 2

    REM You can create a header using an apostrophe before each line
    REM This is a great way to describe your program
    REM You can also use it to describe the hardware connections.

    ' You can place comments above the command or on the same line
    Dir PORTB Out ' Initialise PORTB to all Outputs

    ; The Main loop
    do
    PORTB = 0 ' All Pins off
    Wait 1 S ' Delay 1 second
    PORTB = 0xFF ' All pins on
    Wait 1 s ' Delay 1 second
    Loop
```

</div>
