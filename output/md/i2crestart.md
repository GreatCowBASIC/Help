<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="i2crestart"></span>I2CRestart

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    I2CRestart
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

If the I2C routines are operating in Master mode, this command will send
a start and restart condition in a single command.

<span class="strong">**Example:**</span>

``` screen
 ...
    I2CRESTART
 ....
```

Supported in &lt;I2C.H&gt;

</div>
