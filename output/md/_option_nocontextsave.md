<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_nocontextsave"></span>\#Option NoContextSave

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option NoContextSave
```

<span class="strong">**Explanation:**</span>

Interrupts can occur at almost any time, and may interrupt another
command as it runs. To ensure that the interrupted command can continue
properly after the interrupt, some temporary variables (the context)
must be saved. Normally GCBASIC will do this automatically, but in some
cases it may be necessary to prevent this. If porting some existing
assembly code to GCBASIC, or creating a bootloader using GCBASIC that
will call another program,

`NoContextSave` can be used to prevent the context saving code from
being added automatically.

Be very careful using this option - it is very easy to cause random
corruption of variables. If creating your own context saving code, you
may need to save several variables. These are:

<div class="orderedlist">

1.  For Microchip PIC microcontrollers 12F/16F: W, STATUS, PCLATH
2.  For Microchip PIC microcontrollers 12F1/16F1/18F: W, STATUS, PCLATH,
    PCLATU, BSR
3.  For Atmel AVR microcontrollers: All 32 registers

</div>

Other variables may also need to be saved, depending on what commands
are used inside the interrupt handler. Everything that is saved will
also need to be restored manually when the interrupt handler finishes.

<span class="strong">**Example:**</span>

``` screen
    ' This shows an example that could be used by a bootloader to call some application code.

    ' The application code must deal with context save and restore
    ' Suppose that application code starts at location 0x100, with interrupt vector at 0x108

    'Chip model
    #chip 18F2620

    'Do not save context automatically
    #option NoContextSave

    'Main bootloader routine
    Set PORTB.0 On
    'Do other stuff to make this an actual bootloader and not a trivial example
    'Transfer control to application code
    goto 0x100

    'Interrupt routine - this will be placed at the interrupt vector
    Sub Interrupt
        'If any interrupt occurs, jump straight to application interrupt vector
        goto 0x108
    End Sub
```

</div>
