<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_bootloader"></span>\#Option Bootloader

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option bootloader address
```

<span class="strong">**Explanation:**</span>

`#option bootloader` prevents the overwriting of any pre-loaded
bootloader code, vectors, etc. below the specified address. The Great
Cow BASIC code will start at specified `address`.

A bootloader is a program that stays in the microcontroller and
communicates with the PC, typically through the serial interface. The
bootloader receives a user program from the PC and writes it in the
flash memory, then launches this program in execution. Bootloaders can
only be used with those microcontrollers that can write their flash
memory through software.

The bootloader itself must be written into the flash memory with an
external programmer.

In order for the bootloader to be launched after each reset, a
`goto bootloader` instruction must exist somewhere in the first 4
instructions; There are two types of bootloaders, some that require that
the user reallocate the code and others that by themselves reallocate
the first 4 instructions of the user program to another location and
execute them when the bootloader exits.

The diagram below shows the architecture of a bootloader. The left hand
is the operation of the instructions without a bootloader. The right
hand shows the initial instruction of goto the bootoader, then, when the
bootloader has initialised the execution of the start code.

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/optionbootloaderb1.PNG)

</div>

</div>

See
<a href="https://sourceforge.net/projects/tinypicbootload/files/" class="link">example bootload software.</a>

<span class="strong">**Example:**</span>

``` screen
    #option bootloader 0x800
```

</div>
