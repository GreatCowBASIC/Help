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
initialisation routines. If a define or subroutine from the file is used
in the program, then the specified subroutine will be called.

The `priority` parameter to `#startup` supports setting the priority of
the subroutines for all the libraries in a project.

Subroutines will be called in order from smallest to largest priority
number.

``` literallayout
InitSys has priority 80, lowlevel communication routines have the priority of 90
All other subroutines default to 100.
```

<span class="strong">**Notes:**</span> Limitations on this directive
are:

`#startup` may only occur once within a source file.

No parameters can be passed to the subroutine that is specified.

<span class="strong">**Example 1:**</span>

This example, from the hardware I2C library, sets the subroutine with
the priority of 90.

``` programlisting
    #startup HI2CInit, 90
```

<span class="strong">**Example 2:**</span>

This example would be included in user code to ensure the PPS settings
are set prior to use of the MSSP or USART.

``` programlisting
    #chip 16f18855,32
    #option explicit

    'Set the PPS of the I2C and the RS232 ports.
    #startup InitPPS, 85          ' <<< registering InitPPS to run automatically at startup, before priority-90 routines
    Sub InitPPS
      RC0PPS = 0x0010       'RC0->EUSART:TX;
      RXPPS  = 0x0011       'RC1->EUSART:RX;

      SSP1CLKPPS = 0x14     'RC3->MSSP1:SCL1;
      SSP1DATPPS = 0x13     'RC4->MSSP1:SDA1;
      RC3PPS = 0x15         'RC3->MSSP1:SCL1;
      RC4PPS = 0x14         'RC4->MSSP1:SDA1;
    End Sub
```

<span class="strong">**Key line:**</span>
`#startup InitPPS, 85` — registers `InitPPS` to run automatically at
compile-time-assigned priority 85, which is lower (and therefore runs
earlier) than the I2C library’s own priority-90 startup routine,
ensuring the PPS pin routing is in place before the MSSP/USART hardware
initialises.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="peripheral_pin_select_for_microchip_microcontrollers" class="link" title="Peripheral Pin Select for Microchip microcontrollers.">Peripheral Pin Select for Microchip microcontrollers</a> — background
    on Peripheral Pin Select, used in Example 2
-   <a href="compiler_control" class="link" title="Compiler Control">Compiler Control</a> — redirecting
    or cancelling a library’s \#startup routine

</div>

</div>
