<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2cmode"></span>HI2CMode

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    HI2CMode Master | Slave
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

`HI2CMode` sets the microcontroller to either a Master device or a Slave
device. It is required before any other HI2C command is used, and is
typically set once at the start of the program.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` programlisting
    HI2C2Mode Master | Slave
```

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F1937, 32
    #define HI2C_DATA PORTC.4
    #define HI2C_CLOCK PORTC.3
    Dir HI2C_DATA in
    Dir HI2C_CLOCK in

    HI2CMode Master          ' <<< the HI2CMode instruction

    HI2CStart
    HI2CSend 0xA0
    HI2CStop
```

<span class="strong">**Key line:**</span> `HI2CMode Master` — configures
the hardware I2C/TWI module to act as the bus master, before any
`HI2CStart`, `HI2CSend`, or `HI2CReceive` calls are made.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hi2cstart" class="link" title="HI2CStart">HI2CStart</a> — starting
    a transaction after selecting the mode
-   <a href="hi2csend" class="link" title="HI2CSend">HI2CSend</a>
    /
    <a href="hi2creceive" class="link" title="HI2CReceive">HI2CReceive</a> — sending
    and receiving data in the selected mode
-   <a href="hi2csetaddress" class="link" title="HI2CSetAddress">HI2CSetAddress</a> — setting
    the device’s own address when in slave mode

</div>

Supported in &lt;HI2C.H&gt;

</div>
