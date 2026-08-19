<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_removeavrvectors"></span>\#Option removeAVRvectors

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option removeAVRvectors
```

<span class="strong">**Explanation:**</span>

`#option removeAVRvectors` reduces the AVR interrupt vector table (IVR)
in the compiled output to the smallest possible size, saving flash
memory.

Normally, AVR flash memory begins with the full interrupt vector table —
a fixed block of addresses, one per interrupt source, that the processor
jumps to when an interrupt occurs. The actual user code is placed in
memory after this entire table. On devices with many interrupt sources
this table can occupy a significant amount of flash, much of which is
typically unused.

When `#option removeAVRvectors` is used, the compiler determines which
interrupt vectors are actually used in the program and writes only those
entries, up to and including the highest used vector address. User code
is then placed immediately after the last required vector entry. If no
interrupts are used at all, the vector table is omitted entirely and
user code starts at address 1, immediately after the reset vector.

`ON INTERRUPT` can be used with `#option removeAVRvectors`. The compiler
will preserve the vector entries required by any interrupts that are
defined in the program.

<span class="strong">**Restriction:**</span>

Inline ASM code that uses or references interrupt vectors directly must
not be used when this directive is active, as the full vector table will
not be present in the compiled output.

<span class="strong">**Example:**</span>

``` screen
    #option removeAVRvectors
```

</div>
