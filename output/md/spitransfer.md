<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="spitransfer"></span>SPITransfer

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  SPITransfer tx, rx
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC microcontrollers with Hardware SPI modules.

<span class="strong">**Explanation:**</span>

This command simultaneously sends and receives a byte of data using the
SPI protocol. It behaves differently depending on whether the
microcontroller has been set to act as a master or a slave. When
operating as a master, `SPITransfer` will initiate a transfer. The data
in `tx` will be sent to the slave, whilst the byte that is buffered in
the slave will be read into `rx`. In slave mode, the `SPITransfer`
command will pause the program until a transfer is initiated by the
master. At this point, it will send the data in `tx` whilst reading the
transmission from the master into the `rx` variable.

<span class="strong">**Example:**</span>

There are two example programs for this command - one to run on the
slave microcontroller , and one on the master. A reading is taken from a
sensor on the slave, and sent across to the master which shows the data
on its LCD screen.

<span class="strong">**Slave Program:**</span>

``` screen
  'Select chip model and configuration
  #chip 16F88, 20
  #config MCLR_OFF

  'Set directions of SPI pins
  dir PORTB.2 out
  dir PORTB.1 in
  dir PORTB.4 in
  'Set direction of analogue pin
  dir PORTA.0 in

  'Set SPI mode to slave
  SPIMode Slave

  'Allow other microcontroller to initialise LCD
  Wait 1 sec

  'Main loop - takes a reading, and then waits to send it across.
  do
  'Note that rx is 0 - this is because no data is to be received.
  SPITransfer ReadAD(AN0), 0
  loop
```

<span class="strong">**Master Program:**</span>

``` screen
  'General hardware configuration
  #chip 16F877A, 20

  'LCD connection settings
  #define LCD_IO 8
  #define LCD_DATA_PORT PORTC
  #define LCD_RS PORTD.0
  #define LCD_RW PORTD.1
  #define LCD_Enable PORTD.2

  'Set SPI pin directions
  dir PORTC.5 out
  dir PORTC.4 in
  dir PORTC.3 out

  'Set SPI Mode to master, with fast clock
  SPIMode MasterFast

  'Main Loop
  do
  'Read a byte from the slave
  'No data to send, so tx is 0
  SPITransfer 0, Temp

  'Display data
  if Temp > 0 then
    CLS
    Print "Light: "
    LCDInt Temp
    Temp = 0
  end if

  'Wait to allow time for the LCD to show the given value
  wait 100 ms
  loop
```

<span class="strong">**See also**</span>
<a href="spimode" class="link" title="SPIMode">SPIMode</a>,<a href="fasthwspitransfer" class="link" title="FastHWSPITransfer">FastHWSPITransfer</a>

</div>
