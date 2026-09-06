<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="frequently_asked_questions"></span>Frequently Asked Questions

</div>

</div>

</div>

<span class="strong">**Why doesn’t anything come up when I run
GCBASIC.exe?**</span>

GCBASIC is a command line compiler. To compile a file, you can drag and
drop it onto the GCBASIC.exe icon.

If you use an Integrated Development Environment (IDE), you can edit
your program and press an icon to send the program to the chip. Several
are listed on the GCBASIC website.

The recommended IDE for Windows is GCCODE.

  
  
<span class="strong">**What Microchip PIC, Atmel AVR, or LGT
microcontrollers does GCBASIC support?**</span>

Hopefully, all 8-bit Microchip PIC, Atmel AVR, and LGT microcontrollers
(those in the PIC10, PIC12, PIC16, and PIC18 families). If you find one
that GCBASIC does not work with properly, please post about it in the
Compiler Problems section of the GCBASIC forum.  
  
<span class="strong">**Is GCBASIC case sensitive?**</span>

No. For example, `Set`, `SET`, `set`, `SeT`, etc. are all treated
exactly the same way by GCBASIC.  
  
<span class="strong">**Can I specify the bit of a variable to alter
using another variable?**</span>

GCBASIC supports bitwise assignments, as follows:

``` programlisting
    PORTC.0 = !PORTA.1
```

You can also use a shift function. As in other languages, use the shift
function `FnLSL`. An example is:

``` programlisting
    MyVar = FnLSL( 1, BitNum)
```

`MyVar = FnLSL( 1, BitNum)` is equivalent to `MyVar = 1 << BitNum`.

To set a bit of a port and to prevent glitches during operations, use
`#OPTION VOLATILE` as follows.

``` programlisting
    'add this option for a specific port.
    #OPTION VOLATILE PORTC.0

    'then in your code
    PORTC.0 = !PORTA.1
```

To set a bit of a port or variable, encapsulate it in the `SetWith`
method - this also eliminates any glitches during the update.

``` programlisting
    SetWith(MyPORT, MyPORT OR FnLSL( 1, BitNum))
```

To clear a bit of a port, use this method.

``` programlisting
    MyPORT = MyPORT AND NOT FnLSL( 1, BitNum))
```

To set a bit within an array, use this method.

``` programlisting
    video_buffer_A1(video_adress) = video_buffer_A1(video_adress) OR FnLSL( 1, BitNum)
```

To set a bit within a variable, use this method.

``` programlisting
    Dim my_variable as byte
    Dim my_bit_address_variable as byte

    'example
    my_variable = 0
    my_bit_address_variable = 7

    my_variable.my_bit_address_variable = 1   ' where 1 or 0 or any bit address is valid

    'Sets bit 7 of my_variable therefore 128
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="set" class="link" title="Set">Set</a> — setting a
    single bit or port pin
-   <a href="fnlsl" class="link" title="FnLSL">FnLSL</a> — the
    shift-left function used above
-   <a href="fnlsr" class="link" title="FnLSR">FnLSR</a> — the
    corresponding shift-right function
-   <a href="rotate" class="link" title="Rotate">Rotate</a> — rotating
    bits within a variable
-   <a href="setwith" class="link" title="SetWith">SetWith</a> — glitch-free
    bit setting used above

</div>

  
  
<span class="strong">**Why is x feature not implemented?**</span>

Because it has not been thought of, or no one has been able to implement
it.

If there are any features that you would like to see in GCBASIC, please
post them in the "Open Discussion" section of the GCBASIC forum. Or, if
you can, have a go at adding the feature yourself.  
  

<span class="strong">**When using an include file, does this use lots of
memory?**</span>

When using include files, for instance the &lt;ds3231.h&gt; include, if
you are not using all the functions of the include file, GCBASIC knows
not to include the unused functions within the user program when
compiling.

<span class="strong">**If I am using the hardware I2C, does all the code
related to hardware I2C still get compiled into the program?**</span>

GCBASIC only compiles functions and subroutines if they are called.
GCBASIC starts by compiling the main routine, then anything called from
there. Each time it finds a new subroutine that is called, it compiles
it and anything that it calls. If a subroutine is not needed, it does
not get compiled.  
  
<span class="strong">**My LCD will not operate as expected?**</span>

Try adding `#DEFINE LCD_SPEED SLOW`.

This will slow the writing to the LCD.  
  
<span class="strong">**Atmel AVR memory usage displayed is
incorrect?**</span>

Atmel AVR memory values are specified in WORDS in GCBASIC. The GCBASIC
compiler uses words, not bytes, for consistency between Microchip PIC
and Atmel AVR microcontrollers. This keeps parts of the compiler
simpler.  
  
<span class="strong">**I cannot open the Windows Help File?**</span>

See [National Instruments knowledge
base](https://digital.ni.com/public.nsf/allkb/B59D2B24D624B823862575FC0056F3D0)  
  
<span class="strong">**How do I revert the FOR-NEXT loop to the legacy
FOR-NEXT method?**</span>

Some background.   In 2021 the GCBASIC compiler was updated to improve
the operation of the FOR-NEXT loop.   The improvement did increase the
size of the generated ASM.   The legacy FOR-NEXT loop had some major
issues, including never-ending loops, incorrect end-of-loop behaviour,
and other unexpected operations.   This was all caused by the compiler,
not the user, and in 2021 the compiler was updated to resolve these
issues.  

However, there is a risk that the new FOR-NEXT method causes 1) larger
ASM that will not fit in small microcontrollers, or 2) the new code does
not operate as expected.   In either case you can disable the new
FOR-NEXT method by adding a constant as shown below.   Adding this
constant will revert the FOR-NEXT loop ASM generated to the legacy
method.  

``` programlisting
    #DEFINE USELEGACYFORNEXT
```

Note that whichever FOR-NEXT method is used, the identifier named after
`NEXT` should always match the loop variable named on the matching `FOR`
line — a mismatch (for example, closing `For index = …​` with `Next i`)
is a common source of the very never-ending or incorrect-end-loop
symptoms this constant works around; see
<a href="for" class="link" title="For">For</a>.

  
  

</div>
