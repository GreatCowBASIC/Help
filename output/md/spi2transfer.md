<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="spi2transfer"></span>SPI2Transfer

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  SPI2Transfer tx, rx
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC microcontrollers with Hardware SPI modules.

<span class="strong">**Explanation:**</span>

This command simultaneously sends and receives a byte of data using the
SPI protocol. It behaves differently depending on whether the
microcontroller has been set to act as a master or a slave. When
operating as a master, `SPI2Transfer` will initiate a transfer. The data
in `tx` will be sent to the slave, whilst the byte that is buffered in
the slave will be read into `rx`. In slave mode, the `SPI2Transfer`
command will pause the program until a transfer is initiated by the
master. At this point, it will send the data in `tx` whilst reading the
transmission from the master into the `rx` variable.

<span class="strong">**See also**</span>
<a href="spimode" class="link" title="SPIMode">SPIMode</a>,<a href="" class="link">FastHWSPI2Transfer</a>

</div>
