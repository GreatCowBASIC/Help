<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="development_guide"></span>Development Guide

</div>

</div>

</div>

There are lots of ways to contribute to the GCBASIC project: coding,
testing, improving the build process and tools, or contributing to the
documentation. This guide provides information that will not only help
you get started as a GCBASIC contributor, but that you will find useful
to refer to even if you are already an experienced contributor.

<span class="strong">**Need Help?**</span>

The GCBASIC community prides itself on being an open, accessible, and
friendly community for new participants. If you have any difficulties
getting involved or finding answers to your questions, please bring
those questions to the forum via the discussion boards, where we can
help you get started.

We know that, even before you start contributing, getting set up to work
on GCBASIC and finding a bug that is a good fit for your skills can be a
challenge. We are always looking for ways to improve this process:
making GCBASIC more open, accessible, and easier to participate in. If
you are having any trouble following this documentation, or hit a
barrier you cannot get around, please contact us via the discussion
forum. We will solve hurdles for new contributors and make GCBASIC
better.

This section addresses developing libraries, but this guide is
appropriate to any GCBASIC development.

The section covers the recommended programming style, constants,
variables, script syntax (gotchas), and tab usage.

<span class="strong">**PROGRAMMING STYLES**</span>

Indenting is standardised.

All scripts within a specific library should be the first major section
of the library. Scripts within methods should not be used.

Some \`\#define\`s may need to be placed before the script to provide
clarity to the structure of the library.

``` programlisting
        #startup  startupsub

        #Define I2C_ADDRESS_1  0x4E    'The default address if user does not specify in the user program

        #SCRIPT
                ... code script
                ... code script
                ... code script
       #ENDSCRIPT
```

Scripts support structures like `IF <CONDITION> THEN <ACTION> END IF`.
Scripts support the `<condition>` argument, which must generate a TRUE
result, meaning that at a literal level, your conditional test is an
If-Then statement along the lines of "If this condition is TRUE, THEN
process the &lt;ACTION&gt;." The condition can use the logical `AND` and
`OR` operators to test two conditions. Using `AND` or `OR` reduces the
script size; however, it is essential that the conditional test(s) are
valid. If a test fails, then you may not get the results you expect.

``` programlisting
        IF .. THEN

        END IF
```

<span class="strong">**CONSTANTS**</span>

A constant is a value that cannot be altered by the program during
normal execution. Within GCBASIC there are two ways to create constants:
1. with the `#DEFINE` instruction, or 2. via `#SCRIPT .. #ENDSCRIPT`.
Within a script, constants can be created and changed. A script is a
process that is executed prior to GCBASIC processing the main user
program.

An example of using `#DEFINE` is:

``` programlisting
        #DEFINE TIME_DELAY_VALUE    10
```

The script construct is:

``` programlisting
        #SCRIPT
              'Create a constant
              TIME_REPEAT_VALUE  =  10
        #ENDSCRIPT
```

<span class="strong">**<span class="emphasis">*Guide for
constants*</span>**</span>

The following rules are recommended.

1 - All CONSTANTS are capitalised

2 - Do not define a constant in a library unless required

3 - Create all library constants within a script (see the example below,
<span class="strong">**Constrain a Constant Example**</span>, on how to
constrain a constant)

4 - Underscores are permitted in constant names within Scripts

5 - No prefix is required when a CONSTANT is PUBLIC. A PUBLIC constant
is one that the user sets, or that the user can use.

6 - Prefix CONSTANTS with `SCRIPT_` when the CONSTANT is used outside of
the library-specific script section, and is NOT exposed as a PUBLIC
constant.

7 - Prefix CONSTANTS with `__` (two underscores) when the CONSTANT is
only used inside the library-specific script section.

8 - For PUBLIC constants, prefix with the capability name, `_` (one
underscore), and then a meaningful title, as follows: GLCD\_HEIGHT
SPISRAM\_TYPE

9 - All scripts within a specific library should be the first major
section of the library. Scripts within methods (Sub, Function) should
not be used.

10 - Other naming recommendations: do not use underscores in subroutine,
function, or variable names.

<span class="strong">**<span class="emphasis">*Example script within a
library*</span>**</span>

``` programlisting
          #startup  startupsub
          #DEFINE I2C_ADDRESS_1  0x4E    'Default address if user omits
          #SCRIPT
                'script code
                'script code
                'script code
          #ENDSCRIPT
```

