<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="dir"></span>Dir

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Dir port.bit {In | Out}               (Individual Form)
    Dir port {In | Out | DirectionByte}  (Entire Port Form)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Dir` command is used to set the direction of the ports of the
microcontroller chip. The individual form sets the direction of one pin
at a time, whereas the entire port form will set all bits in a port.

In the individual form, specify the port and bit (ie. `PORTB.4`), then
the direction, which is either In or Out.

The entire port form is similiar to the `TRIS` instruction offered by
some Microchip PIC microcontrollers. To use it, give the name of the
port (<span class="emphasis">*i.e.*</span> `PORTA`), and then a byte is
to be written into the `TRIS` variable. This form of the command is for
those who are familiar with the Microchip PIC microcontrollers internal
architecture.

<span class="strong">**Note:**</span> Entire port form will work
differently on Atmel AVR microcontrollers when a value other than IN or
OUT is used. Atmel AVR microcontrollers use 0 to indicate in and 1 to
indicate out, whereas Microchip PIC microcontrollers use 0 for out and 1
for in. When IN and OUT are used there are no compatibility issues.

<span class="strong">**Example:**</span>

``` screen
    'This program sets PORTA bits 0 and 1 to in, and the rest to out.
    'It also sets all of PORTB to output, except for B1.
    'Individual form is used for PORTA:
    DIR PORTA.0 IN
    DIR PORTA.1 IN
    DIR PORTA.2 OUT
    DIR PORTA.3 OUT
    DIR PORTA.4 OUT
    DIR PORTA.5 OUT
    DIR PORTA.6 OUT
    DIR PORTA.7 OUT
    'Entire port form used for B:
    DIR PORTB b'00000010'

    'Entire port form used for C:
    DIR PORTC IN
```

<span class="strong">**Automatic DIRection setting by the
compiler**</span>

The compiler will set the automatic pin DIRection using the following
logic.

Any time that the user program reads a pin or port, the compiler records
that. Any time that the user program writes to a pin or entire port, the
compiler also records that.

Once all input code has been compiled, the compiler examinies the list
of reads and writes.

If a pin is only ever written to, the compiler makes it an output.

If a pin is only ever read, the compiler does not know if the intent is
to read the latch or an input value, so it sets that pin to be an input.

If the compiler sees a pin being read and written to, the compiler does
not know if you are using a pin for some sort of bidirectional
communication, or if you are just reading the latch. To avoid making
incorrect assumptions, the compiler will expect you to set the pin
direction manually.

If you use "portA.2 = 1", you’ve only written to the pin, so the
compiler knows it must be an output.

If you use "portA.2 = not portA.2", the compiler sees that you are
reading and writing to the pin, and will expect the user program set the
direction instead of trying to guess what you are doing.

The compiler also records any use of the Dir command, and will not do
any automatic direction setting on a pin if Dir has been used on that
pin anywhere in the user program..

</div>
