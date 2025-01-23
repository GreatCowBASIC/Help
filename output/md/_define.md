<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_define"></span>\#DEFINE

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #DEFINE NAME [String]

    or

    #DEFINE NAME [ = String]
```

<span class="strong">**Explanation:**</span>  
  
`#DEFINE` allows to declare string-based preprocessor constants.  

This directive defines a text substitution string. Wherever `name` is
encountered in the program or assembly code, `string` will be
substituted.

The expansion is done recursively, until there is nothing more to expand
and the compiler can continue analyzing the resulting code.

The use of an existing constant is supported.  The order of constants
when using an existing constant is strict.  The constant must exist
prior to use.

To ensure evaluation of a calculation.   A \`=\` must be used.   This is
strict.

\#UNDEFINE can be used to make the compiler delete an existing constant.

Using the directive with no `string` causes a definition of `name` to be
noted internally and may be tested for using the ifdef
directive/conditional processing.  See the examples below.

Constants defined with this method are available for viewing in the CDF
file. Creation of the CDF file is controlled with the Programmer
Preferences Utility.

GCBASIC does not support creation of SUBroutine or FUNCTION with this
directive.

<span class="strong">**Examples:**</span>

This progress shows the creation of constants, the processing and
showing of constants within a script, creation of specific constants
within a script and use of constants within a program.

``` screen
    #chip MEGA4809
    #option Explicit


   // Numeric constants
        #define LENGTH 20
        #define CONTROL 0x19,7
        #define SINGLEPI = 22/7                                         // evaluated numberic string
        #define INTPI = INT(22/7)                                       // evaluated numberic string
        #define FACTOREDPI = INT((22/7 - INT(22/7))*1000)               // evaluated numberic string
        #define LENGTHSQUARED = LENGTH * LENGTH                         // evaluated numberic string
        #define PI 3.142
        #define RADIUS 10
        #define CIRCUMFERENCECALC = PI * RADIUS                         // evaluated numberic string, with constant substitution
        #define FACTORISEDCIRCUMFERENCE = INT(CIRCUMFERENCECALC*100)    // evaluated numberic string, with constant substitution


    //String(s) required double quotes and NO `=` assignment
        #define MYSTRING "This is a string"
    //  A string assignment is not required
        #define ACONSTANTTHATEXISTS

    // Macros are not supported.. just define the sub!
        // #define BADPOSITION(XX,YY,ZZ) (YY-(2 * ZZ +XX))

    // Unused Constants that are invalid may not report an error until try to use within your program- as in this example
        // String assignment with an equal sign will fail. Do not use `=`
        #define BADMYSTRING = "This is a string"


    #script
        //Scripts can modify and manage CONSTANTS

        // Warning can be used to show values during compilation
        WARNING LENGTH
        WARNING CONTROL
        WARNING SINGLEPI
        WARNING INTPI
        WARNING FACTOREDPI
        WARNING MYSTRING

        If DEF(ACONSTANTTHATEXISTS) Then
            WARNING "The constant ACONSTANTTHATEXISTS exists"
        End If

        // Test for a value in the [ChipData] section of the DAT file. Always has the prefix CHIP
        If DEF(CHIPAVRDX) Then
            WARNING "This is an AVRDX chip"
        End If

        // Good practice constant testing, see the code below for BAD and GOOD practice

            // Set the constant to 0 we can use this to test for validity
            // Use prefix of SCRIPT as this is clear in the program
            SCRIPTAN1CONSTANT = 0
            If DEF(AVRDX) Then
                // Is this an AVRDx chip
                If DEF(AIN1) Then
                    SCRIPTAN1CONSTANT =  AIN1
                End If
            End If
            If NODEF(AVRDX) Then
                // This is NOT an Avrdx chip
                If DEF(AVR) Then
                    // This is an AVR
                    SCRIPTAN1CONSTANT =  AN1
                End If
                If DEF(PIC) Then
                    // This is an AVR
                    SCRIPTAN1CONSTANT =  ANA1
                End If
            End If
            // Now test for validate result
            If SCRIPTAN1CONSTANT = 0 Then
                WARNING Script has determined that no valid ADC port exists, or, some other message
            End If

    #endscript

    // Some conditional examples

    #IF DEF( CONSTANTTHATEXISTS )
        //! Cause a compiler error - as the constant exits. Remove comment to test
    #ELSE
        //! Cause a compiler error - as the constant does not exits. Remove comment to test
    #ENDIF

    #IFDEF Oneof(CHIP_18F24K40,CHIP_18F25K40,CHIP_18F26K40,CHIP_18F27K40,CHIP_18F45K40,CHIP_18F46K40,CHIP_18F47K40,CHIP_18F65K40,CHIP_18F66K40,CHIP_18LF24K40, CHIP_18LF25K40, CHIP_18LF26K40, CHIP_18LF27K40, CHIP_18LF45K40, CHIP_18LF46K40, CHIP_18LF47K40, CHIP_18F65K40, CHIP_18LF65K40, CHIP_18F66K40, CHIP_18LF66K40, CHIP_18F67K40, CHIP_18LF67K40 )
        //~ Do something
    #ENDIF

    dim myStringVar as String
    myStringVar = MYSTRING

    // BAD PRACTICE = code is hard to understand
        // Use constant test to determine correct ADC to read.  Bad practice, see the #SCRIPT section
        dim mybyteVar as Byte
        #IF DEF(AIN1)
            mybyteVar = readAD( AIN1 )
        #ELSE
            #IF DEF(ANA1)
                mybyteVar = readAD( ANA1 )
            #ELSE
                mybyteVar = readAD( AN1 )
            #ENDIF
        #ENDIF

    // GOOD PRACTICE
        dim mybyteVar as Byte
        mybyteVar = readAD( SCRIPTAN1CONSTANT )

    dim myArray(2)
    myArray = CONTROL
```

  
  

<span class="strong">**See Also**</span>
<a href="constants" class="link" title="Constants">DEFINEs</a>

</div>
