<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="performance_overview"></span>Performance Overview

</div>

</div>

</div>

<span class="strong">**What the compiler already does**</span>

GCBASIC optimises the code it generates automatically, without being
asked to. Some of what happens during a normal compile:

<div class="itemizedlist">

-   <span class="strong">**A pointless self-assignment generates no code
    at all.**</span> If a line assigns a variable to itself
    (`MyVar = MyVar`), the compiler checks the source against the
    destination and emits nothing for that line - not even a no-op
    instruction. This check only catches the literal case of the same
    variable on both sides; it cannot detect that two different
    variables happen to hold the same value.
-   <span class="strong">**Simple clean-ups run over the generated
    assembly, regardless of what is written.**</span> These are not
    triggered by any particular coding choice; they are applied to
    whatever assembly the compiler has already produced. For example, a
    plain `MyVar = 0` (assigning the literal zero to a byte variable)
    compiles to a "load 0, then store it" pair of instructions; the
    clean-up pass recognises that exact pair and combines it into a
    single, more efficient "clear" instruction - so writing `MyVar = 0`
    normally already gets the efficient result, with nothing extra
    required. Two further examples, both fully automatic: if a value is
    copied out of the working register and the very next instruction
    would copy that same value straight back in, the redundant reload is
    deleted; and on PIC chips with 256 bytes of address space or less,
    now-pointless bank-select instructions are removed entirely (this
    one depends on the chip selected with `#chip`, not on anything in
    the program’s logic).
-   Calls to other subroutines are converted to a shorter, faster form
    where the target is close enough in program memory.
-   `If` statements and variable-handling code are tidied up
    automatically.
-   The whole compiled program is re-scanned afterwards, more than once,
    for any further reduction that has become possible.

</div>

See
<a href="development_guide_for_gcbasic_exe_compiler" class="link" title="Development Guide for GCBASIC.EXE compiler">Development Guide for GCBASIC.EXE compiler</a>
for more on how the compiler is put together. This automatic
optimisation is good at what it does, but it optimises the code as
written, not the intent behind it. It cannot restructure an approach
that is fundamentally more expensive than it needs to be. That is where
coding style takes over.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Note

None of this is about clock speed or overclocking the chip. Every
technique on this page concerns the ASM the compiler actually generates
- fewer instructions, cheaper instructions, and less time spent per
instruction executed - which helps equally whether the chip runs at 4
MHz or 64 MHz.

</div>

<span class="strong">**Areas with their own tuning options**</span>

A few subsystems expose their own performance trade-offs directly:

<div class="itemizedlist">

-   <span class="strong">**ADC**</span> - the `ADSPEED` constant
    controls the ADC clock source/speed (e.g.
    `#define ADSPEED MEDIUMSPEED`). See
    <a href="readad" class="link" title="ReadAD">ReadAD</a>.
-   <span class="strong">**PWM**</span> - hardware PWM (via a chip’s
    CCP/PWM peripheral) costs no CPU time once configured, whereas a
    software-timed PWM loop does; 16-bit PWM modes trade additional
    resolution for extra setup and register-handling cost. See the PWM
    section of the Help file for the specific commands available on a
    given chip family.
-   <span class="strong">**Timers**</span> - using a chip’s hardware
    timer, with the correct prescaler constant for the target period,
    offloads timing from the CPU entirely, whereas a software delay loop
    blocks it. See the Timers section of the Help file.

</div>

The remainder of this page covers the coding-style choices that matter
everywhere else - choices the compiler’s automatic optimisation cannot
make on its own.

<span class="strong">**Coding style and performance**</span>

The examples below are drawn from a real, hardware-verified optimisation
pass on a GCBASIC communications library’s interrupt handler and
buffer-copy code - the most frequently executed, timing-sensitive code
in that program. Each change was verified two ways: a smaller or faster
compiled output, and a functional test on physical hardware after every
step, rather than a theory about what should be faster. The same
patterns apply to any frequently-run code elsewhere (a main loop, an
interrupt handler, or any subroutine called often).

<span class="strong">**1. Avoid dividing by a power of two at
runtime**</span>

GCBASIC has no constant-power-of-two strength reduction: a plain `/8`
compiles to a call to a generic division subroutine, even when the
divisor is a literal power of two, and even inside the most frequently
executed code in the program. In one real interrupt handler that decoded
a hardware status register to determine which of several channels had
just triggered, a single division -
`ChannelNumber = (StatusReg And 0x38) / 8`, evaluated on every
occurrence of the interrupt - was the only division anywhere in the
program, and cost a full subroutine call on the single most frequent
event in the whole handler:

