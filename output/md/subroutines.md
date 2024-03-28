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

When the microcontroller comes to a subroutine it saves its location in
the current program before jumping to the start of, or calling, the
subroutine. Once it reaches the end of the subroutine it returns to the
main program, and continues to run the code where it left off
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

These limits are due to the amount of memory on the microcontroller
which saves its location before it jumps to a new subroutine. Some
GCBASIC commands are subroutines, so you should always allow for 2 or 3
subroutine calls more than your program has.

On 16F chips, the program memory is divided into pages. Each page holds
2048 instructions.    If the program jumps from code on one page to code
on another, the compiler has to select the new page.   Having to do this
makes the program bigger, so try to avoid this. To keep jumps between
pages down, GCBASIC imposes a rule that each subroutine must be entirely
within one page, so that only jumps to other subroutines require the
page selection.    As an example, say you have two pages of memory, each
2048 instructions (words) long.  
If you have a main sub that is 1500 words, and four other subroutines
each 600 words long, your total program size would be 3900 words and you
might expect it to fit into the 4096 words available.     The problem
though is that once the main routine takes 1500 words from page 1,
nothing else will fit after it. Three of the 600 word subroutines would
fit onto page 2, but that leaves one 600 word subroutine that will not
fit into the 500 left on page 1 or the 200 left on page 2.    If you
want to reduce the chance of this happening, the best option is to keep
your subroutines smaller - move anything out of the main routine and
into another one - this will resolve memory page constraints.   

Atmel AVR microcontrollers have no fixed limit on how many subroutines
can be called at a time, but if too many are called then some variables
on the chip may be corrupted. To check if there are too many
subroutines, work out the most that will be called at once, then
multiply that number by 2 and create an array of that size. If an out of
memory error message comes up, there are too many calls.

Another feature of subroutines is that they are able to accept
parameters. These are values that are passed from the main program to
the subroutine when it is called, and then passed back when the
subroutine ends.

<span class="strong">**Using Subroutines**</span>

To call a subroutine is very simple - all that is needed is the name of
the sub, and then a list of parameters. This code will call a subroutine
named "Buzz" that has no parameters:

``` screen
    Buzz
```

If the sub has parameters, then they should be listed after the name of
the subroutine. This would be the command to call a subroutine named
"MoveArm" that has three parameters:

``` screen
    MoveArm NewX, NewY, 10
```

Or, you may choose to put brackets around the parameters, like so:

``` screen
    MoveArm (NewX, NewY, 10)
```

All that this does is change the appearance of the code - it doesn’t
make any difference to what the code does. Decide which one meets your
own personal preference, and then stick with it.

<span class="strong">**Creating subroutines**</span>

To create a subroutine is almost as simple as using one. There must be a
line at the start which has `sub`, and then the name of the subroutine.
Also, there needs to be a line at the end of the subroutine which reads
`end sub`. To create a subroutine called `Buzz`, this is the required
code:

``` screen
    sub Buzz

    'code for the subroutine goes here

    end sub
```

If the subroutine has parameters, then they need to be listed after the
name. For example, to define the `MoveArm` sub used above, use this
code:

``` screen
    sub MoveArm(ArmX, ArmY, ArmZ)

    'code for the subroutine goes here

    end sub
```

In the above sub, `ArmX`, `ArmY` and `ArmZ` are all variables. If the
call from above is used, the variables will have these values at the
start of the subroutine:

``` screen
    ArmX = NewX
    ArmY = NewY
    ArmZ = 10
```

When the subroutine has finished running, GCBASIC will copy the values
back where possible. `NewX` will be assigned to `ArmX`, and `NewY` will
be assigned to `ArmY`. GCBASIC will not attempt to set the number 10 to
`ArmZ`.

<span class="strong">**Controlling the direction data moves in**</span>

It is possible to instruct GCBASIC not to copy the value back after the
subroutine is called. If a subroutine is defined like this:

``` screen
    sub MoveArm(In ArmX, In ArmY, In ArmZ)
    'code for the subroutine goes here

    end sub
```

Then GCBASIC will copy the values to the subroutine, but will not copy
them back.

GCBASIC can also be prevented from copying the values back, by adding
`Out` before the parameter name. This is used in the EEPROM reading
routines - there is no point copying a data value into the read
subroutine, so `Out` has been used to avoid wasting time and memory. The
EPRead routine is defined as `Sub EPRead(In Address, Out Data)`.

Many older sections of code use `#NR` at the end of the line where the
parameters are specified. The `#NR` means "No Return", and when used has
the same effect as adding `In` before every parameter. Use of `#NR` is
not recommended, as it does not give the same level of control.

<span class="strong">**Using different data types for
parameters**</span>

It is possible to use any type of variable a as parameter for a
subroutine. Just add `As` and then the data type to the end of the
parameter name. For example, to make all of the parameters for the
`MoveArm` subroutine word variables, use this code:

``` screen
    sub MoveArm(ArmX As Word, ArmY As Word, ArmZ As Word)
    ...
    end sub
```

<span class="strong">**Optional parameters**</span>

Sometimes, the same value may be used over and over again for a
parameter, except in a particular case. If this occurs, a default value
may be specified for the parameter, and then a value for that parameter
only needs to be given in a call if it is different to the default.

For example, suppose a subroutine to create an error beep is required.
Normally it emits ! 440 Hz tone, but sometimes a different tone is
required. To create the sub, this code would be use:

``` screen
    Sub ErrorBeep(Optional OutTone As Word = 440)
      Tone OutTone, 100
    End Sub
```

Note the `Optional` before the parameter, and the `= 440` after it. This
tells GCBASIC that if no parameter is supplied, then set the `OutTone`
parameter to 440.

If called using this line:

``` screen
    ErrorBeep
```

then a 440 Hz beep will be emitted. If called using this line:

``` screen
    ErrorBeep 1000
```

then the sub will produce a 1000 Hz tone.

When using several parameters, it is possible to make any number of them
optional. If the optional parameter/s are at the end of the call, then
no value needs to be specified. If they are at the start or in the
middle, then you must insert commas to allow GCBASIC to tell where the
optional parameters are.

<span class="strong">**Overloading**</span>

It is possible to have 2 subroutines with the same name, but different
parameters. This is known as overloading, and GCBASIC will automatically
select the most appropriate subroutine for each call.

An example of this is the Print routine in the LCD routines. There are
actually several Print subroutines; for example, one has a byte
parameter, one a word parameter, and one a string parameter. If this
command is used:

``` screen
    Print 100
```

Then the Print (byte) subroutine will be called. However, if this
command is used:

``` screen
    Print 30112
```

Then the Print (word) subroutine will be called. If there is no exact
match for a particular call, GCBASIC will use the option that requires
the least conversion of variable types. For example, if this command is
used:

``` screen
    Print PORTB.0
```

The byte print will be used. This is because byte is the closest type to
the single bit parameter.

<span class="strong">**See Also**</span>
<a href="functions" class="link" title="Functions">Functions</a>,
<a href="exit" class="link" title="Exit">Exit</a>

</div>
