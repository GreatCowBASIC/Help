<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="compiler_source_insights"></span>COMPILER SOURCE INSIGHTS

</div>

</div>

</div>

<span class="emphasis">*There are many very useful methods*</span>, a
lot of methods, look at existing code before adding any new method.  
The compiler is mature from a functionality standpoint.   Just immature
in terms of documentation.  

<span class="strong">**COMPILER DEBUGGING**</span>

<span class="emphasis">*To debug or isolate a specific issue*</span> use
lots of messages using PRINT or HSERPRINT  Both of these methods are
easy to setup and use.

<span class="emphasis">*Specific to \#SCRIPT*</span> you can use WARNING
messages to display results of calculations or assignments.

<span class="emphasis">*Specific to CONDITIONAL Compilation*</span> use
`conditionaldebugfile` (se above) to display conditional statement debug
for the specified file.    Options are any valid source file or nothing.
   Nested conditions are evaluated sequentially, therefor the first,
second, third etc etc.    The compiler does not at this point
rationalised the hierarchy of nested conditions.   It simply finds a
condition and then matches to an \#ENDIF.   So, the compiler walks
through the nested conditions as the outer nested, then the next nest,
the next nest etc. etc.   This compiler is completing the following
actions:  

<div class="orderedlist">

1.  If the conditional is not valid.   Remove the code segment include
    the \#IF and the \#ENDIF
2.  If the conditional is valid.   Remove the just the \#IF and the
    \#ENDIF

</div>

So, is this context the compiler walks the code many time (as these are
lists not arrrays this is blindly fast) removing code segments.  

The following program shows the impact of nested conditions..  Each nest
is evaluated until all conditions have been assessed..  See the comment
section of the listing to see the output from the debugging.

``` screen
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
                                    _VAR1 = 0
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

  
  

The resulting ASM from the about code is as expected.  The assignment of
`VAR1 = 0`.  

``` screen
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
enable or disable debugging features for the compiler.  When the bits of
the setting COMPILERDEBUG are set to 1, it activates additional debug
information during compilation, which can be helpful for developers to
diagnose and fix issues.

To see the permissible bits for COMPILERDEBUG first opening and closing
the PREFERENCES editor ( this does imply that the PREFERENCES EDITOR is
maintained to show the Header in the USE.INI), and then edit
USE.INI.  The help section will display the following:

``` screen
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

To see the debug add or edit the \[gcbasic\] section of USE.INI.

``` screen
    [gcbasic]
    'change to a bitwise value
    compilerdebug = 0
```

As previously stated. This setting can be helpful for developers to
diagnose and fix issues within the compiler.

</div>