<span class="strong">**<span class="emphasis">*Simple
Example*</span>**</span>

``` programlisting
     #SCRIPT  'Calculate Delay Time
             __LCD_DELAY  = ( __LCD_TIMEPERIOD - __LCD_DELAYS) - (INT((4/ChipMHZ) * __LCD_INSTRUCTIONS))
            SCRIPT_LCD_POSTWRITEDELAY = __LCD_DELAY
            SCRIPT_LCD_CHECKBUSYFLAG = TRUE
     #ENDSCRIPT

     'usage within user code or code outside of script
     #IF SCRIPT_LCD_CHECKBUSYFLAG = TRUE
           WaitForReady    'Call subroutine to poll busy flag
           set LCD_RW OFF  'Write mode
     #ENDIF
     WAIT SCRIPT_LCD_POSTWRITEDELAY us          ' <<< using a script-computed delay constant at runtime
```

<span class="strong">**Key line:**</span>
`WAIT SCRIPT_LCD_POSTWRITEDELAY us` — `SCRIPT_LCD_POSTWRITEDELAY` was
computed once at compile time inside the `#SCRIPT` block above (from the
LCD’s timing constants), so this line waits for a value that was
calculated specifically for the target chip’s clock speed, rather than a
fixed number hard-coded by the library author.

<span class="strong">**<span class="emphasis">*Create Constant
Example*</span>**</span>

Background: all constants are always processed, regardless of where they
are placed in the user code or library. This includes any constant
defined anywhere in user code or any library - the constant will be
processed and the constant will be defined. The only method to constrain
a constant is via a script.

The following code segment will not constrain the constant. The constant
`MYCONSTANT` will be created. The `#IFDEF PIC` will not constrain it,
even for an AVR or LGT chip.

``` programlisting
    #IFDEF PIC
          #DEFINE MYCONSTANT 255
    #ENDIF
```

The recommended method follows. The constant will only be created when
targeting a PIC.

``` programlisting
    #SCRIPT
      IF PIC then
          MYCONSTANT  = 255
       End IF
    #ENDSCRIPT
```

<span class="strong">**<span class="emphasis">*Constrain a Constant
Example*</span>**</span>

An example of constraining a constant is to test whether a user constant
is defined in the user source program. In this example the constant
`SENDALOW` is defined in the user source program.

<div class="itemizedlist">

-   If yes, then define the library-specific constants.
-   If no, then do not define the library-specific constants.

</div>

Using the method below defines constants only when the user requires
them, assuming they have defined `SENDALOW` in the user source program.

``` programlisting
    #SCRIPT
         IF SENDALOW then
                NONE = 0 : ODD = 1 : EVEN = 2 : NORMAL = 0 : INVERT = 1
                WAITFORSTART = 128 : SERIALINITDELAY = 5
         END IF
    #ENDSCRIPT
```

<span class="strong">**SCRIPTS VARIABLES**</span>

Scripting has the concept of a variable that can be used within the
script. The variables are NOT available as variables to a user program
or a library beyond the scope of the script. The variables are available
to a user program as constants. The variables will be integer values, if
accessed in a user program.

<span class="strong">**SCRIPT SYNTAX**</span>

Scripting supports the preprocessing of the program to create specific
constants. Scripting has a basic syntax, and this is detailed in the
<a href="scripts" class="link" title="Scripts">Scripts</a> help
page. However, this guide is intended to provide insights into the
gotchas and best practices.

<span class="strong">**<span class="emphasis">*Script
Insights*</span>**</span>

Scripting handles the creation of specific constants that can be used
within the library. Many libraries have scripts to create constants to
support PWM, Serial, HEFSAF, etc.

You can use the limited script language to complete calculations using
real numbers, but you MUST ensure the resulting constant is an integer
value. Use the `INT()` method to ensure an integer is assigned.

You can use `IF-THEN-ENDIF`, but if your IF conditional test uses a chip
register or a user-defined constant, then you must ensure the register
or constant exists. If you do not check that the register or constant
exists, the script will fail to operate as expected.

There is limited syntax checking. You must ensure the quality of the
script by extensive testing.

``` programlisting
    int( register +1s))  'Will not create an error, but will simply give an unexpected result.
```

  
  

