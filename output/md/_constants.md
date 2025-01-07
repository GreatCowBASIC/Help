<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_constants"></span>Constants

</div>

</div>

</div>

<span class="strong">**About Constants**</span>

A constant tells the compiler to find a given string, and replace it
with another string. The `#Define` directive create constants.

Constants are useful for situations where a routine needs to be easily
altered. For example, a define could be used to specify the amount of
time to run an alarm for once triggered.

It is also possible to use defines to specify port.pin(s) - thus defines
can be used to aid in the creation of code that can easily be adapted to
run on a different microcontroller with different ports.

GCBASIC makes considerable use of defines internally. For instance, the
LCD code uses defines to set the ports that it must use to communicate
with the LCD.

<span class="strong">**About Defines**</span>

To create a constant is a matter of using the \#define directive. Here
are some examples of defines:

``` screen
    #define LINE 34
    #define LIGHT PORTB.0
    #define LIGHTON Set PORTB.0 ON
```

`LINE` is a simple constant - GCBASIC will find `LINE` in the program,
and replace it with the number 34. This could be used in a line
following program, to make it easier to calibrate the program for
different lighting conditions.

`LIGHT` is a port.pin - it represents a particular pin on the
microcontroller. This would be of use if the program had many lines of
code that controlled the light, and there was a possibility that the
port the light was attached to would need to change in the future.

`LIGHTON` is a define used to make the program more readable. Rather
than typing `Set PORTB.0 ON` over and over, it would then be made
possible to type `LIGHTON`, and have the compiler do the hard work.

<span class="strong">**GCBASIC Defined constants**</span>

The are many GCBASIC standard constants, some are show below.

``` screen
    #define ON 1
    #define OFF 0
    #define TRUE 255
    #define FALSE 0

    'Names for symbols
    #define AND &
    #define OR |
    #define XOR #
    #define NOT !
    #define MOD %
```

<span class="strong">**A GCBASIC special constant**</span>

`FOREVER` is a special constant. For Graphical GCBASIC users think of
this as 'false'. For those not using Graphical GCBASIC think of this as
a non numeric value that has no value. You can use `FOREVER` in a
DO-LOOP but not in a REPEAT-END REPEAT loop, as the in the later case
the REPEAT will have no value and you will create an error condition.

<span class="strong">**Precedence of Constants within
GCBASIC.**</span>  
  
The `#define` command creates constants, and, scripts also creates
constants. See the `#script` section of ths Help.  
  
The precedence is as follows:

<div class="itemizedlist">

-   Constants defined in the main user program is read first,
-   then, the constants defined in the include files. Constants defined
    in the include files are ignored if they conflict or are different
    to a constant, with the same title, in the main program.
-   then, the scripts are processed. Scripts that create constants can
    therefore override any constant value previously defined.

</div>

All constants are listed in the Constant Debug File ( CDF ). The CDF
shows all constants and the end state of the constants.  
  

See <span
class="strong">**<a href="__define.html" class="link" title="#DEFINE">#define</a>**</span>

</div>
