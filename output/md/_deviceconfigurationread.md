<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_deviceconfigurationread"></span>DeviceConfigurationRead

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    deviceconfigurationRead (location, store)
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC microcontrollers with self read
capability. Not available on Atmel AVR at present.

<span class="strong">**Explanation:**</span>

`deviceconfigurationRead` reads information from the configurations area
of the memory on chips that support this feature. `location` and `store`
are both word variables, meaning that they can be values greater than
255.

The `location` depends on the amount Microchip PIC microcontroller,
which is given on the datasheet. `store` is 14 bits wide, and thus can
store values up to `16383`.

This is an advanced command which should only be used by advanced
developers.

</div>
