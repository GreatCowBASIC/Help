<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="compiler_source_insights"></span>Compiler Source Insights

</div>

</div>

</div>

<span class="emphasis">*There are many very useful methods*</span> - a
lot of methods - look at existing code before adding any new method. The
compiler is mature from a functionality standpoint. Just immature in
terms of documentation.

<span class="strong">**COMPILER DEBUGGING**</span>

<span class="emphasis">*To debug or isolate a specific issue*</span>,
use lots of messages using PRINT or HSERPRINT. Both of these methods are
easy to set up and use.

<span class="emphasis">*Specific to \#SCRIPT*</span>, you can use
WARNING messages to display results of calculations or assignments.

<span class="emphasis">*Specific to conditional compilation*</span>, use
`conditionaldebugfile` (see above) to display conditional statement
debug information for the specified file. Options are any valid source
file or nothing. Nested conditions are evaluated sequentially, therefore
the first, second, third, etc. At this point, the compiler does not
rationalise the hierarchy of nested conditions. It simply finds a
condition and then matches it to an `#ENDIF`. So, the compiler walks
through the nested conditions, from the outer nest, to the next nest, to
the next nest, etc. The compiler completes the following actions:

<div class="orderedlist">

1.  If the conditional is not valid, remove the code segment including
    the `#IF` and the `#ENDIF`.
2.  If the conditional is valid, remove just the `#IF` and the `#ENDIF`.

</div>

So, in this context the compiler walks the code many times (as these are
lists, not arrays, this is blindingly fast) removing code segments.

The following program shows the impact of nested conditions. Each nest
is evaluated until all conditions have been assessed. See the comment
section of the listing to see the output from the debugging.

``` programlisting
        #CHIP 18F16Q41
        #OPTION EXPLICIT

        ; -----  Add the following line to USE.ini ------------------
        ;
        ;        conditionaldebugfile = IFDEF_TEST.gcb
        ;
        ; -----------------------------------------------------------

        #IFDEF PIC
            #IFDEF ONEOF(CHIP_18F15Q41, CHIP_18F16Q41)
                #IF CHIPRAM = 2048  'TRUE
                    #IF CHIPWORDS = 32768 ' TRUE
                        #IFDEF VAR(NVMLOCK) 'TRUE
                            #IFDEF VAR(OSCCON2)  'TRUE
                                #IFDEF  VAR(NVMCON0)  'TRUE    set var1 to 1
                                    DIM _VAR1
                                    _VAR1 = 1
                                #ENDIF
                            #ENDIF
                        #ENDIF
                    #ENDIF
                #ENDIF

                #IF CHIPRAM = 4096  'TRUE
                    #IF CHIPWORDS = 32768 ' TRUE
                        #IFDEF VAR(NVMLOCK) 'TRUE
                            #IFDEF VAR(OSCCON2)  'TRUE
                                #IFDEF  VAR(NVMCON0)  'TRUE   = set var1 to 0
                                    DIM _VAR1
                                    _VAR1 = 0          ' <<< the assignment the debug trace below confirms actually executes
                                #ENDIF
                            #ENDIF
                        #ENDIF
                    #ENDIF
                #ENDIF
            #ENDIF
        #ENDIF

        Do
        Loop

        // ===============================================
        // ***  Below is debugger output for this file ***
        // ===============================================

        // GCBASIC (0.99.02 2022-07-21 (Windows 32 bit) : Build 1143)

        // Compiling c:\Users\admin\Downloads\IFDEF_TEST.gcb

        //               13: #IFDEF PIC
        //               15: #IFDEF ONEOF(CHIP_18F15Q41, CHIP_18F16Q41)
        //               17: #IF CHIPRAM = 2048
        //               19: #IF CHIPWORDS = 32768
        //               21: #IFDEF VAR(NVMLOCK)
        //               23: #IFDEF VAR(OSCCON2)
        //               25: #IFDEF VAR(NVMCON0)
        //               ;DIM _VAR1
        //               27: DIM _VAR1
        //               ;_VAR1 = 1
        //               28: _VAR1 = 1

        //               15: #IFDEF ONEOF(CHIP_18F15Q41, CHIP_18F16Q41)
        //               17: #IF CHIPRAM = 2048
        //               19: #IF CHIPWORDS = 32768
        //               21: #IFDEF VAR(NVMLOCK)
        //               23: #IFDEF VAR(OSCCON2)
        //               25: #IFDEF VAR(NVMCON0)
        //               ;DIM _VAR1
        //               27: DIM _VAR1
        //               ;_VAR1 = 1
        //               28: _VAR1 = 1

        //               39: #IF CHIPRAM = 4096
        //               41: #IF CHIPWORDS = 32768
        //               43: #IFDEF VAR(NVMLOCK)
        //               45: #IFDEF VAR(OSCCON2)
        //               47: #IFDEF VAR(NVMCON0)
        //               ;DIM _VAR1
        //               49: DIM _VAR1
        //               ;_VAR1 = 0
        //               50: _VAR1 = 0

        //               41: #IF CHIPWORDS = 32768
        //               43: #IFDEF VAR(NVMLOCK)
        //               45: #IFDEF VAR(OSCCON2)
        //               47: #IFDEF VAR(NVMCON0)
        //               ;DIM _VAR1
        //               49: DIM _VAR1
        //               ;_VAR1 = 0
        //               50: _VAR1 = 0

        //               43: #IFDEF VAR(NVMLOCK)
        //               45: #IFDEF VAR(OSCCON2)
        //               47: #IFDEF VAR(NVMCON0)
        //               ;DIM _VAR1
        //               49: DIM _VAR1
        //               ;_VAR1 = 0
        //               50: _VAR1 = 0

        //               45: #IFDEF VAR(OSCCON2)
        //               47: #IFDEF VAR(NVMCON0)
        //               ;DIM _VAR1
        //               49: DIM _VAR1
        //               ;_VAR1 = 0
        //               50: _VAR1 = 0

        //               47: #IFDEF VAR(NVMCON0)
        //               ;DIM _VAR1
        //               49: DIM _VAR1
        //               ;_VAR1 = 0
        //               50: _VAR1 = 0

        // Program compiled successfully (Compile time: 1 seconds)

        // Assembling program using GCASM
        // Program assembled successfully (Assembly time: 0.125 seconds)
        // Done
```

