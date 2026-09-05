<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="scripts"></span>Scripts

</div>

</div>

</div>

<span class="strong">**About Scripts**</span>

A script is a small section of code that GCBASIC runs when it starts to
compile a program. Uses include performing calculations that are
required to adjust the program for different chip frequencies.

Scripts are not compiled or downloaded to the microcontroller - GCBASIC
reads them, executes them, then removes them from the program, and the
results calculated can then be used as <span
class="emphasis">*constants*</span> in the user program.

Inside a script, <span class="emphasis">*constants*</span> are treated
like variables. Scripts can read the values of <span
class="emphasis">*constants*</span>, and set them to contain new values.

<span class="strong">**Using Scripts**</span>

Scripts start with `#script` and end with `#endscript`. Inside, they can
consist of the following commands:

``` programlisting
    If
    Assignment (=)
    Error
    Warning
    Int()
```

`If` is similar to the If command in normal GCBASIC code, except that it
does not have an `Else` clause. It is used to compare the values of the
script constants.

The `=` sign is identical to that in GCBASIC programs. The <span
class="emphasis">*constant*</span> that is to be set goes on the left
side of the `=`, and the new value goes on the right of the `=`.

`Error` is used to display an error message. Anything after the `Error`
command is displayed at the end of compilation, and is saved in the
error log for the program.

`Warning` is used to display a warning message. Anything after the
`Warning` command is displayed at the end of compilation, but a warning
does not halt compilation.

`Int()` calculates the integer value of a calculation. Using `Int()` is
critical to set the <span class="emphasis">*constant*</span> to the
integer component of the calculation.

<span class="strong">**Notes:**</span>

Use `Warning` to display constant values when creating and debugging
scripts.

Scripts have a limited syntax and limited error checking when compiling.
The compiler may halt if you get something wrong.

Scripts that are incorrectly formatted may also halt the compiler, or
return an unrelated error.

Scripts used for calculations should use `Int( expression )` wherever a
floating point number may be returned.  
Scripts use floating point for all calculations, and a failure to use
`Int()` may leave the script constant, and the resulting <span
class="emphasis">*constant*</span>, set to 0.

Complex maths expressions may need to be broken into multiple
steps/lines to simplify the calculation.  
The returned value could be incorrect if this simplification is not
done.

Scripts can only access existing `constants`, both user- and
system-defined.

User-defined variables are not accessible within the scope of a script.

Scripts have precedence over `#define`. `#define` constant statements
are read first, then scripts run. So, a script will always overwrite a
constant that was set with `#define`.

<span class="strong">**Example Script**</span>

This script is used in the pwm.h file. It takes the values of the
user-defined <span class="emphasis">*constants*</span> `PWM_Freq`,
`PWM_Duty`, and the system <span class="emphasis">*constant*</span>
`ChipMHz`, and calculates the results using the equations below. These
calculations are based on information from a Microchip PIC datasheet, to
calculate the correct values to set up Pulse Width Modulation (PWM).

``` programlisting
    #script
        PR2Temp = INT((1/PWM_Freq)/(4*(1/(ChipMHz*1000))))
        T2PR = 1
        If PR2Temp > 255 Then
            PR2Temp = INT((1 / PWM_Freq) / (16 * (1 / (ChipMHz * 1000))))
            T2PR = 4
            If PR2Temp > 255 Then
                PR2Temp = INT(( 1 / PWM_Freq) / (64 * (1 / (ChipMHz * 1000))))
                T2PR = 16
                If PR2Temp > 255 Then
                    Error Invalid PWM Frequency value          ' <<< the Error instruction halting compilation with a message
                End If
            End If
        End If

        DutyCycle = (PWM_Duty * 10.24) * PR2Temp / 1024
        DutyCycleH = (DutyCycle AND 1020) / 4
        DutyCycleL = DutyCycle AND 3
    #endscript
```

<span class="strong">**Key line:**</span>
`Error Invalid PWM Frequency value` — this only runs once `PR2Temp`
still exceeds 255 after trying all three timer prescale values (4, 16,
64), meaning no valid PWM period can be generated for the requested
frequency at the chip’s clock speed; the script halts compilation and
reports this to the user instead of silently generating an incorrect PWM
setting.

During the execution of the script, the calculations and assignments use
the constants available to the script.

After this script has completed, the <span
class="emphasis">*constants*</span> `PR2Temp`, `DutyCycleH`, and
`DutyCycleL` are set using the constants and/or the calculations above.

The <span class="emphasis">*constants*</span> assigned in this script -
`PR2Temp`, `DutyCycleH`, and `DutyCycleL` - are made available as <span
class="emphasis">*constants*</span> in the user program.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_define" class="link" title="#DEFINE">#DEFINE</a> — creating
    constants at compile time; scripts run after and can override these
-   <a href="constants" class="link" title="Constants">Constants</a> — the
    overall precedence of constants within GCBASIC

</div>

</div>