``` programlisting
    'Before: a real division subroutine call, every time this fires
    ChannelNumber = (StatusReg And 0x38) / 8
```

This was replaced with a mask and three single-bit right rotations
(dividing by 8 is equivalent to shifting right 3 bits):

``` programlisting
    'After: one bit-clear plus 3 rotate instructions, no subroutine call
    ChannelNumber = StatusReg And 0x38
    Set C Off
    Rotate ChannelNumber Right
    Rotate ChannelNumber Right
    Rotate ChannelNumber Right
```

<span class="strong">**Key line:**</span> `Set C Off` — GCBASIC’s
`Rotate` command rotates <span class="strong">**through**</span> Carry
(see <a href="rotate" class="link" title="Rotate">Rotate</a>),
rather than as a carry-free circular rotate. Omit this line and bit 7 of
the result picks up whatever Carry happened to be left over from
earlier, unrelated code - an intermittent, hard-to-reproduce corruption
that only appears depending on what ran just before. This was caught
during review, before it shipped, precisely because it looks like a
safe, obviously correct optimisation. Masking with `0x38` first
(clearing bits 0-2 and bits 6-7), together with the explicit
`Set C Off`, is what makes the result bit-for-bit identical to the
division - both steps are required, not the rotates alone.

<span class="strong">**2. Avoid recomputing a value that is actually a
compile-time constant**</span>

If a variable is assigned only once, from an expression built entirely
out of compile-time constants, and never changes afterwards, every place
that re-derives `variable + offset` at runtime pays for a RAM read plus
an addition for a value that never changes:

``` programlisting
    'Before: BufferAddr is a Word variable read from RAM, then added to, every time
    Poke BufferAddr + (CurrByte - 1), TempByte
```

``` programlisting
    'After: BUFFER_BASE is a #define - resolved at compile time, at no runtime cost
    #DEFINE BUFFER_BASE (RAM_START + 64)
    Poke BUFFER_BASE + (CurrByte - 1), TempByte
```

The variable itself may still be required elsewhere - for example,
hardware that reads the address back out of a peripheral’s own control
registers - but the point is that the surrounding code does not need to
re-read and re-add it every time, when a `#define` would give the same
value for nothing.

<span class="strong">**3. In a copy loop, increment an index rather than
recomputing it**</span>

A loop that copies bytes one at a time often only needs a plain "next
position", but it is easy to write it as a fresh calculation on every
pass instead:

``` programlisting
    'Before: recomputes a two-operand add on every single byte copied
    For CurrByte = 1 to TableLength
        ReadTable MyTable, CurrByte + TableStart, TempByte
        ...
    Next
```

``` programlisting
    'After: seed the index once, then simply increment it
    CopyPos = TableStart + 1
    For CurrByte = 1 to TableLength
        ReadTable MyTable, CopyPos, TempByte
        ...
        CopyPos++
    Next
```

This trades a two-operand add for a plain increment on every byte copied
- a small saving per byte, but a real one on a loop that runs often,
such as copying a lookup table into a display buffer on every screen
refresh.

<span class="strong">**4. Only unroll a copy loop when its length is a
genuine, fixed constant**</span>

Where a transfer’s length is fixed - by a hardware protocol, a fixed
record size, or a fixed-length packet - rather than merely "usually" a
certain size in practice, unrolling the loop into straight-line code
removes the loop overhead (initialise, compare, branch, increment)
entirely, backed by fixed-address byte aliases into the buffer being
copied to or from. This is a safe, unambiguous target for exactly that
reason. A genuinely variable-length copy - a string whose length depends
on what is being sent - is not, and should remain a loop.

<span class="strong">**5. Measure after every change; do not
assume**</span>

Every change above was verified two ways: the compiler’s own reported
program size (word count) before and after, and a functional test on
real hardware. Several plausible-looking "obvious" optimisations
attempted during the same investigation were tried, tested on hardware,
and reverted when they did not help or made matters worse - each looked
reasonable in the source but was not confirmed to do anything useful
until tested. Treat "this should be faster" as a hypothesis, not a
conclusion, until the compiled size and actual behaviour have both been
checked.

