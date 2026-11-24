<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="i2cstartoccurred"></span>I2CStartoccurred

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    I2CStartoccurred
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

If the I2C routine is operating in Slave mode, this function checks
whether a start condition has occurred since the last time the function
was called. It is only used in slave mode.

<span class="strong">**Example:**</span>

``` programlisting
    'Slave-mode polling loop that waits for the master to begin a transmission
    Do
        If I2CStartoccurred Then          ' <<< the I2CStartoccurred instruction
            I2CReceive DataByte
        End If
    Loop
```

<span class="strong">**Key line:**</span>
`If I2CStartoccurred Then` — checks whether the master has issued a
start condition since this function was last called, so the slave only
attempts to receive data once a transmission has actually begun.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="i2c_overview" class="link" title="I2C Overview">I2C Overview</a> — category
    overview
-   <a href="i2creceive" class="link" title="I2CReceive">I2CReceive</a> — receiving
    the data once a start condition has been detected
-   <a href="i2cstart" class="link" title="I2CStart">I2CStart</a> — the
    master-side command that generates the start condition this function
    detects

</div>

Supported in &lt;I2C.H&gt;

</div>
