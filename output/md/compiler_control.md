<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="compiler_control"></span>Compiler Control

</div>

</div>

</div>

The compiler can be controlled, in terms of the default startup library
routines. This may be required to implement a specific control function,
or to disable a default startup behaviour.

<span class="strong">**Scenario \#1**</span>:

You have a new LCD. The GCBASIC LCD routines fail to initialise. You
want to write your own LCD initialise routine, but you want to ensure
the GCBASIC standard INITLCD() does not operate before your own LCD
initialise routine. How do you do this?

<span class="strong">**Scenario \#2**</span>:

You want to write your own INITSYS routine. You can add your own routine
to initialise the microcontroller, but the default INITSYS would always
be called in the ASM.

In the first scenario, the approach would be to redirect the GCBASIC
standard INITLCD() to myInitLCD using `#DEFINE INITLCD myINITLCD`.
However, prior to the latest build, this would fail to work. The reason
for the failure to redirect to your new routine is the
`#STARTUP INITLCD` directive. The `#STARTUP` directive was essentially
hard coded and none of the \`\#STARTUP\`s could be changed.

In the second scenario the ASM call to INITSYS is also hard coded. You
could trick the compiler into calling your own initialisation routine,
but this was not easy and not intuitive.

The new build now supports the updating of the \`\#STARTUP\`s with your
own routines, or even cancelling \`\#STARTUP\`s.

<span class="strong">**Examples:**</span>

The compiler will search for all \`\#STARTUP\`s and update across all
sources (libraries and includes). LCD.H is just an example.

`#DEFINE INITLCD myINITLCD` // This will change any reference in the
LCD.h \#startup INITLCD to \#startup myINITLCD.

`#DEFINE INITLCD` // With no second parameter, this would cancel any
\#startup in LCD.h.

`#DEFINE INITSYS myINITSYS` // This will change the default INITSYS to
myINITSYS.

`#DEFINE INITSYS` // This will remove the INITSYS from the
initialisation of the microcontroller.

<span class="strong">**Example to change LCD initialisation**</span>

``` programlisting
    #DEFINE INITLCD myINITLCD          ' <<< the #DEFINE instruction redirecting a #startup routine

    Sub myInitLCD
        // do stuff
    End Sub
```

<span class="strong">**Key line:**</span>
`#DEFINE INITLCD myINITLCD` — redirects every library `#STARTUP INITLCD`
call to `myInitLCD` instead, so a user-written LCD initialiser fully
replaces the standard one rather than running alongside it.

<span class="strong">**Example to replace INITSYS**</span>

``` programlisting
    #DEFINE INITSYS                      // Cancel call
    #STARTUP myInitSYS, 1               // New init routines, and set as highest priority

    Sub myInitSYS
        // do stuff
    End Sub
```

Scripts can also change the `#STARTUP`. You can add a script to change
the behaviour depending on a specific condition (the existence of
another constant).

In the user program:

``` programlisting
    #DEFINE LCD_OCULAR_OM1614
```

Supported within LCD.H:

``` programlisting
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

will generate ASM like this:

``` programlisting
    ;Program_memory_page: 0
        ORG 5
    BASPROGRAMSTART
    ;Call initialisation routines
        call    INITSYS
        call    INIT_OCULAR_OM1614_LCD

    ;Start_of_the_main_program
```

This new capability gives you more control of the compiler.  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_define" class="link" title="#DEFINE">#DEFINE</a> — redefining
    constants and startup routine names, as used above
-   <a href="_startup" class="link" title="#startup">#startup</a> — registering
    a subroutine to run at initialisation
-   <a href="_script" class="link" title="#script">#script</a> — compile-time
    scripting used above to switch the initialisation routine

</div>

</div>
