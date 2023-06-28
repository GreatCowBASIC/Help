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
placed in a high impedance state. The microcontroller will then sense
the general purpose input/output pin, and the program can read the state
of the general purpose input/output pin and make decisions based on it.

When in output mode, the microcontroller will connect the general
purpose input/output pin to either Vcc (the positive supply), or Vss
(ground, or the negative supply). The program can then set the state of
the general purpose input/output pin to either high or low.

GCBASIC will attempt to determine the direction of each general purpose
input/output pin, and set it appropriately, when possible. GCBASIC will
try to set the direction of the general purpose input/output pin.
However, if the general purpose input/output pin is read from and
written to in your program, then the general purpose input/output pin
must be configured to input or output mode by the program, using the
appropriate <a href="dir" class="link" title="Dir">Dir</a>
commands.

Example of `dir` commands.

``` screen
    'The port address is microcontroller specific.  Portx.x is a general case for PICs and AVRs
    dir portb.0 in
    dir portb.1 out

    'The port address is microcontroller specific.  gpiox.x is a general case for some PICs
    dir gpio.0 in
    dir gpio.1 Out

    'Set the whole port as an output
    dir portb out
    dir gpio out

    'Set the whole port as an input
    dir portc in
    dir gpio in
```

<span class="strong">**Microchip specifics for read/write
operations**</span>

For the specific ports and general purpose input/output pins available
for a specific microcontroller please refer to the datasheet.

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
<td style="text-align: left;"><p>PORTx maps to the microcontrollers digital pins 0 to 7. Where x can be a,b,c,d,e,f or g</p></td>
<td style="text-align: left;"><p>Read:</p>
<p>PORTx the port data register for a read operation.</p></td>
<td style="text-align: left;"><p>uservar=PORTA</p>
<p>uservar=PORTA.1</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>PORTx maps to microcontrollers digital pins 0 to 7. Where x can be a,b,c,d,e,f or g</p></td>
<td style="text-align: left;"><p>Write:</p>
<p>PORTx the port data register for a write operation, and, where LATx is not required as GCBASIC will implement LATx when needed.</p>
<p>See <a href="_option_nolatch" class="link" title="#Option NoLatch">Option NoLatch</a> for more information on LAT registers and how to disable this automatic function.</p></td>
<td style="text-align: left;"><p>PORTA=255</p>
<p>PORTA.1=1</p></td>
</tr>
</tbody>
</table>

</div>

To read a general purpose input/output pin, you need to ensure the
direction is correct `DIR Portx IN` is set (default is IN) or a specific
set of port bits. Where `uservar = PORTx.n` can be used.

Examples:

``` screen
    uservar = PORTb.0
    uservar = PORTb
```

To write to a general purpose input/output pin, you need to ensure the
direction is correct `DIR Portx OUT` for port or a specific set of port
bits. Where `PORTx.n = uservar` can be used.

Examples:

``` screen
    PORTb.0 = uservar
    PORTb = uservar
```

<span class="strong">**ATMEL specifics for read/write
operations**</span>

Using a Mega328p as a general the following provides insights for the
AVR devices. For the specific ports and general purpose input/output
pins available for a specific microcontroller please refer to the
datasheet.

<div class="informaltable">

| <span class="strong">**Port**</span>                                                                                                                           | <span class="strong">**Write operation**</span>                                                                 | <span class="strong">**Read operation**</span>    |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------|:--------------------------------------------------|
| PORTD maps to Mega328p (and, the AVR microcontrollers) digital pins 0 to 7                                                                                     | PORTD - The Port D Data Register - write operation (a read operation to a port will provide the pull-up status) | PIND - The Port D Input Pins Register - read only |
| PORTB maps to Mega328p (and, the AVR microcontrollers) digital pins 8 to 13. The two high bits (6 & 7) map to the crystal pins and are not usable              | PORTB - The Port B Data Register - write operation (a read operation to a port will provide the pull-up status) | PINB - The Port B Input Pins Register - read only |
| PORTC maps to Mega328p (and, the AVR microcontrollers) analog pins 0 to 5. Pins 6 & 7 are only accessible on the Mega328p (and, the AVR microcontrollers) Mini | PORTC - The Port C Data Register - write operation (a read operation to a port will provide the pull-up status) | PINC - The Port C Input Pins Register - read only |

</div>

To read a general purpose input/output pin, you need to ensure the
direction is correct `DIR Portx IN` is set (default is IN) or a specific
set of port bits. Where `uservar = PINx.n` can be used and therefore to
read data port use `uservar = PINx`.

Examples:

``` screen
    uservar = PINb.0
    uservar = PINb
```

To write to a general purpose input/output pin you need to ensure the
direction is correct `DIR Portx OUT` for port or a specific set of port
bits. Where `PORTx.n = uservar` can be used and therefore to write to a
data port use `PORTx = uservar`.

Examples:

``` screen
    PORTb.0 = uservar
    PORTb = uservar
```

  
  
<span class="strong">**Setting Ports and Port.bit**</span>

You can set a port as shown above with a variable, or, you can set with
a constant or any combination using the bitwise and logical operators.

``` screen
    #define InitStateofPort 0b11110000
    PORTb = InitStateofPort               'will unconditionally set bits 4:7

    PORTb = 0b11110000                    'will unconditionally set bits 4:7

    PORTb = uservar OR 0b11110000         'will OR bits 4:7 to ensure bits 4:7 are set
```

The following is also valid - read a port.bit and then set port.bit with
a variable or port value. As shown below.

``` screen
    dir portb out

    portb.0 = NOT  portb.0
```

The user code above may cause issues with glitches when the read and
write operations occurs. Let us look at the generated assembler.

``` screen
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

To resolve any glitches add `#option Volatile` to your user code.

``` screen
    #option Volatile portb.0

    dir portb out

    portb.0 = NOT  portb.0
```

This option provides the following assembler resolving the glitch issue.

``` screen
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

  
  

<span class="strong">**See also**</span>
<a href="dir" class="link" title="Dir">Dir</a>,
<a href="_option_volatile" class="link" title="#Option Volatile">#Option Volatile</a>

  
  

</div>
