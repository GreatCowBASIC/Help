<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_shadowregister"></span>\#Option Shadowregister

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    #option Shadowregister GPIO|PORTA|PORTB
```

This option enables RMW-safe output operations for the specified port by
using a shadow latch to track intended output states, preventing
unintended changes to input pin states.

<span class="strong">**Background:**</span>

Without this option, instructions like `bsf GPIO,2` on chips without
`LATx` registers (e.g., PIC12F675) trigger a read-modify-write (RMW)
operation on the port register. If any pins are configured as inputs,
their bits reflect external voltage levels during the read, which can
corrupt output latches when writing back. This can cause unexpected
output levels, corrupted latch states during interrupts, or
hard-to-trace bugs in mixed input/output setups.

When `#option Shadowregister port` is enabled, the compiler uses a
shadow latch variable to track output states. All pin changes update the
shadow latch, and writes to the port are done using full-byte transfers
from the shadow latch, avoiding RMW issues.

<span class="strong">**Example:**</span>

This example enables the shadow register for `GPIO` on a PIC12F675,
ensuring RMW-safe output for `GP2 = 1`.

``` programlisting
    #chip 12F675, 4
    #option Shadowregister GPIO          ' <<< the option enabling a compiler-maintained shadow latch for GPIO

    Dir GP0 In
    GP2 = 1
```

<span class="strong">**Key line:**</span>
`#option Shadowregister GPIO` — this instructs the compiler to track
every write to `GPIO` in an internal shadow variable, and to write the
whole port from that shadow variable rather than reading the live pin
states first; because `GP0` is an input, a plain read-modify-write on
`GPIO` here could pick up the wrong value for \`GP0’s bit and corrupt it
on write-back, which this option avoids.

This compiles to RMW-safe code conceptually along these lines (the exact
shadow variable name is compiler-internal and chip-specific, since the
12F675 itself has no LATA register):

``` programlisting
    ; Set GP2 high without affecting GP0
    bsf     GPIOShadow, 2   ; Update the shadow latch (not a real port register)
    movf    GPIOShadow, W
    movwf   GPIO            ; Safe write to port
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_option_nolatch" class="link" title="#Option NoLatch">#Option NoLatch</a> — the
    LATx-based solution to the same class of glitch, for chips that do
    have LATx registers
-   <a href="_option_volatile" class="link" title="#Option Volatile">#Option Volatile</a> — a
    lighter-weight glitch fix for a single bit rather than a whole port

</div>

</div>
