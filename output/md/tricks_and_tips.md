<div class="section">

<div class="titlepage">

<div>

<div>

<span id="tricks_and_tips"></span>Tricks and Tips
--------------------------------------------------

</div>

</div>

</div>

This is a collation of tricks and tips that may be useful to you.  
  
<a href="tricks_and_tips#RAMVARIABLESANDRESETS" class="link">RAM, variables and resets</a>

<a href="tricks_and_tips#FORNEXTLEGACY" class="link">Reverting the FOR-NEXT loop to the Legacy FOR-NEXT method</a>

<a href="tricks_and_tips#REQUIRED" class="link">Change the compilers behaviour when the compiler states a capability is not available</a>

<a href="tricks_and_tips#MINIMALASM" class="link">Create a minimal ASM source with no config and/or initsys</a>

<a href="tricks_and_tips#PPSandUSARTs" class="link">PPS microconrollers and multiple USARTs</a>  
  

<span id="RAMVARIABLESANDRESETS"></span><span class="strong">**TIP: RAM,
variables and resets**</span>

When you define a variable it will be mapped to a RAM location.   As you
develop your solution your should always do the following to ensure the
variable are initialised correctly.  

<div class="itemizedlist">

-   Always initialise variables to a known state

</div>

A variable will not show up in the ASM source code unless it is used
somewhere in code.    Adding `Variable = 0` will assure that the
variable is initialised and will show up in the ASM.   This is very
useful for troubleshooting.   This is essential when debugging ASM to
look at variables that are defined using "EQU".   If you do not
initialise or use the variable then the variable will not be shown in
the EQU list of variables.   So, initialise all your variables.

<div class="itemizedlist">

-   Always power cycle the microcontroller after programming

</div>

A soft reset when debugging/testing/programming will not reset the RAM
to a known state. This is essential when debugging ASM to look at
variables that are defined using "EQU".   A soft reset does not change
the contents of RAM.   Where a hard reset reverts ram back to an
undefined /random state!   So, a power cycle is good practice.    
  

<span id="FORNEXTLEGACY"></span><span class="strong">**TRICK: Reverting
the FOR-NEXT loop to the Legacy FOR-NEXT method ?**</span>

Why do this? To reduce the PROGMEM size.   But, you must assure yourself
that the loop variable cannot overflow as the legacy FOR-NEXT does not
prevent an overflow of the loop variable.

Some background.   In 2021 the GCBASIC compiler was updated to improve
the operation of the FOR-NEXT loop.   The improvement did increase the
size of the ASM generated.   The legacy FOR-NEXT loop had some major
issues that included never ending loops, incorrect end loop and
unexpected operations.   This was all caused by the compiler, not the
user, and in 2021 the compiler was updated to resolve these issues.  

However, there is a risk that the new FOR-NEXT method causes 1) larger
ASM that will not fit in small microcontrollers or 2) the new code does
not operate as expected.   In either case you can disable the new
FOR-NEXT method by adding a constant as shown below.   Adding this
constant will revert the FOR-NEXT loop asm generated to the legacy
method.  

``` screen
    #DEFINE USELEGACYFORNEXT
```

  
  

<span id="REQUIRED"></span><span class="strong">**TRICK: How to change
the compilers behaviour when the compiler states a capability is not
available when I know it is ?**</span>

The compiler is issuing an error message that a EEPROM, HEF, SAF, PWM16
or hardware USART is not available…​ but, it is.  

This is caused by the microcontroller DAT file.   The microcontroller
DAT file is missing key information that informs the compiler that a
specific capability is available.   This information was added to
prevent silent failures where you could use a capability when it is not
available.  

The compiler thinks your microcontroller does not have the selected
capability.    Simply use the table below to resolve.   Adding the
constant defined to your source program.  

Then, let us know via the Forum so we can correct the source
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

Very easy.   Simple add two `#OPTION` statements.  

`#OPTION UserCodeOnly ENTERBOOTLOADER:`   This will instruct the
compiler to NOT call the INITSYS() method.   And, to jump to a label.  
The label is mandated.  The label specified will be included in the ASM
generated.

`#OPTION NoConfig`  This will instruct the compiler to NOT add the
microcontroller specific config statements.

Example:

``` screen
    #chip 16f877a, 4
    #OPTION Explicit

    #OPTION UserCodeOnly ENTERBOOTLOADER:
    #OPTION NoConfig

    ENTERBOOTLOADER:
```

The example above yields the following asm.   Comment lines have been
removed for clarity.

``` screen
     LIST p=16F877A, r=DEC
    #include <P16F877A.inc>

    ;Vectors
      ORG 0
      pagesel ENTERBOOTLOADER
      goto  ENTERBOOTLOADER

    ;ORG 5


    ENTERBOOTLOADER

    ;ORG 2048
    ;ORG 4096
    ;ORG 6144

     END
```

<span id="PPSandUSARTs"></span><span class="strong">**TIP: PPS and
multiple USARTs**</span>

You can set up multiple pins to simultaneously operate as a peripheral
output on microcontrollers with Peripheral Pin Select (PPS).  
  
PPS microcontrollers can set up to simultaneously output specific
modules.   The example below shows the method to output two TX ports.  
Hardware Serial (TX1) data will now be output on both B.6 and C.6  
  

``` screen
    Sub InitPPS
            'Module: UART pin directions
            Dir PORTC.6 Out    ' Make TX1 pin an output
            Dir PORTB.6 Out    ' Make TX1 pin an output
            'Module: UART1 to two ports
            RC6PPS = 0x0020    'TX1 > RC6
            RB6PPS = 0x0020    'TX1 > RB6

    End Sub
```

</div>
