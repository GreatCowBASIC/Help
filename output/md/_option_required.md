<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_required"></span>\#Option Required

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option REQUIRED PIC|AVR CONSTANT %message.dat entry%
    #option REQUIRED PIC|AVR CONSTANT "Message string"
```

This option ensure that the specific CONSTANT exists within a library to
ensure a specific capability is available with the microcontroller.

<span class="strong">**Introduction:**</span>

This is for developers only.

This will cause the compiler check the CONSTANT is a non zero value.  If
the CONSTANT does not exist it will be treated as a zero value.

<span class="strong">**Example:**</span>

This example tests the CONSTANT `CHIPUSART` for both the PIC and AVR
microcontrollers.  If the CONSTANT is zero or does not exist then the
string will be displayed as an error message.

``` screen
    #option REQUIRED PIC CHIPUSART "Hardware Serial operations. Remove USART commands to resolve errors."
    #option REQUIRED AVR CHIPUSART "Hardware Serial operations. Remove USART commands to resolve errors."
```

</div>