<span class="strong">**Choosing a loop: Repeat versus For/Do for a fixed
count**</span>

When a fixed number of repetitions is all that is needed, and the loop
counter’s value is not otherwise used, `Repeat` compiles to less
overhead per pass than `For`. In the generated program, `Repeat n` comes
down to this shape:

``` programlisting
    'One variable, counting down (PIC shown; AVR chips get an equivalent
    'decrement-and-branch pattern)
    RepeatLoop:
    '...body of the loop...
    decfsz RepeatCounter, F     ' <<< decrement, and skip the next line if it hit zero
    goto RepeatLoop
```

One variable, decremented and tested for zero in a single instruction,
then a branch back to the top - that is the entire per-iteration cost.
`For` has to support features `Repeat` does not: arbitrary start and end
values, ascending or descending order, and an optional `Step` that can
itself be a variable. It therefore tracks a start, an end, and a step,
and compares the counter against the end value on every single pass,
rather than simply testing for zero. That generality costs real
instructions per iteration that a plain "do this N times" loop does not
need to pay for.

Use `For` when the counter’s value is needed inside the loop, when
counting in a direction or step size other than 1, or when the bounds
are not known until runtime. Use `Repeat` for everything else that
amounts to "do this N times." See
<a href="repeat" class="link" title="Repeat">Repeat</a> and
<a href="for" class="link" title="For">For</a>.

<span class="strong">**Nested If versus combined boolean
conditions**</span>

`If A Then If B Then If C Then …​` and `If A And B And C Then …​` are
not compiled the same way, and the difference is not merely stylistic. A
single condition - one comparison, on a byte or bit, with no `And`,
`Or`, or arithmetic - is classified as "simple" and compiled inline as
one comparison plus one conditional skip instruction. As soon as a
condition contains `And`, `Or`, or another combining operator, it is
reclassified as a full calculation: each side is evaluated in full, and
the results are then combined. This is both more expensive to evaluate
and, as
<a href="constraints_and_error_messages_overview" class="link" title="Constraints and Error Messages Overview">Constraints and Error Messages</a>
describes, capped at two combined `And`/`Or` operations per condition.

Nested `If` statements do not have that ceiling, and gain a benefit
combined conditions structurally cannot: short-circuiting. In
`If A Then If B Then …​`, `B` is never evaluated at all once `A` is
false - the generated code simply branches past the inner `If` entirely.
In `If A And B Then …​`, both `A` and `B` are evaluated as values before
being combined, every time, whether or not `A` alone would already have
settled the answer. Where `A` is cheap to test and often false, and `B`
is more expensive to evaluate - a function call, or a more complex
comparison - nesting, with the cheap, likely-to-fail test placed
outermost, avoids evaluating `B` at all in the common case. See
<a href="if" class="link" title="If">If</a> and
<a href="conditions" class="link" title="Conditions">Conditions</a>.

<span class="strong">**Aliasing for performance**</span>

`Alias` (see <a href="dim" class="link" title="Dim">Dim</a>) does
more than save RAM by letting variables share storage. Used
deliberately, it removes runtime addressing cost entirely, because an
alias’s location is resolved once, at compile time, and never
recalculated while the program runs.

<div class="itemizedlist">

