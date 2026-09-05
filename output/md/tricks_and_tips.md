<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="tricks_and_tips"></span>Tricks and Tips

</div>

</div>

</div>

This is a collation of tricks and tips that may be useful to you.  
  
<a href="tricks_and_tips#RAMVARIABLESANDRESETS" class="link">RAM, variables and resets</a>

<a href="tricks_and_tips#FORNEXTLEGACY" class="link">Reverting the FOR-NEXT loop to the Legacy FOR-NEXT method</a>

<a href="tricks_and_tips#REQUIRED" class="link">Change the compiler’s behaviour when the compiler states a capability is not available</a>

<a href="tricks_and_tips#MINIMALASM" class="link">Create a minimal ASM source with no config and/or initsys</a>

<a href="tricks_and_tips#PPSandUSARTs" class="link">PPS microcontrollers and multiple USARTs</a>  
  

<span id="RAMVARIABLESANDRESETS"></span><span class="strong">**TIP: RAM,
variables and resets**</span>

When you define a variable, it will be mapped to a RAM location. As you
develop your solution, you should always do the following to ensure the
variables are initialised correctly.

<div class="itemizedlist">

-   Always initialise variables to a known state

</div>

A variable will not show up in the ASM source code unless it is used
somewhere in code. Adding `Variable = 0` will ensure that the variable
is initialised and will show up in the ASM. This is very useful for
troubleshooting. This is essential when debugging ASM to look at
variables that are defined using "EQU". If you do not initialise or use
the variable, then it will not be shown in the EQU list of variables.
So, initialise all your variables.

<div class="itemizedlist">

-   Always power cycle the microcontroller after programming

</div>

A soft reset when debugging/testing/programming will not reset the RAM
to a known state. This is essential when debugging ASM to look at
variables that are defined using "EQU". A soft reset does not change the
contents of RAM. A hard reset, however, reverts RAM back to an
undefined/random state. So, a power cycle is good practice.  
  

<span id="FORNEXTLEGACY"></span><span class="strong">**TRICK: Reverting
the FOR-NEXT loop to the Legacy FOR-NEXT method**</span>

Why do this? To reduce the PROGMEM size. But, you must be sure that the
loop variable cannot overflow, as the legacy FOR-NEXT does not prevent
an overflow of the loop variable.

Some background. In 2021 the GCBASIC compiler was updated to improve the
operation of the FOR-NEXT loop. The improvement did increase the size of
the ASM generated. The legacy FOR-NEXT loop had some major issues,
including never-ending loops, incorrect end-of-loop behaviour, and other
unexpected operations. This was all caused by the compiler, not the
user, and in 2021 the compiler was updated to resolve these issues.

However, there is a risk that the new FOR-NEXT method causes 1) larger
ASM that will not fit in small microcontrollers, or 2) the new code does
not operate as expected. In either case you can disable the new FOR-NEXT
method by adding a constant as shown below. Adding this constant will
revert the FOR-NEXT loop ASM generated to the legacy method.

``` programlisting
    #DEFINE USELEGACYFORNEXT
```

  
  

<span id="REQUIRED"></span><span class="strong">**TRICK: How to change
the compiler’s behaviour when the compiler states a capability is not
available when I know it is**</span>

The compiler is issuing an error message that an EEPROM, HEF, SAF,
PWM16, or hardware USART is not available, but it is.

This is caused by the microcontroller DAT file. The microcontroller DAT
file is missing key information that informs the compiler that a
specific capability is available. This information was added to prevent
silent failures where you could use a capability when it is not
available.

The compiler thinks your microcontroller does not have the selected
capability. Simply use the table below to resolve this. Add the constant
defined to your source program.

Then, let us know via the forum, so we can correct the source
microcontroller DAT file.  
  

<div class="horizontal">

|                |                               |
|----------------|-------------------------------|
| EEPROM         | `#DEFINE CHIPEEPROM = 1`      |
| HEF            | `#DEFINE  CHIPHEFWORDS = 128` |
| SAF            | `#DEFINE  CHIPSAFWORDS = 128` |
| PWM16          | `#DEFINE  CHIPPWM16TYPE  = 1` |
| USART hardware | `#DEFINE  CHIPUSART  = 1`     |