<span class="strong">**Key line:**</span> `_VAR1 = 0` — of the two
nested `#IF CHIPRAM` branches (2048 and 4096), the debug trace shows
only the `CHIPRAM = 4096` branch’s assignments actually executing last
for this chip, which is why the resulting ASM below sets `_VAR1` to 0,
not 1.

  
  

The resulting ASM from the above code is as expected. The assignment of
`VAR1 = 0`.

``` programlisting
        ;DIM _VAR1
        ;_VAR1 = 0
            clrf    _VAR1,ACCESS
        ;Do
        SysDoLoop_S1
        ;Loop
            bra SysDoLoop_S1
        SysDoLoop_E1
```

  

<span class="strong">**COMPILERDEBUG**</span>

The COMPILERDEBUG setting in the USE.INI file for GCBASIC is used to
enable or disable debugging features for the compiler. When the bits of
the COMPILERDEBUG setting are set to 1, it activates additional debug
information during compilation, which can be helpful for developers to
diagnose and fix issues.

To see the permissible bits for COMPILERDEBUG, first open and close the
<a href="about_the_preferences_editor" class="link" title="About the Preferences Editor">Preferences Editor</a>
(this does imply that the Preferences Editor is maintained to show the
header in USE.INI), and then edit USE.INI. The help section will display
the following:

``` programlisting
    'Preferences file for GCBASIC Preferences 3.14

    ... lots of help, then

    '   compilerdebug =  0  - 1 = COMPILECALCADD
    '                       - 2 = VAR SET
    '                       - 4 = CALCOPS
    '                       - 8 = COMPILECALCMULT
    '                       - 16 = AUTOPINDIR
    '                       - 32 = ADRDX
    '                       - 64 = GCASM
    '                       - 128 = COMPILESUBCALLS
    '                       - 256 = COMPILEUPDATESUBMAP
```

To see the debug output, add or edit the `[gcbasic]` section of USE.INI.

``` programlisting
    [gcbasic]
    'change to a bitwise value
    compilerdebug = 0
```

As previously stated, this setting can be helpful for developers to
diagnose and fix issues within the compiler.

</div>
