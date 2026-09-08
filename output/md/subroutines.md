<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="subroutines"></span>Subroutines

</div>

</div>

</div>

<span class="strong">**About Subroutines**</span>

A subroutine is a small program inside of the main program. Subroutines
are typically used when a task needs to be repeated several times in
different parts of the main program.

There are two main uses for subroutines:

<div class="itemizedlist">

-   Keeping programs neat and easy to read
-   Reducing the size of programs by allowing common sections of code to
    be reused.

</div>

When the microcontroller comes to a subroutine, it saves its location in
the current program before jumping to the start of, or calling, the
subroutine. Once it reaches the end of the subroutine, it returns to the
main program, and continues to run the code from where it left off
previously.

Normally, it is possible for subroutines to call other subroutines.
There are limits to the number of times that a subroutine can call
another sub, which vary from chip to chip:

<div class="informaltable">

| <span class="strong">**Microcontroller Family**</span> | <span class="strong">**Instruction Width**</span> | <span class="strong">**Number of subs called**</span> |
|:-------------------------------------------------------|:-------------------------------------------------:|:-----------------------------------------------------:|
| 10F\*, 12C5\*, 12F5\*, 16C5\*, 16F5\*                  |                        12                         |                           1                           |
| 12C\*, 12F\*, 16C\*, 16F\*, except those above         |                        14                         |                           7                           |
| 18F\*, 18C\*                                           |                        16                         |                          31                           |

</div>

These limits are due to the amount of memory on the microcontroller that
saves its location before it jumps to a new subroutine. Some GCBASIC
commands are subroutines, so you should always allow for 2 or 3 more
subroutine calls than your program has.

On baseline and mid-range PIC chips (the 10F/12F/14F/16F families -
12-bit and 14-bit core), program memory is divided into pages, each
holding 2048 instructions. This does not apply to 18F/18C chips or to
AVR chips, which do not have this page-packing restriction at all. If
the program jumps from code on one page to code on another, the compiler
has to select the new page. Having to do this makes the program bigger,
so try to avoid it. To keep jumps between pages down, GCBASIC imposes a
rule that each subroutine must be entirely within one page, so that only
jumps to other subroutines require the page selection.

This is not only a Subroutines topic: Functions, the main body of the
program, and the interrupt handler are all packed into pages the same
way, and the main body and interrupt handler are always pinned to the
first page. See
<a href="program_memory_pages" class="link" title="Program Memory Pages">Program Memory Pages</a>
for the full explanation, including what always goes on page 0 and how
to avoid a "First page of program memory is full" error.

Atmel AVR microcontrollers have no fixed limit on how many subroutines
can be called at a time, but if too many are called, some variables on
the chip may be corrupted. To check whether there are too many
subroutines, work out the most that will be called at once, then
multiply that number by 2 and create an array of that size. If an
out-of-memory error message appears, there are too many calls.

Another feature of subroutines is that they are able to accept
parameters. These are values that are passed from the main program to
the subroutine when it is called, and then passed back when the
subroutine ends.

<span class="strong">**Using Subroutines**</span>

To call a subroutine is very simple - all that is needed is the name of
the sub, and then a list of parameters. This code will call a subroutine
named "Buzz" that has no parameters:

``` programlisting
    Buzz
```

If the sub has parameters, then they should be listed after the name of
the subroutine. This would be the command to call a subroutine named
"MoveArm" that has three parameters:

``` programlisting
    MoveArm NewX, NewY, 10
```

Or, you may choose to put brackets around the parameters, like so:

``` programlisting
    MoveArm (NewX, NewY, 10)
```

All that this does is change the appearance of the code - it does not
make any difference to what the code does. Decide which one meets your
own personal preference, and then stick with it.

<span class="strong">**Creating subroutines**</span>

Creating a subroutine is almost as simple as using one. There must be a
line at the start with `sub`, and then the name of the subroutine. Also,
there needs to be a line at the end of the subroutine which reads
`end sub`. To create a subroutine called `Buzz`, this is the required
code:

``` programlisting
    sub Buzz

    'code for the subroutine goes here

    end sub
```

If the subroutine has parameters, then they need to be listed after the
name. For example, to define the `MoveArm` sub used above, use this
code:

``` programlisting
    sub MoveArm(ArmX, ArmY, ArmZ)

    'code for the subroutine goes here

    end sub
```

In the above sub, `ArmX`, `ArmY`, and `ArmZ` are all variables. If the
call from above is used, the variables will have these values at the
start of the subroutine:

``` programlisting
    ArmX = NewX
    ArmY = NewY
    ArmZ = 10
```

When the subroutine has finished running, GCBASIC will copy the values
back where possible. `NewX` will be assigned from `ArmX`, and `NewY`
will be assigned from `ArmY`. GCBASIC will not attempt to set the number
10 back into `ArmZ`.

<span class="strong">**Controlling the direction data moves in**</span>

