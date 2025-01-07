<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="compiler_control"></span>Compiler Control

</div>

</div>

</div>

The compiler can be controlled, in terms of the default startup library
routines.  This may be required to implement a specific control
function, or, to disable a default startup behaviour.

<span class="strong">**Scenario \#1**</span>:

You have a new LCD.  The GCBASIC LCD routines fail to initialise.  You
want to write your own LCD initialise routine, but you want to ensure
the GCBASIC standard INITLCD() does not operate before your own LCD
initialise routine.  How to do this?

<span class="strong">**Scenerio \#2**</span>:

You want to write your own INITSYS routine.   You can add your own
routine to initialise the microntroller but the default INITSYS would
always be called in the ASM.

In the first sceneria the approach would be to redirect the GCBASIC
standard INITLCD() to myInitLCD using \#define INITLCD myINITLCD.  
However, prior to the latest build, this would fail to work.  The reason
for the failure to redirect to your new routine is the \#startup INITLCD
directive.  The \#startup directive was essentially hard coded and all
the \#startup(s) could not be changed.

In the second scenerio the ASM call to INITSYS is also hard coded.  And,
you could trick the compiler to call your own initialisation routine but
this was not easy and not intuitive.  

The new build now supports the updating of the \#startup(s) with your
own routines, or even to cancel \#startup(s).

<span class="strong">**Examples:**</span>

The compiler will search for all \#startup(s) and update across all
sources (libraries and includes).  LCD.H is just an example.

`#DEFINE INITLCD myINITLCD` // This will change any reference in the
LCD.h \#startup INITLCD to \#startup myINITLCD.

`#DEFINE INITLCD` // With no second parameter would cancel any \#startup
in LCD.h.

`#DEFINE INITSYS myINITSYS` // This will change the default INITSYS to
myINITSYS.

`#DEFINE INITSYS` // This will remove the INITSYS from the
initialisation of the microcontroller.

<span class="strong">**Example to change LCD initialisation**</span>

``` screen
    #DEFINE INITLCD myINITLCD

    Sub myInitLCD
        // do stuff
    End Sub
```

<span class="strong">**Example to replace INITSYS**</span>

``` screen
    #DEFINE INITSYS                      // Cancel call
    #STARTUP myInitSYS, 1               // New init routines, and set as highest priority

    Sub myInitSYS
        // do stuff
    End Sub
```

Scripts can now change the \#startup.   You can add a script to change
the behaviour dependent on a specific condition ( the existant of
another constant).

In user program

``` screen
    #DEFINE LCD_OCULAR_OM1614
```

Supported within LCD.H

``` screen
    #SCRIPT
        If Def( LCD_OCULAR_OM1614 ) Then
            'Change INITLCD to specific Initialisation sub
            INITLCD = INIT_OCULAR_OM1614_LCD
        End if
    #ENDSCRIPT

    ......

    Sub INIT_OCULAR_OM1614_LCD
        .. lots of code
    End Sub
```

will generate ASM like this…​

``` screen
    ;Program_memory_page: 0
        ORG 5
    BASPROGRAMSTART
    ;Call initialisation routines
        call    INITSYS
        call    INIT_OCULAR_OM1614_LCD

    ;Start_of_the_main_program
```

This new capability to give you more control of the compiler.  
  

<span class="strong">**For more help, see:**</span> \#define, \#startup

</div>
