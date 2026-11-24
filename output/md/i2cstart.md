<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="i2cstart"></span>I2CStart

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    I2CStart
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

If the I2C routines are operating in Master mode, this command will send
a start condition. If routines are in Slave mode, it will pause the
program until a start condition is sent by the master. It should be
placed at the start of every I2C transmission.

If interrupt handling is enabled, this command will disable it.

<span class="strong">**Example:**</span>

``` programlisting
    'Writes a single byte to an I2C EEPROM at device address 0xA0, memory address 0x00
    I2CStart          ' <<< the I2CStart instruction
    I2CSend 0xA0
    I2CSend 0x00
    I2CSend 0x55
    I2CStop
```

<span class="strong">**Key line:**</span> `I2CStart` — sends the start
condition that every I2C transmission must begin with, and disables
interrupt handling for the duration of the transaction if interrupts
were enabled.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="i2c_overview" class="link" title="I2C Overview">I2C Overview</a> — category
    overview
-   <a href="i2cstop" class="link" title="I2CStop">I2CStop</a> — the
    matching command that ends the transmission
-   <a href="i2csend" class="link" title="I2CSend">I2CSend</a> — sending
    bytes between I2CStart and I2CStop
-   <a href="i2creceive" class="link" title="I2CReceive">I2CReceive</a> — receiving
    bytes between I2CStart and I2CStop
-   <a href="i2crestart" class="link" title="I2CRestart">I2CRestart</a> — combining
    a stop and a new start in one command

</div>

Supported in &lt;I2C.H&gt;

</div>