-   <span class="strong">**Aliasing a fixed array element avoids runtime
    array indexing.**</span> `MyArray(n)`, where `n` is a variable,
    needs a pointer or index register set up at runtime on every access.
    `MyArray(3)`, where `3` is a literal, is cheaper, but is still an
    array reference. Where code repeatedly touches one specific,
    always-the-same element of an array in a frequently-run section,
    alias it once to a plain variable name:

    ``` programlisting
        Dim SensorReadings(8) As Byte
        Dim LatestReading As Byte Alias SensorReadings(3)   ' <<< always element 3, resolved at compile time

        LatestReading = ReadAD(AN0)   ' <<< a direct, fixed-address write, not an indexed one
    ```

    <span class="strong">**Key line:**</span>
    `Dim LatestReading As Byte Alias SensorReadings(3)` — the compiler
    computes
    `` SensorReadings’s base address plus the constant offset `3 ``
    once, while compiling, and gives `LatestReading` that single fixed
    address permanently. Every subsequent use of `LatestReading` is a
    direct read or write, without the per-access indexing cost that
    writing out `SensorReadings(3)` directly would still carry.

-   <span class="strong">**Aliasing directly to a hardware register
    avoids a redundant variable and a copy.**</span> Where code needs to
    read or write a chip register (SFR), aliasing a variable name
    straight to that register is faster than declaring an ordinary
    variable and copying data to and from the register separately:

    ``` programlisting
        'Before: a separate variable, plus a copy in and a copy out on every use
        Dim PortBCopy As Byte
        PortBCopy = PORTB
        PortBCopy = PortBCopy Or 0b00000001
        PORTB = PortBCopy
    ```

    ``` programlisting
        'After: the alias IS the register - no separate storage, and no copy in either direction
        Dim PortBCopy As Byte Alias PORTB
        PortBCopy = PortBCopy Or 0b00000001
    ```

    The "before" version uses a RAM byte it does not need, and pays for
    a read-from-register and a write-to-register on top of whatever the
    actual operation was. The "after" version has no separate storage at
    all - every reference to `PortBCopy` reads or writes `PORTB`
    directly.

</div>

<span class="strong">**Interrupt latency**</span>

Interrupt latency is the time between the hardware event that triggers
an interrupt and the moment the interrupt-handling code actually starts
running. There is no operating system scheduler involved on these chips,
but there are still several GCBASIC-controlled costs between the
interrupt firing and the handler code running, and the way the
interrupt-handling code is written affects every one of them.

<span class="strong">**1. Automatic context save and restore.**</span>
By default, GCBASIC adds code at the very start of every interrupt that
saves every register the mainline code and the interrupt code might both
use, and matching code at the end that restores them - one store
instruction per register on entry, one load per register on exit - so
that the interrupt cannot silently corrupt whatever the mainline code
was in the middle of doing. This is real, unconditional latency paid on
every interrupt, regardless of whether that particular interrupt
actually touches those registers. `#OPTION NOCONTEXTSAVE` turns this
off, at a real cost: responsibility for guaranteeing that no register
shared between mainline and interrupt code is ever left in a state the
other side does not expect moves to the programmer - a class of bug that
is intermittent and hard to reproduce when it does occur, precisely
because it depends on exactly what the mainline code happened to be
doing at the moment the interrupt fired.

<span class="strong">**2. The order interrupt causes are tested
in.**</span> On chips with a single shared interrupt vector, GCBASIC
compiles the interrupt-handling code’s cause checks (each
`On Interrupt`/flag test) in the order they are written, and tests them
sequentially - each untested cause ahead of the one that actually fired
costs a further comparison before the real handling code runs. Where one
interrupt source fires far more often than the others, checking it first
minimises the average latency across all the interrupts the program
actually receives, even though the worst case - the least-frequent
cause, tested last - does not change.

<span class="strong">**3. What the handler code does once it
starts.**</span> Everything covered earlier on this page - avoiding
runtime division, not recomputing constants, short-circuiting nested
`If` statements - matters more inside an interrupt handler than almost
anywhere else in a program, because it runs on every occurrence of
whatever event triggers it, often while the rest of the program is
waiting for it to finish.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="development_guide_for_gcbasic_exe_compiler" class="link" title="Development Guide for GCBASIC.EXE compiler">Development Guide for GCBASIC.EXE compiler</a> — the
    compiler’s own automatic optimisation steps
-   <a href="rotate" class="link" title="Rotate">Rotate</a> — the
    through-Carry behaviour behind lesson 1 above
-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — the
    ADSPEED constant for tuning ADC performance
-   <a href="repeat" class="link" title="Repeat">Repeat</a> /
    <a href="for" class="link" title="For">For</a> — the
    fixed-count versus general-purpose loop choice above
-   <a href="program_memory_pages" class="link" title="Program Memory Pages">Program Memory Pages</a> — the
    NOCONTEXTSAVE trade-off in full, and how page 0 is packed
-   <a href="if" class="link" title="If">If</a> /
    <a href="conditions" class="link" title="Conditions">Conditions</a> — nested
    versus combined condition compilation above
-   <a href="dim" class="link" title="Dim">Dim</a> — the `Alias`
    declaration used for both aliasing techniques above
-   <a href="on_interrupt" class="link" title="On Interrupt">On Interrupt</a> — declaring
    the interrupt-cause handlers whose order affects latency above
-   <a href="constraints_and_error_messages_overview" class="link" title="Constraints and Error Messages Overview">Constraints and Error Messages</a> — structural
    limits to bear in mind alongside performance choices

</div>

</div>