It is possible to instruct GCBASIC not to copy the value back after the
subroutine is called. If a subroutine is defined like this:

``` programlisting
    sub MoveArm(In ArmX, In ArmY, In ArmZ)
    'code for the subroutine goes here

    end sub
```

then GCBASIC will copy the values to the subroutine, but will not copy
them back.

GCBASIC can also be prevented from copying values into the subroutine in
the first place, by adding `Out` before the parameter name. This is used
in the EEPROM reading routines - there is no point copying a data value
into the read subroutine, so `Out` is used to avoid wasting time and
memory. The EPRead routine is defined as
`Sub EPRead(In Address, Out Data)`.

Many older sections of code use `#NR` at the end of the line where the
parameters are specified. `#NR` means "No Return", and when used has the
same effect as adding `In` before every parameter. Use of `#NR` is not
recommended, as it does not give the same level of control.

<span class="strong">**Using different data types for
parameters**</span>

It is possible to use any type of variable as a parameter for a
subroutine. Just add `As` and then the data type to the end of the
parameter name. For example, to make all of the parameters for the
`MoveArm` subroutine word variables, use this code:

``` programlisting
    sub MoveArm(ArmX As Word, ArmY As Word, ArmZ As Word)
    ...
    end sub
```

<span class="strong">**Optional parameters**</span>

Sometimes, the same value may be used over and over again for a
parameter, except in a particular case. When this occurs, a default
value may be specified for the parameter, and a value for that parameter
only needs to be given in a call if it differs from the default.

For example, suppose a subroutine to create an error beep is required.
Normally it emits a 440 Hz tone, but sometimes a different tone is
required. To create the sub, this code would be used:

``` programlisting
    Sub ErrorBeep(Optional OutTone As Word = 440)
      Tone OutTone, 100          ' <<< the parameter that falls back to 440 when the caller omits it
    End Sub
```

<span class="strong">**Key line:**</span> `Tone OutTone, 100` — plays
`OutTone` for 100 units; because `OutTone` is declared
`Optional …​ = 440`, calling `ErrorBeep` with no argument still supplies
a valid value (440) here, without the caller having to specify it
explicitly.

This tells GCBASIC that if no parameter is supplied, it should set the
`OutTone` parameter to 440.

If called using this line:

``` programlisting
    ErrorBeep
```

then a 440 Hz beep will be emitted. If called using this line:

``` programlisting
    ErrorBeep 1000
```

then the sub will produce a 1000 Hz tone.

When using several parameters, it is possible to make any number of them
optional. If the optional parameter(s) are at the end of the call, then
no value needs to be specified. If they are at the start or in the
middle, then you must insert commas to allow GCBASIC to tell where the
optional parameters are.

A subroutine call can have at most 50 parameters; a call with more fails
to compile with "Maximum number of parameters (50) exceeded."

<span class="strong">**Overloading**</span>

It is possible to have 2 subroutines with the same name, but different
parameters. This is known as overloading, and GCBASIC will automatically
select the most appropriate subroutine for each call.

An example of this is the Print routine in the LCD routines. There are
actually several Print subroutines; for example, one has a byte
parameter, one a word parameter, and one a string parameter. If this
command is used:

``` programlisting
    Print 100
```

then the Print (byte) subroutine will be called. However, if this
command is used:

``` programlisting
    Print 30112
```

then the Print (word) subroutine will be called. If there is no exact
match for a particular call, GCBASIC will use the option that requires
the least conversion of variable types. For example, if this command is
used:

``` programlisting
    Print PORTB.0
```

the byte print will be used. This is because byte is the closest type to
the single-bit parameter.

A single-character string literal, such as `"R"`, can be passed to
whichever overload fits best: it matches a `String` parameter (as a
one-character string) and equally matches a `Byte` or `Bit` parameter
(as its ASCII value), the same way `Dim x As Byte = "R"` already works.
If none of the overloads of a subroutine or function fit the arguments
given at all — for example, passing a multi-character string where every
overload expects a number — the call fails to compile with "No matching
overload found for `name` with these argument types."

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="functions" class="link" title="Functions">Functions</a> — the
    value-returning counterpart to subroutines
-   <a href="exit" class="link" title="Exit">Exit</a> — exiting a
    subroutine or function early
-   <a href="constraints_and_error_messages_overview" class="link" title="Constraints and Error Messages Overview">Constraints and Error Messages</a> — the
    full list of compiler constraints and error messages, including the
    parameter-count limit above
-   <a href="program_memory_pages" class="link" title="Program Memory Pages">Program Memory Pages</a> — the
    full explanation of page 0 and how to avoid a full-first-page error
-   <a href="on_interrupt" class="link" title="On Interrupt">On Interrupt</a> — writing
    the interrupt handler that shares page 0 with the main body
-   <a href="performance_overview" class="link" title="Performance Overview">Performance</a> — the
    NOCONTEXTSAVE trade-off mentioned above, and other performance
    guidance

</div>

</div>
