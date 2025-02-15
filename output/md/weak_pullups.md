<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="weak_pullups"></span>Weak Pullups

</div>

</div>

</div>

`Weak pullups` provide a method within many microcontrollers such as the
Atmel AVR and Microchip PIC microcontrollers to support
internal/selectable pull-ups for convenience and reduced parts count.

If you require `Weak pullups` these internal pullups can provide a
simple solution. For example, you can use them to ground input pins with
a switch closure - with the pullup enabled, the pin is held in a high
state until the input line pulls it to ground. Be aware of possible EMI
interference and also make sure to use a debounce routine.

If you need your weak pullups to exactly control current (rare for most
microcontroller applications), then you should consider 10k resistors
(5V/10K = 500uA) Why? If you review in the microcontroller data sheet,
there is no resistance given for the weak pullups. That is because they
are not weak pull-resistors they are weak pullups consisting of what
appear to be high-resistance channel pFETs. Their channel resistance
will vary with temperature and between parts; not easy to characterize.

The data sheet gives a current range for the internals as 50-400uA (at
5V).

PORTs can have an individually controlled weak internal pullup. When
set, each bit of the appropriate Microchip PIC register enables the
corresponding pin pullup. There is a master bit within a specific
register bit that enables pullups on all pins which also have their
corresponding weak pull bit set. Also when set, there is a weak pull
register bit to disable all weak pullups.

The weak pullup is automatically turned off when the port pin is
configured as an output. The pullups are disabled on a Power-on Reset.

Each specific microcontroller has different registers/bits for this
functionality.

You should review the datasheet for the method for a specific
microcontroller.

The following code demonstrates how to set the weak pullups available on
port B of an 18F25K20.

<span class="strong">**Example:**</span>

``` screen
    'A program to show the use of weak pullups on portb.
    'Set chip model
    #chip 18F25k20,16 'at 16 MHz
    #config MCLR = Off

    Set RBPU = 0 'enabling Port B pullups in general.
    SET WPUB1 = 1 'portb.1 pulled up
    Set WPUB2 = 1 'portb.2
    Set WPUB3 = 1 'portb.3
    Set WPUB4 = 1 'portb.4

    Dir Portb in
    Dir Portc out

    do
        portc.1 = portb.1 'in pin 22, out pin 12
        portc.2 = portb.2 'in pin 23, out pin 13
        portc.3 = portb.3 'in pin 24, out pin 14
        portc.4 = portb.4 'in pin 25, out pin 15

    loop 'jump back to the start of the program

    'main line ends here
    end
```

Also, see I2C Slave Hardware for an example using a 16F microcontroller.

</div>
