<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="i2cstop"></span>I2CStop

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    I2CStop
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction
microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

When in Master mode, this command will send an I2C stop condition, and
re-enable interrupts if `I2CStart` disabled them. In Slave mode, it will
re-enable interrupts.

`I2CStop` should be called at the end of every I2C transmission.

<span class="strong">**Example:**</span>

``` programlisting
    'Writes a single byte to an I2C EEPROM at device address 0xA0, memory address 0x00
    I2CStart
    I2CSend 0xA0
    I2CSend 0x00
    I2CSend 0x55
    I2CStop          ' <<< the I2CStop instruction
```

<span class="strong">**Key line:**</span> `I2CStop` — sends the stop
condition that ends the transmission, and re-enables interrupts if
`I2CStart` had disabled them.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="i2c_overview" class="link" title="I2C Overview">I2C Overview</a> — category
    overview
-   <a href="i2cstart" class="link" title="I2CStart">I2CStart</a> — the
    matching command that begins the transmission
-   <a href="i2csend" class="link" title="I2CSend">I2CSend</a> — sending
    bytes between I2CStart and I2CStop
-   <a href="i2creceive" class="link" title="I2CReceive">I2CReceive</a> — receiving
    bytes between I2CStart and I2CStop

</div>

Supported in &lt;I2C.H&gt;

</div>
