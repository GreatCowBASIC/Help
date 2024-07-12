<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_startup"></span>\#startup

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #startup SubName  [priority]
```

<span class="strong">**Explanation:**</span>

`#startup` is used in include files to automatically insert
initialization routines. If a define or subroutine from the file is used
in the program, then the specified subroutine will be called.

The `priority` to \#startup support the setting of the priority of the
subroutines for all the libraries in a project.

Subroutines will be called in order from smallest to largest priority
number.

``` literallayout
InitSys has priority 80, lowlevel communication routines have the priority of 90
All other subroutines defaults to 100.
```

<span class="strong">**Notes:**</span> Limitations on this directive
are:

`startup` may only occur once within a source file.

No parameters can be passed the the subroutine that is specificed.

<span class="strong">**Example 1:**</span>

This example from the hardware I2C library set the subroutine with the
priority of 90.

``` screen
    #startup HIC2Init, 90
```

<span class="strong">**Example 2:**</span>

This example from would be included in user code to ensure the PPS
setting are set prior to use of the MSSP or USART.

``` screen
    #chip 16f18855,32
    #option explicit

    'Set the PPS of the I2C and the RS232 ports.
    #startup InitPPS, 85
    Sub InitPPS
      RC0PPS = 0x0010       'RC0->EUSART:TX;
      RXPPS  = 0x0011       'RC1->EUSART:RX;

      SSP1CLKPPS = 0x14     'RC3->MSSP1:SCL1;
      SSP1DATPPS = 0x13     'RC4->MSSP1:SDA1;
      RC3PPS = 0x15         'RC3->MSSP1:SCL1;
      RC4PPS = 0x14         'RC4->MSSP1:SDA1;
    End Sub
```

</div>
