<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="fasthwspi2transfer"></span>FastHWSPI2Transfer

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  FastHWSPI2Transfer tx
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC microcontrollers with Hardware SPI modules.

<span class="strong">**Explanation:**</span>

This command only sends a byte of data using the SPI protocol. This
command only supports master mode.

As a master, `FastHWSPI2Transfer` will initiate a transfer. The data in
`tx` will be sent to the slave.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="spitransfer" class="link" title="SPITransfer">SPITransfer</a>
-   <a href="spimode" class="link" title="SPIMode">SPIMode</a>

</div>

</div>
