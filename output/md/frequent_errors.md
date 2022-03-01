<div class="section">

<div class="titlepage">

<div>

<div>

<span id="frequent_errors"></span>Frequent errors
--------------------------------------------------

</div>

</div>

</div>

<span class="red">Frequent errors that may happen, from the initial
creation of a program and onwards.</span>

<div class="itemizedlist">

-   Strange timings: You declared an oscillator frequency, different
    from the oscillator actually attached to the micrcontroller.
-   No oscillator: Keep in mind that, besides the frequency, you must
    also set the type of oscillator, internal or external.
-   No Great Cow BASIC frequency stated: If not declared in your source
    program - Great Cow BASIC uses a preset frequency suitable for
    operating the microcontroller as the fastest practical.
-   External oscillators: It must be explicitly stated, if not stated
    Great Cow BASIC will attempt to setup the internal oscillator.
-   Ports: Great Cow BASIC will set the ports automatically but you may
    need to set the ports outputs or inputs when needed.
-   Analog levels: When applied on the ports defined as digital inputs.
    can cause current consumption in the input buffer, which is outside
    the device specifications. Beware.
-   Current drawn: Current taken from the microcontroller outputs,
    exceeding the maximum allowed (not all pins supply the same
    current). Beware of drawing to much current.
-   Watchdog Timer (WDT): The WDT is a useful timer. Enable to reset the
    microcontroller when processing can get stuck in a loop.
-   Interrupts: A badly controlled interrupt (in some cases) will
    prevent the execution of the entire program.
-   No action: The circuit is not powered.
-   Still no action: The microcontroller is not present or different
    from the device you expected.
-   Still no action: The microcontroller inserted incorrectly in the
    appropriate socket.
-   Cannot program: Incorrect programmer, Incorrect programmer
    parameters or circuit connections are incorrect.
-   Still Cannot program: Values of excessively incorrect circuit
    resistances.
-   Serial Communcations: The TX and RX pins of the serial port are
    exchanged, and/or the connections with the level converter, ttl /
    rs232 or ttl / usb.
-   Stlll no Serial Communcations: Serial speed, different from the one
    set in the circuit with which it is intended to communicate or vice
    versa.
-   No I2C/TWI: SDL and/or SCL pin exchanged on the I2C/TWI bus
    connection, and/or no pull-up resistors, and/or no common 0 voltage.
-   Incorrect timing: Calculation of any timings related to the
    frequency of the external oscillator, without taking into account
    the division by 4.
-   Strange Numeric Values: The variables declared are insufficient to
    contain the values ​​to be processed.

</div>

</div>
