<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="inputs_outputs"></span>Inputs/Outputs

</div>

</div>

</div>

<span class="strong">**About Inputs and Outputs**</span>

Most general purpose pins on a microcontroller can function in one of
two modes: input mode, or output mode.

When acting as an input, the general purpose input/output pin will be
placed in a high-impedance state. The microcontroller will then sense
the general purpose input/output pin, and the program can read the state
of the pin and make decisions based on it.

When in output mode, the microcontroller will connect the general
purpose input/output pin to either Vcc (the positive supply), or Vss
(ground, or the negative supply). The program can then set the state of
the pin to either high or low.

GCBASIC will attempt to determine the direction of each general purpose
input/output pin, and set it appropriately, when possible. However, if
the pin is both read from and written to in your program, then it must
be configured to input or output mode by the program, using the
appropriate <a href="dir" class="link" title="Dir">Dir</a>
commands.

Example of `dir` commands.

``` programlisting
    'The port address is microcontroller specific.  Portx.x is a general case for PICs and AVRs
    dir PORTB.0 in          ' <<< the Dir instruction setting a single pin's direction
    dir PORTB.1 out

    'The port address is microcontroller specific.  GPIOx.x is a general case for some PICs
    dir GPIO.0 in
    dir GPIO.1 Out

    'Set the whole port as an output
    dir PORTB out
    dir GPIO out

    'Set the whole port as an input
    dir PORTC in
    dir GPIO in
```

<span class="strong">**Key line:**</span> `dir PORTB.0 in` — configures
a single pin (bit 0 of PORTB) as a digital input; the remaining lines
show the same command used on a whole port and on the alternate GPIO
naming some PIC families use.

<span class="strong">**Microchip specifics for read/write
operations**</span>

For the specific ports and general purpose input/output pins available
for a specific microcontroller, please refer to the datasheet.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Port</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Purpose</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Example</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>PORTx maps to the microcontroller’s digital pins 0 to 7, where x can be A, B, C, D, E, F, or G</p></td>
<td style="text-align: left;"><p>Read:</p>
<p>PORTx is the port data register for a read operation.</p></td>
<td style="text-align: left;"><p>uservar=PORTA</p>
<p>uservar=PORTA.1</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>PORTx maps to the microcontroller’s digital pins 0 to 7, where x can be A, B, C, D, E, F, or G</p></td>
<td style="text-align: left;"><p>Write:</p>
<p>PORTx is the port data register for a write operation; LATx is not required, as GCBASIC will implement LATx when needed.</p>
<p>See <a href="_option_nolatch" class="link" title="#Option NoLatch">#Option NoLatch</a> for more information on LAT registers and how to disable this automatic function.</p></td>
<td style="text-align: left;"><p>PORTA=255</p>
<p>PORTA.1=1</p></td>
</tr>
</tbody>
</table>

</div>

To read a general purpose input/output pin, you need to ensure the
direction is correct: `DIR Portx IN` (default is IN), or a specific set
of port bits. `uservar = PORTx.n` can be used.

Examples:

``` programlisting
    uservar = PORTb.0
    uservar = PORTb
```

To write to a general purpose input/output pin, you need to ensure the
direction is correct: `DIR Portx OUT` for the port, or a specific set of
port bits. `PORTx.n = uservar` can be used.

Examples:

``` programlisting
    PORTb.0 = uservar
    PORTb = uservar
```

<span class="strong">**ATMEL specifics for read/write
operations**</span>

Using a Mega328p as a general example, the following provides insights
for AVR devices. For the specific ports and general purpose input/output
pins available for a specific microcontroller, please refer to the
datasheet.

<div class="informaltable">

