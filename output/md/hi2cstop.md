<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2cstop"></span>HI2CStop

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    HI2CStop
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

`HI2CStop` should be called at the end of every I2C transmission.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` programlisting
    HI2C2Stop
```

<span class="strong">**Example:**</span>

``` programlisting
    'Writes a single byte to a hardware I2C EEPROM at device address 0xA0, memory address 0x00
    HI2CStart
    HI2CSend 0xA0
    HI2CSend 0x00
    HI2CSend 0x55
    HI2CStop          ' <<< the HI2CStop instruction
```

<span class="strong">**Key line:**</span> `HI2CStop` — sends the stop
condition that ends the hardware I2C transmission.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hi2csend" class="link" title="HI2CSend">HI2CSend</a>
    /
    <a href="hi2creceive" class="link" title="HI2CReceive">HI2CReceive</a> — sending
    and receiving data before ending a transaction
-   <a href="hi2cstart" class="link" title="HI2CStart">HI2CStart</a>
    /
    <a href="hi2crestart" class="link" title="HI2CRestart">HI2CRestart</a> — starting
    the transaction that HI2CStop ends
-   <a href="hi2cmode" class="link" title="HI2CMode">HI2CMode</a> — selecting
    master or slave mode

</div>

Supported in &lt;HI2C.H&gt;

</div>
