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
you get started as a GCBASIC contributor, but that you wiil find useful
to refer to EVEN if you are already an experienced contributor.

<span class="strong">**Need Help?**</span>

The GCBASIC community prides itself on being an open, accessible, and
friendly community for new participants. If you have any difficulties
getting involved or finding answers to your questions, please bring
those questions to the forum via the discussion boards, where we can
help you get started.

We know EVEN before you start contributing that getting set up to work
on GCBASIC and finding a bug that is a good fit for your skills can be a
challenge. We are always looking for ways to improve this process:
making GCBASIC more open, accessible, and easier to participate with. If
you are having any trouble following this documentation, or hit a
barrier you cannot get around, please contact use via the discussion
forum. We will solve hurdles for new contributors and make GCBASIC
better.

This section addresses developing libraries but this guide is
appropriate to any GCBASIC development.

The section covers the recommended programming style, Constants,
Variables, Script syntax (gotchas) and tab usage.

<span class="strong">**PROGRAMMING STYLES**</span>

Indenting is standardized.

All scripts within a specific library should be the first major section
the library. Scripts within methods should not be used.

Some \#defines may need to be placed before the script to provide
clarity to the structure of the library.

``` screen
        #startup  startupsub

        #Define I2C_ADDRESS_1  0x4E    'The default address if user does not specify in the user program

        #SCRIPT
                ... code script
                ... code script
                ... code script
       #ENDSCRIPT
```

Scripts support structures like IF &lt;CONDITION&gt; THEN &lt;ACTION&gt;
END iF. Scripts supports the &lt;condition&gt; argument that must
generate a TRUE result, meaning that at a literal level, your
conditional formatting rule is an If - THEN statement along the lines of
“If this condition is TRUE, THEN process the &lt;ACTION&gt;. the
condition must use logical "AND" and "OR" to test two conditions. Using
"AND" or "OR" reduces the script size, however, it is essential the the
conditional test(s) are valid. If a test fails then you may not get the
results you expect.

``` screen
        IF .. THEN

        END IF
```

<span class="strong">**CONSTANTS**</span>

A constant is a value that cannot be altered by the program during
normal execution.   Within GCBASIC there are two ways to create
constants.    1. with the `#DEFINE` instruction, or, 2. via \`\#SCRIPT
.. \#ENDSCRIPT'. ;   Within a script constants can be created and
changed. A script is process that is executed prior to the GCBASIC
source program is processing the main user program.

An example of using `#DEFINE` is

``` screen
        #DEFINE TIME_DELAY_VALUE    10
```

The script construct is

``` screen
        #SCRIPT
              'Create a constant
              TIME_REPEAT_VALUE  =  10
        #ENDSCRIPT
```

<span class="strong">**<span class="emphasis">*Guide for
constants*</span>**</span>

The following rules are recommended.

1 - All CONSTANTS are capitalized

2 - Do not define a constant in a library unless required

3 - Create all library constants within a script ( see example below
<span class="strong">**Constrain a Constant Example**</span> on how to
constrain a constant)

2 - Underscores are permitted in constant names within Scripts \*\*

3 - No prefix is required when a CONSTANT is PUBLIC. A PUBLIC constant
is one that the user sets or the user can use.

4 - Prefix CONSTANTS with SCRIPT\_ when the CONSTANT is used outside of
the library specific script section AND ARE NOT EXPOSED AS PUBLIC
Constants.

5 - Prefix CONSTANTS with \_\_ (two underscores) when the CONSTANT is
ONLY used inside the library specific script section

6 - For PUBLIC prefix CONSTANTS with the capability name, \_ (one
underscore) and then a meaningful title, as follows GLCD\_HEIGHT
SPISRAM\_TYPE

7 - All scripts within a specific library should be the first major
section the library. Scripts within methods ( Sub, Functions) should not
be used.

8 - All scripts within a specific library should be the first major
section the library. Scripts within methods ( Sub, Functions) should not
be used.

9 - Other naming recommendations. Do not use underscores in subroutine,
function or variable names

<span class="strong">**<span class="emphasis">*Example script within a
library*</span>**</span>

``` screen
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

``` screen
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
     WAIT SCRIPT_LCDPOSTWRITEDELAY us
```

<span class="strong">**<span class="emphasis">*Create Constant
Example*</span>**</span>

Background:  All constants are always processed, regardless of where
they are placed in the user code or library.   This includes any
constant defined anywhere in user code or any library - the constant
will be processed and the constant will be defined.   The only method to
constrain a constant is via a script.  

The following code segment will not constrain the constant.   The
constant `MYCONSTANT` will be created.  The `#IFDEF PIC` will not
constrain even if an AVR or LGT chip.

``` screen
    #IFDEF PIC
          #DEFINE MYCONSTANT 255
    #ENDIF
```

The recommended method follows. The constant will only be created when a
PIC.

``` screen
    #SCRIPT
      IF PIC then
          MYCONSTANT  = 255
       End IF
    #ENDSCRIPT
```

<span class="strong">**<span class="emphasis">*Constrain a Constant
Example*</span>**</span>

An example to constrain a constant is to test if a user constant is
define in the user source program.   In this example the constant
`SENDALOW` is defined in user source program.  

<div class="itemizedlist">