</div>

  
  

<span id="MINIMALASM"></span><span class="strong">**TRICK: How do I
create a minimal ASM source with no config and/or initsys?**</span>

Very easy. Simply add two `#OPTION` statements.

`#OPTION USERCODEONLY ENTERBOOTLOADER:` This will instruct the compiler
NOT to call the INITSYS() method, and to jump to a label instead. The
label is mandated. The label specified will be included in the generated
ASM.

`#OPTION NOCONFIG` This will instruct the compiler NOT to add the
microcontroller-specific config statements.

`#OPTION StartupMethodDisabled` This will instruct the compiler to
disable all library startup methods. Examination of the generated ASM
will show the disabled methods as comments. The calls to these methods
can be added into the user program at a suitable place, if required.

Example:

``` programlisting
    #chip 16f877a, 4
    #OPTION Explicit

    #OPTION USERCODEONLY ENTERBOOTLOADER:
    #OPTION NOCONFIG
    #OPTION StartupMethodDisabled

    ENTERBOOTLOADER:
    HI2CSTOP // Just to show the startup method          ' <<< the disabled startup method call, now invoked explicitly
```

<span class="strong">**Key line:**</span>
`HI2CSTOP // Just to show the startup method` — with
`#OPTION StartupMethodDisabled` set, library startup calls like
`HI2CSTOP` are no longer invoked automatically at boot; calling it
explicitly here, right after the `ENTERBOOTLOADER:` label, shows how a
disabled startup method can be re-added exactly where the program needs
it.

The example above yields the following ASM. Comment lines have been
removed for clarity.

``` programlisting
     LIST p=16F877A, r=DEC
    #include <P16F877A.inc>

    ;Vectors
      ORG 0
      pagesel ENTERBOOTLOADER
      goto  ENTERBOOTLOADER

    ;ORG 5


    ;! Prepocessor Disabled Calls
    ;!  call HI2CINIT

    ENTERBOOTLOADER
    ;HI2CSTOP // Just to show the startup method being disabled above
    call    HI2CSTOP

    ...code

    ;ORG 2048
    ;ORG 4096
    ;ORG 6144

     END
```

<span id="PPSandUSARTs"></span><span class="strong">**TIP: PPS and
multiple USARTs**</span>

You can set up multiple pins to simultaneously operate as a peripheral
output on microcontrollers with Peripheral Pin Select (PPS).  
  
PPS microcontrollers can be set up to output specific modules
simultaneously. The example below shows the method to output two TX
ports. Hardware Serial (TX1) data will now be output on both B.6 and
C.6.  
  

``` programlisting
    Sub InitPPS
            'Module: UART pin directions
            Dir PORTC.6 Out    ' Make TX1 pin an output
            Dir PORTB.6 Out    ' Make TX1 pin an output
            'Module: UART1 to two ports
            RC6PPS = 0x0020    'TX1 > RC6          ' <<< assigning the TX1 signal to a second pin
            RB6PPS = 0x0020    'TX1 > RB6

    End Sub
```

<span class="strong">**Key line:**</span> `RC6PPS = 0x0020` — assigns
the TX1 peripheral signal to pin RC6 via PPS; the following line assigns
that same TX1 signal to RB6 as well, so both pins output identical
hardware-serial data simultaneously.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="for" class="link" title="For">For</a> — the FOR-NEXT
    loop this page’s legacy-mode trick applies to
-   <a href="peripheral_pin_select_for_microchip_microcontrollers" class="link" title="Peripheral Pin Select for Microchip microcontrollers.">Peripheral Pin Select for Microchip microcontrollers</a> — background
    on Peripheral Pin Select
-   <a href="compiler_insights" class="link" title="Compiler Insights">Compiler Insights</a> — more
    on how the compiler caches and generates ASM

</div>

</div>
