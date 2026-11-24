<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2cstart"></span>HI2CStart

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    HI2CStart
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

If the HI2C routines are operating in Master mode, this command will
send a start condition. If routines are in Slave mode, it will pause the
program until a start condition is sent by the master. It should be
placed at the start of every I2C transmission.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` programlisting
    HI2C2Start
```

<span class="strong">**Example:**</span>

``` programlisting
    'Writes a single byte to a hardware I2C EEPROM at device address 0xA0, memory address 0x00
    HI2CStart          ' <<< the HI2CStart instruction
    HI2CSend 0xA0
    HI2CSend 0x00
    HI2CSend 0x55
    HI2CStop
```

<span class="strong">**Key line:**</span> `HI2CStart` — sends the start
condition that every hardware I2C transmission must begin with, using
the microcontroller’s built-in I2C/TWI module.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hi2csend" class="link" title="HI2CSend">HI2CSend</a>
    /
    <a href="hi2creceive" class="link" title="HI2CReceive">HI2CReceive</a> — sending
    and receiving data after starting a transaction
-   <a href="hi2cstop" class="link" title="HI2CStop">HI2CStop</a> — ending
    a transaction started with HI2CStart
-   <a href="hi2crestart" class="link" title="HI2CRestart">HI2CRestart</a> — repeating
    the start condition without stopping first
-   <a href="hi2cmode" class="link" title="HI2CMode">HI2CMode</a> — selecting
    master or slave mode before starting

</div>

Supported in &lt;HI2C.H&gt;

</div>
