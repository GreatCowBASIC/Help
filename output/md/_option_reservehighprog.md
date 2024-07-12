<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_reservehighprog"></span>\#Option ReserveHighProg

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option ReserveHighProg [words]
```

This option reserves program memory to be kept free at the top end of
memory.  This useful for HEF/SAF or bootloaders.

The option provided a reservation for the memory region that is normally
assumed to be available to the compiler for the application code
storage. In order to avoid any possible conflict (overlapping code and
data usage), it is important to reserve the devices pecific memory range
by using the compiler option (shown above) in the project configuration.

Using the
`` #option ReserveHighProg [words] exposes the constant `ChipReserveHighProg ``
in the user program.

<span class="strong">**Defined constants**</span>

The compiler has constants that can be used as an alternative to the
parameter `[words]`.  

The compiler constants are: OPTIBOOT, OPTIBOOTUSB, ARDUINONANO,
ARDUINOMEGA2560 or TINYBOOTLOADER.

Where these constants equate to:

``` screen
    OPTIBOOT        = 1024
    OPTIBOOTUSB     = 2048
    ARDUINONANO     = 1024
    ARDUINOMEGA2560 = 1024
    TINYBOOTLOADER  = 128
    TINYBOOTLOADER128  = 128
    TINYBOOTLOADER125  = 256
```

<span class="strong">**Examples 1**</span>

In the example below the region 0x1F80 to 0x1FFF (flash block for a
PIC16F1509 microcontroller) has been removed from the default space
available for code storage using the compiler option.

``` screen
    'Set chip model
    #chip 16F1509

    'Directive
    #option ReserveHighProg 128
```

<span class="strong">**Examples 2**</span>

In the example below the bootloader area of Program Memory is protected.

This will ensure the program size does not overwrite the OptiBoot
bootloader.

``` screen
    'Set chip model
    #chip MEGA328P

    'Directive
    #option ReserveHighProg OPTIBOOT
```

</div>