-   If yes, then define the library specific constants.  
-   If no, then do not define the library specific constants.  

</div>

Using the method below defines constants only when the user requires the
constants assuming they have defined `SENDALOW` in the user source
program.

``` screen
    #SCRIPT
         IF SENDALOW then
                NONE = 0 : ODD = 1 : EVEN = 2 : NORMAL = 0 : INVERT = 1
                WAITFORSTART = 128 : SERIALINITDELAY = 5
         END IF

         IF SENDALOW then
                NONE = 0 : ODD = 1 : EVEN = 2 : NORMAL = 0 : INVERT = 1
                WAITFORSTART = 128 : SERIALINITDELAY = 5
         END IF

         IF SENDALOW then
                NONE = 0 : ODD = 1 : EVEN = 2 : NORMAL = 0 : INVERT = 1
                WAITFORSTART = 128 : SERIALINITDELAY = 5
         END IF
    #ENDSCRIPT
```

<span class="strong">**SCRIPTS VARIABLES**</span>

Scripting has the concept of variable that can be used within the
script.   The variables are NOT available as variables to a user program
or a library beyond the scope of the script.   The variables are
available to a user program as constants.   The variables will be
integer values, if accessed in a user program.  

<span class="strong">**SCRIPT SYNTAX**</span>

Scripting support the preprocessing of the program to create specific
constants.   Scripting has a basic syntax and this is detailed in the
HELP.   However, this guide is intended to provide insights into the
gotchas and best practices.

<span class="strong">**<span class="emphasis">*Script
Insights*</span>**</span>

Scripting handles the creation of specific constants that can be used
within the library.   Many libraries have script to create constants to
support PWM, Serial, HEFSAF etc.  

You can use the limited script language to complete calculations using
real numbers but you MUST ensure the resulting constant is an integer
value.   Use the IN() method to ensure an integer is assigned.

You can use IF-THEN-ENDIF but if your IF condtional test uses a chip
regiseter or a user define constant then you must ensure the register or
constant exists.   If you do not check the registrer or constant exists
the script will fail to operate as expected.  

There is limted syntax checking. You must ensure the quality of the
script by extensive testing.

``` screen
    int( register +1s))  'Will not create an error, but, simple give an unexpected result.
```

  
  

<span class="strong">**TAB USAGE AND INDENTING**</span>

Four spaces are to be used. A tab is not permitted

Example follows where the indents are all four spaces.

``` screen
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

``` screen
    SUB  ExampleSub (In VariableName)
            Select Case VariableName
                  Case 1
                                   Do This
                  Case 2
                                    Do That
             End Select
End SUB
```

and, not like this

``` screen
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

``` screen
    #option REQUIRED PIC|AVR CONSTANT %message.dat entry%
    #option REQUIRED PIC|AVR CONSTANT "Message string"
```

This option ensure that the specific CONSTANT exists within a library to
ensure a specific capability is available with the microcontroller.

This will cause the compiler check the CONSTANT is a non zero value. If
the CONSTANT does not exist it will be treated as a zero value.

Example:

This example tests the CONSTANT CHIPUSART for both the PIC and AVR
microcontrollers. If the CONSTANT is zero or does not exist then the
string will be displayed as an error message.

``` screen
    #option REQUIRED PIC CHIPUSART "Hardware Serial operations. Remove USART commands to resolve errors."
    #option REQUIRED AVR CHIPUSART "Hardware Serial operations. Remove USART commands to resolve errors."
```

<span class="strong">**RAISING COMPILER ERROR CONDITIONS**</span>

From build 1131 the compiler now supports raising a compiler error
message.

The method uses the \`RaiseCompilerError ""&lt;string&gt;""\|%string%"
\` method to pass an error message to the compilation process.

An example from USART.H/INITUSART subroutine is shown below.  This
example tests for the existence of one of the three supported baud rate
constants.  If none of the constants exist and the constant (in this
example) `STOPCOMPILERERRORHANDLER` does not exist the
`RaiseCompilerError` with the string will be passed to the assembler for
error processing.   This permits the inspect of the user program with
appropriate messages to inform the user.

``` screen
  ....
  #IFNDEF ONEOF(USART_BAUD_RATE,USART1_BAUD_RATE,USART2_BAUD_RATE) THEN
    'Look for one of the baud rates CONSTANTS
    #IFNDEF STOPCOMPILERERRORHANDLER
      'Use one of the following - the string MUST be start and end with a double quote

        ' Use the message.dat file
        ' RaiseCompilerError "%USART_NO_BAUD_RATE%"

        ' Use hard code text
        ' RaiseCompilerError "USART not setup correctly. No baud rate specified - please correct USART setup"

        RaiseCompilerError "%USART_NO_BAUD_RATE%"

    #ENDIF
  #ENDIF
  ....
```

The `RaiseCompilerError` handler can be stopped using the constant
STOPCOMPILERERRORHANDLER as shown above.  
  
<span class="strong">**LCD ERROR HANDLING**</span>

The setup of an LCD is inspected and an appropriate error message is
displayed.   The Compiler now controls error messages when LCD is not
setup up correctly.   This the text displayed is held in the
messages.dat file - LCD\_Not\_Setup entry.  
  

</div>
