<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="repeat_for"></span>Repeat For

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Repeat For time unit
    ...
    program code
    ...
    <condition> Exit Repeat
    ...
    End Repeat
```

<span class="strong">**Command Availability:**</span>

Available on PIC (12-bit, 14-bit, enhanced mid-range and PIC18) and AVR
microcontrollers. Introduced in build 1654.

<span class="strong">**Explanation:**</span>

`Repeat For` runs a block of code over an exact length of time, instead
of a fixed number of times. The compiler counts the clock cycles the
code takes, works out how many passes of the code fit into the time
requested, and adds padding so that every pass takes the same time and
the whole construct finishes exactly on time. It replaces the
hand-counted `Wait` and `nop` padding that is otherwise needed to make a
timing window last an exact number of clock cycles.

<span class="emphasis">*time*</span> is a whole-number constant: a plain
number, or a name created with `#define`. <span
class="emphasis">*unit*</span> is one of the units used by `Wait`:

<div class="informaltable">

| <span class="strong">**Unit**</span> | <span class="strong">**Length of unit**</span> |
|:-------------------------------------|:-----------------------------------------------|
| us (or usec)                         | 1 microsecond                                  |
| 10us (or 10usec)                     | 10 microseconds                                |
| ms (or msec)                         | 1 millisecond                                  |
| 10ms (or 10msec)                     | 10 milliseconds                                |
| s (or sec, second)                   | 1 second                                       |
| m (or min)                           | 1 minute                                       |
| h (or hour)                          | 1 hour                                         |

</div>

The total time is exact in clock cycles at the clock speed given in
`#chip`. On PIC chips one instruction cycle is four clock cycles, as it
is for `Wait`. Interrupts are not included in the calculation: time
spent in an interrupt handler makes the loop last longer.

<span class="strong">**How the passes are chosen**</span>

The compiler fits as many passes as it can into the time (up to 65535),
then shares the time left over equally between the passes as padding, so
the passes are evenly spaced. Any remainder of a few clock cycles is
added once, after the last pass.

This means the time from the start of one pass to the start of the next
is the total time divided by the number of passes - it is not simply the
length of the code in the loop. For example, `Repeat For 100 ms` around
a body that contains `Wait 5 ms` and a pin toggle runs 19 passes that
are about 5.26 ms apart, because 20 passes of more than 5 ms cannot fit
into 100 ms. If the body is shortened slightly (`Wait 4900 us`), the
compiler fits 20 passes and pads each one out to exactly 5.000 ms. To
space the passes by a particular period, make the code in the loop a
little shorter than that period.

If the code in the loop is very short compared with the total time, the
padding in each pass becomes very large. A time that needs more than
56,000,000 clock cycles of padding in every pass is rejected; use a
longer body, or wrap the `Repeat For` in an ordinary loop.

<span class="strong">**What can go inside the loop**</span>

The loop is timed by counting the instructions in it, so everything
inside must take a fixed, known time. These are allowed:

<div class="itemizedlist">

-   Assignments and arithmetic on `Byte`, `Word`, `Integer` and `Long`
    variables, including bit operations, shifts and rotates, array
    elements and the hardware multiplier where the chip has one
-   `Set`, `Dir`, port and bit writes, and `PulseOut`
-   `Wait` with a constant time in any unit, and `WaitL1`. The delay is
    built into the loop as an exact inline delay of up to 8,000,000
    clock cycles per `Wait`. `Wait 10000 us` and `Wait 10 ms` therefore
    both work
-   `If …​ Then …​ End If` with no `Else`. Only the test is counted. The
    statements inside the `If` run only when the condition is true and
    their time is not counted, so a pass in which the condition is true
    lasts a little longer
-   `Exit Repeat`, to leave the loop early, for example when a timeout
    is not needed any more. The loop then ends sooner than the time
    requested

</div>

These are not allowed, and produce a compiler error:

<div class="itemizedlist">

