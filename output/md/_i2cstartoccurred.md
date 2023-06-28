<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_i2cstartoccurred"></span>I2CStartoccurred

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    I2CStartoccurred
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

If the I2C routine IS operating in Slave mode, this function will check
if a start condition has occurred since the last run of this function.
'Only used in slave mode

<span class="strong">**Example:**</span>

Please see
<a href="_i2csend.html" class="link" title="I2CSend">I2CSend</a> and
<a href="_i2creceive.html" class="link" title="I2CReceive">I2CReceive</a>
for an example.

Supported in &lt;I2C.H&gt;

</div>
