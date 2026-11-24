<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_bootloaderhost"></span>\#Option BootloaderHost

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option bootloaderhost address
```

<span class="strong">**Explanation:**</span>

<a href="_option_bootloader" class="link" title="#Option Bootloader">#Option Bootloader</a>
builds an <span class="emphasis">*application*</span> that runs above a
bootloader: its reset and interrupt vectors are moved to `address`,
`address+8` and `address+0x18`. `#option bootloaderhost` builds the
<span class="emphasis">*bootloader itself*</span> (the "host"):

<div class="itemizedlist">

-   it sits at the reset vector;
-   it does not use interrupts itself;
-   it forwards the chip’s interrupt vectors to the application at
    `address`.

</div>

Without either option, GCBASIC puts the reset vector at `0x0000` and the
program’s own interrupt code at `0x0008` - so an application built
separately and placed at `address` would never see its own interrupts
fire, because the host’s vectors are still pointing at the host’s own
code. `#option bootloaderhost` fixes this by placing two `GOTO`
instructions at the chip’s real vector addresses, pointing into the
application:

``` screen
;Vectors
    ORG    0
    goto    BASPROGRAMSTART
    ORG    8
    goto    <address>+0x08          ;high-priority interrupt: to the application
    ORG    24
    goto    <address>+0x18          ;low-priority interrupt: to the application
;Program_memory_page: 0
    ORG    28
BASPROGRAMSTART
```

`address` is the same value the application uses with
`#option bootloader address`.

Currently supported on PIC18 (14-bit and other PIC families are not yet
supported). AVR is not supported - the AVR boot section works
differently and a bootloader built this way is unlikely to need it.

<span class="strong">**Rules and checks:**</span>

<div class="informaltable">

| Rule                                                                                                                     | Error if broken                                                                                                        |
|:-------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------|
| The host cannot have its own interrupt handler (`Sub Interrupt`, `On Interrupt`) - its vectors belong to the application | `#option bootloaderhost: interrupts are forwarded to the application; the bootloader cannot have an interrupt handler` |
| The host’s own code (and tables) must end below the application address                                                  | `#option bootloaderhost: program reaches address, the application area starts at address`                              |
| `#option bootloader` and `#option bootloaderhost` cannot both be used in the same program                                | `use either #option bootloader (an application) or #option bootloaderhost (a bootloader)`                              |
| The address must be even, and above the host’s own vector area (greater than `0x001C`)                                   | `#option bootloaderhost: invalid application address`                                                                  |

</div>

Configuration words are emitted as normal - the host owns them.
`InitSys` and `#option StartupMethodsDisabled` behave exactly as they do
without this option.

<span class="strong">**Example:**</span>

``` programlisting
    'The bootloader itself - sits at the reset vector, forwards both interrupt
    'vectors to an application that will be loaded at 0xA000
    #chip 18F4550, 20
    #option bootloaderhost 0xA000

    'bootloader code goes here - receive the application over a serial/USB
    'link and write it into flash starting at 0xA000, then jump there

    Do
    Loop
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_option_bootloader" class="link" title="#Option Bootloader">#Option Bootloader</a> — builds
    the application that runs at the forwarded address
-   <a href="_option_reservehighprog" class="link" title="#Option ReserveHighProg">#Option ReserveHighProg</a> — an
    alternative way to protect a bootloader area already written with an
    external programmer

</div>

</div>