-   `Else` and `Else If`, and conditions that need a library routine,
    such as comparing `Word` variables, or two `Byte` variables with `>`
    or `<`, or combining tests with `And`/`Or`
-   `Goto`, `Gosub`, `Select Case`, calls to your own `Sub` or
    `Function`, `Exit Sub` and `Exit Function`
-   Another `Repeat`, or a `For`, `Do` or `Wait While`/`Wait Until` loop
-   `Wait` with a variable time
-   `IntOn`, `IntOff`, and anything else that the compiler builds as a
    call to a library routine, such as string handling, division and
    modulus

</div>

The time itself must also be a constant. A variable, an expression such
as `10*9`, a number with a fraction, zero, a negative number, or a time
too short for even one pass of the loop is rejected. See the
<a href="constraints_and_error_messages_overview" class="link" title="Constraints and Error Messages Overview">Constraints and Error Messages</a>
page for the full list.

<span class="strong">**Example:**</span>

``` programlisting
    'This code keeps a pin high for exactly 100 ms.

    #chip 16F1829, 8
    #option explicit

    #define OUTPIN PORTC.0
    Dir OUTPIN Out

    Set OUTPIN On
    Repeat For 100 ms       ' <<< the timed loop
      Wait 5 ms             ' a constant Wait is allowed inside the loop
    End Repeat
    Set OUTPIN Off
```

<span class="strong">**Key line:**</span> `Repeat For 100 ms` — repeats
the code up to `End Repeat` for exactly 100 ms. The compiler chooses the
number of passes and the padding.

<span class="strong">**Example:**</span>

``` programlisting
    'This code toggles port A 20 times, 5.000 ms apart, over exactly 100 ms.

    #chip 16F1829, 8
    #option explicit

    Dir PORTA Out

    Repeat For 100 ms
      Wait 4900 us          ' shorter than 5 ms, so that 20 passes fit
      PORTA = !PORTA
    End Repeat
```

<span class="strong">**Key line:**</span> `Wait 4900 us` — the `Wait` is
made a little shorter than the 5 ms period, so the compiler fits exactly
20 passes and pads each to 5.000 ms.

<span class="strong">**Example:**</span>

``` programlisting
    'This code counts Timer1 overflows during a gate time of exactly 790047 us.

    #chip 16F1829, 8
    #option explicit

    Dim Overflows As Byte

    Repeat For 790047 us
      Wait 1009 us
      nop
      If TMR1IF = 1 Then    ' only the test is counted
        Overflows = Overflows + 1
        TMR1IF = 0
      End If
    End Repeat
```

<span class="strong">**Key line:**</span> `Repeat For 790047 us` — the
whole gate lasts exactly 790047 microseconds, whether or not the
overflow flag was set, apart from the `If` body running on a pass in
which the flag is set.

<span class="strong">**Example:**</span>

``` programlisting
    'This code waits up to 50 ms for a button press and leaves the loop at once when it happens.

    #chip 16F1829, 8
    #option explicit

    #define BUTTON PORTB.4
    Dir BUTTON In
    Dim Pressed As Byte
    Pressed = 0

    Repeat For 50 ms
      If BUTTON = On Then
        Pressed = 1
        Exit Repeat         ' <<< leave early
      End If
      Wait 100 us
    End Repeat
```

<span class="strong">**Key line:**</span> `Exit Repeat` — leaves the
timed loop as soon as the button is seen, so the loop lasts at most 50
ms.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="repeat" class="link" title="Repeat">Repeat</a> — looping
    a fixed number of times
-   <a href="wait" class="link" title="Wait">Wait</a> — the delay
    command, and its units, used inside `Repeat For`
-   <a href="for" class="link" title="For">For</a> — a counted
    loop that also exposes the current iteration number
-   <a href="do" class="link" title="Do">Do</a> — an unbounded
    loop
-   <a href="constraints_and_error_messages_overview" class="link" title="Constraints and Error Messages Overview">Constraints and Error Messages</a> — the
    limits and error messages for `Repeat For`

</div>

</div>
