<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="constants"></span>Constants

</div>

</div>

</div>

<span class="strong">**About Constants**</span>

A constant tells the compiler to find a given word, and replace it with
another word or number. Define directives create constants.

Constants are useful for situations where a routine needs to be easily
altered. For example, a define could be used to specify the amount of
time to run an alarm for once triggered.

It is also possible to use defines to specify ports - thus defines can
be used to aid in the creation of code that can easily be adapted to run
on a different microcontroller with different ports.

GCBASIC makes considerable use of defines internally. For instance, the
LCD code uses defines to set the ports that it must use to communicate
with the LCD.

<span class="strong">**About Defines**</span>

To create a define is a matter of using the \#define directive. Here are
some examples of defines:

``` screen
    #define Line 34
    #define Light PORTB.0
    #define LightOn Set PORTB.0 on
```

`Line` is a simple constant - GCBASIC will find `Line` in the program,
and replace it with the number 34. This could be used in a line
following program, to make it easier to calibrate the program for
different lighting conditions.

`Light` is a port - it represents a particular pin on the
microcontroller. This would be of use if the program had many lines of
code that controlled the light, and there was a possibility that the
port the light was attached to would need to change in the future.

`LightOn` is a define used to make the program more readable. Rather
than typing `Set PORTB.0 on` over and over, it would then be made
possible to type `LightOn`, and have the compiler do the hard work.

<span class="strong">**GCBASIC Defined constants**</span>

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

<span class="strong">**GCBASIC special constant**</span>

`Forever` is a special constant. For Graphical GCBASIC users think of
this as 'false'. For those not using Graphical GCBASIC think of this as
a non numeric value that has no value. You can use `Forever` in a
DO-LOOP but not in a REPEAT-END REPEAT loop, as the in the later case
the REPEAT will have no value and you will create an error condition.

<span class="strong">**Precedence of Constants within
GCBASIC.**</span>  
  
The `#define` command creates constants, and, a script can creates
constants.  
  
The precedence is as follows:  
  
`#define` in the main program are read first,  
  
then, the `#define` in the include files. Constants defined in the
include files will be ignored if they conflict or are different to
another constant in the main program,  
  
then, the scripts are processed. Scripts that create constants always
override any constant value previously defined.  
  
Scripts are highest priority, then constants in the main program, then
constants in include files from the main program, then constants in the
standard libraries.  
  

See <span
class="strong">**<a href="_define" class="link" title="#DEFINE">#define</a>**</span>

</div>