<span class="strong">**TAB USAGE AND INDENTING**</span>

Four spaces are to be used. A tab is not permitted.

Example follows, where the indents are all four spaces.

``` programlisting
sub  ExampleSub (In VariableName)
    select case VariableName
        case 1
            Do This
        case 2
            Do That
    end select
end sub
```

Not like this:

``` programlisting
    SUB  ExampleSub (In VariableName)
            Select Case VariableName
                  Case 1
                                   Do This
                  Case 2
                                    Do That
             End Select
End SUB
```

and not like this:

``` programlisting
    Sub  ExampleSub (In VariableName)
    Select Case VariableName
    Case 1
    Do This
    Case 2
    Do That
    End Select
    End Sub
```

<span class="strong">**OPTION REQUIRED**</span>

`#Option Required` supports ensuring the microcontroller has the
mandated capabilities, such as EEPROM, HEF, SAF, USART.

Syntax:

``` programlisting
    #option REQUIRED PIC|AVR CONSTANT %message.dat entry%
    #option REQUIRED PIC|AVR CONSTANT "Message string"
```

This option ensures that the specific CONSTANT exists within a library,
to ensure a specific capability is available on the microcontroller.

This will cause the compiler to check that the CONSTANT is a non-zero
value. If the CONSTANT does not exist, it will be treated as a zero
value.

Example:

This example tests the CONSTANT `CHIPUSART` for both the PIC and AVR
microcontrollers. If the CONSTANT is zero or does not exist, then the
string will be displayed as an error message.

``` programlisting
    #option REQUIRED PIC CHIPUSART "Hardware Serial operations. Remove USART commands to resolve errors."
    #option REQUIRED AVR CHIPUSART "Hardware Serial operations. Remove USART commands to resolve errors."
```

<span class="strong">**RAISING COMPILER ERROR CONDITIONS**</span>

From build 1131, the compiler now supports raising a compiler error
message.

The method uses `RaiseCompilerError "<string>"|%string%` to pass an
error message to the compilation process.

An example from the USART.H `INITUSART` subroutine is shown below. This
example tests for the existence of one of the three supported baud rate
constants. If none of the constants exist, and the constant (in this
example) `STOPCOMPILERERRORHANDLER` does not exist, `RaiseCompilerError`
with the string will be passed to the assembler for error processing.
This permits inspection of the user program, with appropriate messages
to inform the user.

``` programlisting
  ....
  #IFNDEF ONEOF(USART_BAUD_RATE,USART1_BAUD_RATE,USART2_BAUD_RATE) THEN
    'Look for one of the baud rates CONSTANTS
    #IFNDEF STOPCOMPILERERRORHANDLER
      'Use one of the following - the string MUST start and end with a double quote

        ' Use the message.dat file
        ' RaiseCompilerError "%USART_NO_BAUD_RATE%"

        ' Use hard coded text
        ' RaiseCompilerError "USART not setup correctly. No baud rate specified - please correct USART setup"

        RaiseCompilerError "%USART_NO_BAUD_RATE%"          ' <<< reporting a compile-time error with a message.dat-driven string

    #ENDIF
  #ENDIF
  ....
```

<span class="strong">**Key line:**</span>
`RaiseCompilerError "%USART_NO_BAUD_RATE%"` — halts compilation with the
message looked up from the `USART_NO_BAUD_RATE` entry in message.dat,
but only runs when none of the three baud-rate constants exist AND
`STOPCOMPILERERRORHANDLER` has not been defined by the user to suppress
this specific check.

The `RaiseCompilerError` handler can be stopped using the constant
`STOPCOMPILERERRORHANDLER`, as shown above.  
  
<span class="strong">**LCD ERROR HANDLING**</span>

The setup of an LCD is inspected, and an appropriate error message is
displayed. The compiler now controls error messages when the LCD is not
set up correctly. The text displayed is held in the messages.dat file -
the `LCD_Not_Setup` entry.  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="gcbasic_maintenance" class="link" title="GCBASIC Maintenance">GCBASIC Maintenance</a> — the
    broader release/build process this guide feeds into
-   <a href="scripts" class="link" title="Scripts">Scripts</a> — the
    general \#script reference
-   <a href="_option_required" class="link" title="#Option Required">#Option Required</a> — the
    standalone reference for this directive

</div>

</div>
