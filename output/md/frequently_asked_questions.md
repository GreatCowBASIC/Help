<div class="section">

<div class="titlepage">

<div>

<div>

<span id="frequently_asked_questions"></span>Frequently Asked Questions
------------------------------------------------------------------------

</div>

</div>

</div>

<span class="strong">**Why doesn’t anything come up when I run
GCBASIC.exe?**</span>

GCBASIC is a command line compiler. To compile a file, you can drag and
drop it onto the GCBASIC.exe icon. There are also several Integrated
Development Environments, or IDEs, available for GCBASIC. These will
give you an area where you can edit your program and a button to send
the program to the chip. Several are listed on the GCBASIC website.  
  
<span class="strong">**What Microchip PIC and Atmel AVR microcontrollers
does GCBASIC support?**</span>

Hopefully, all 8 bit Microchip PIC and Atmel AVR microcontrollers (those
in the PIC10, PIC12, PIC16 and PIC18 families). If you find one that
GCBASIC does not work with properly, please post about it in the
Compiler Problems section of the GCBASIC forum.  
  
<span class="strong">**Is GCBASIC case sensitive?**</span>

No! For example, `Set`, `SET`, `set`, `SeT`, etc are all treated exactly
the same way by GCBASIC.  
  
<span class="strong">**Can I specify the bit of a variable to alter
using another variable?**</span>

GCBASIC support bitwise assignments. As follows:

``` screen
    portc.0 = !porta.1
```

You can also use a shift function. As in other languages, by using the
Shift Function FnLSL. AN example is:

``` screen
    MyVar = FnLSL( 1, BitNum)`  is Equivalent to `MyVar = 1<<BitNum`
```

To set a bit of a port and to prevent glitches during operations, use
`#option volatile` as folllows.

``` screen
    'add this option for a specific port.
    #option volatile portc.0

    'then in your code
    portc.0 = !porta.1
```

To set a bit of a port or variable. Encapsulate it in the SetWith
method, this also eliminates any glitches during the update, use this
method.

``` screen
    SetWith(MyPORT, MyPORT OR FnLSL( 1, BitNum))
```

To clear a bit of a port, use this method.

``` screen
    MyPORT = MyPORT AND NOT FnLSL( 1, BitNum))
```

To set a bit within an array, use this method.

``` screen
    video_buffer_A1(video_adress) = video_buffer_A1(video_adress) OR FnLSL( 1, BitNum)
```

To set a bit within a variable, use this method.

``` screen
    Dim my_variable as byte
    Dim my_bit_address_variable as byte

    'example
    my_variable = 0
    my_bit_address_variable = 7

    my_variable.my_bit_address_variable = 1   ' where 1 or 0 or any bit address is valid

    'Sets bit 7 of my_variable therefore 128
```

See also <a href="set" class="link" title="Set">Set</a>,
<a href="fnlsl" class="link" title="FnLSL">FnLSL</a>,
<a href="fnlsr" class="link" title="FnLSR">FnLSR</a> and
<a href="rotate" class="link" title="Rotate">Rotate</a>  
  
<span class="strong">**Why is x feature not implemented?**</span>

Because it hasn’t been thought of, or no-one has been able to implement
it! If there are any features that you would like to see in GCBASIC,
please post them in the "Open Discussion" section of the GCBASIC forum.
Or, if you can, have a go at adding the feature yourself!  
  
<span class="strong">**When using an include file does this use lots of
memory?**</span>

When using include files, in this instance the &lt;ds3231.h&gt; include,
if you are not using all the functions of the include file, does GCB
know not to include the non used functions within the include file when
compiling, or does everything get included anyway. For instance, if I am
not using the hardware I2C, does all the code related to hardware I2C
still get compiled in the code?  

GCBASIC only compiles functions and subroutines if they are called.
GCBASIC starts by compiling the main routine, then anything called from
there. Each time it finds a new subroutine that is called, it compiles
it and anything that it calls. If a subroutine is not needed, it does
not get compiled.  
  
<span class="strong">**My LCD will not operate as expected?**</span>

Try adding. `#define LCD_SPEED SLOW`

This will slow the writing to the LCD.  
  
<span class="strong">**Atmel AVR memory usage displayed is
incorrect?**</span>

Atmel AVR memory values are specified in WORDS in GCBASIC. The GCBASIC
compiler uses words, not bytes, for consistency between Microchip PIC
and Atmel AVR microcontrollers. This keeps parts of the compiler
simpler.  
  
<span class="strong">**I cannot open the Window Help File?**</span>

See
<http://digital.ni.com/public.nsf/allkb/B59D2B24D624B823862575FC0056F3D0>  
  
<span class="strong">**How do I revert the FOR-NEXT loop to the Legacy
FOR-NEXT method ?**</span>

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

  
  

</div>