| <span class="strong">**Port**</span>                                                                                                                   | <span class="strong">**Write operation**</span>                                                                 | <span class="strong">**Read operation**</span>    |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------|:--------------------------------------------------|
| PORTD maps to the Mega328p (and other AVR microcontrollers) digital pins 0 to 7                                                                        | PORTD - The Port D Data Register - write operation (a read operation on a port will provide the pull-up status) | PIND - The Port D Input Pins Register - read only |
| PORTB maps to the Mega328p (and other AVR microcontrollers) digital pins 8 to 13. The two high bits (6 & 7) map to the crystal pins and are not usable | PORTB - The Port B Data Register - write operation (a read operation on a port will provide the pull-up status) | PINB - The Port B Input Pins Register - read only |
| PORTC maps to the Mega328p (and other AVR microcontrollers) analog pins 0 to 5. Pins 6 & 7 are only accessible on the Mega328p Mini                    | PORTC - The Port C Data Register - write operation (a read operation on a port will provide the pull-up status) | PINC - The Port C Input Pins Register - read only |

</div>

To read a general purpose input/output pin, you need to ensure the
direction is correct: `DIR Portx IN` (default is IN), or a specific set
of port bits. `uservar = PINx.n` can be used, and to read a whole data
port use `uservar = PINx`.

Examples:

``` programlisting
    uservar = PINb.0
    uservar = PINb
```

To write to a general purpose input/output pin, you need to ensure the
direction is correct: `DIR Portx OUT` for the port, or a specific set of
port bits. `PORTx.n = uservar` can be used, and to write to a whole data
port use `PORTx = uservar`.

Examples:

``` programlisting
    PORTb.0 = uservar
    PORTb = uservar
```

  
  
<span class="strong">**Setting Ports and Port.bit**</span>

You can set a port as shown above with a variable, or you can set it
with a constant, or any combination using the bitwise and logical
operators.

``` programlisting
    #define InitStateofPort 0b11110000
    PORTb = InitStateofPort               'will unconditionally set bits 4:7

    PORTb = 0b11110000                    'will unconditionally set bits 4:7

    PORTb = uservar OR 0b11110000         'will OR bits 4:7 to ensure bits 4:7 are set
```

The following is also valid - read a port.bit and then set port.bit with
a variable or port value, as shown below.

``` programlisting
    dir PORTB out

    PORTB.0 = NOT  PORTB.0
```

The user code above may cause issues with glitches when the read and
write operations occur. Let us look at the generated assembler.

``` programlisting
    ;portb.0 = NOT  portb.0
      banksel SYSTEMP1
      clrf  SysTemp1
      btfsc PORTB,0
      incf  SysTemp1,F
      comf  SysTemp1,F
      bcf PORTB,0
      btfsc SysTemp1,0
      bsf PORTB,0
```

To resolve any glitches, add `#option Volatile` to your user code.

``` programlisting
    #option Volatile PORTB.0          ' <<< the #option Volatile directive resolving the read-modify-write glitch

    dir PORTB out

    PORTB.0 = NOT  PORTB.0
```

<span class="strong">**Key line:**</span>
`#option Volatile PORTB.0` — forces the compiler to generate a
glitch-free read-modify-write sequence for bit 0 of PORTB (compare the
two ASM listings below), at the cost of slightly larger generated code.

This option produces the following assembler, resolving the glitch
issue.

``` programlisting
    ;portb.0 = NOT  portb.0
      banksel SYSTEMP1
      clrf  SysTemp1
      btfsc PORTB,0
      incf  SysTemp1,F
      comf  SysTemp1,F
      btfsc SysTemp1,0
      bsf PORTB,0
      btfss SysTemp1,0
      bcf PORTB,0
```

  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="dir" class="link" title="Dir">Dir</a> — setting a pin
    or port’s direction
-   <a href="_option_volatile" class="link" title="#Option Volatile">#Option Volatile</a> — forcing
    glitch-free read-modify-write operations, as used above
-   <a href="_option_nolatch" class="link" title="#Option NoLatch">#Option NoLatch</a> — disabling
    the automatic LATx substitution on writes

</div>

</div>
