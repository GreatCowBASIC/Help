<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="i2crestart"></span>I2CRestart

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    I2CRestart
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

If the I2C routines are operating in Master mode, this command will send
a start and restart condition in a single command.

<span class="strong">**Example:**</span>

``` programlisting
    'Switch from writing to reading within the same transaction, without a full stop/start
    I2CStart
    I2CSend 0xA0
    I2CSend 0x00
    I2CRestart          ' <<< the I2CRestart instruction
    I2CSend 0xA1
    I2CReceive DataByte
    I2CStop
```

<span class="strong">**Key line:**</span> `I2CRestart` — issues a stop
and a new start in a single command, letting the transaction switch
direction, such as from writing to reading, without releasing the bus in
between.

Supported in &lt;I2C.H&gt;

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="i2c_overview" class="link" title="I2C Overview">I2C Overview</a> — category
    overview
-   <a href="i2creset" class="link" title="I2CReset">I2CReset</a> — related
    command in the same category
-   <a href="i2creceive" class="link" title="I2CReceive">I2CReceive</a> — related
    command in the same category

</div>

</div>
