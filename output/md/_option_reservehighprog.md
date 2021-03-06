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

In the example below the region 0x1F80 to 0x1FFF (flash block for a
PIC16F1509 microcontroller) has been removed from the default space
available for code storage using the compiler option.

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16F1509

    'Example command
    #option ReserveHighProg 128
```

</div>
