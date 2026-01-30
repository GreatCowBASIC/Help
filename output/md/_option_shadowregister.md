<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_shadowregister"></span>\#Option Shadowregister

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option Shadowregister GPIO|PORTA|PORTB
```

This option enables RMW-safe output operations for the specified port by
using a shadow latch to track intended output states, preventing
unintended changes to input pin states.

<span class="strong">**Introduction:**</span>

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

``` screen
    #chip 12F675, 4
    #option Shadowregister GPIO

    Dir GP0 In
    GP2 = 1
```

This compiles to RMW-safe code:

``` screen
    ; Set GP2 high without affecting GP0
    bsf     LATA, 2        ; Update shadow latch
    movf    LATA, W
    movwf   GPIO           ; Safe write to port
```

</div>
