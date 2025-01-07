<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_fvrinitialize"></span>FVRInitialize

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    FVRInitialize ( FVR_OFF | FVR_1x | FVR_2x | FVR_4x  )
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip microcontrollers with the Fixed Voltage
Reference (FVR) module.

<span class="strong">**Explanation:**</span>

The method is a subroutine that sets the state of the FVR.   

`FVR_Off` =  Fixed Voltage Reference is set to OFF

`FVR_1x`  =  Fixed Voltage Reference is set to 1.024v

`FVR_2x`  =  Fixed Voltage Reference is set to 2.048v

`FVR_4x`  =  Fixed Voltage Reference is set to 4.096v

Using the the following device’s datasheet, as a general case,
   <http://ww1.microchip.com/downloads/en/DeviceDoc/40001419F.pdf>
   that can be downloaded from the device’s
page,   <http://www.microchip.com/wwwproducts/en/pic16f1828> parameter
AD06 in table 30-8 at page 359, and the corresponding Note 4, tell us
that the Vref voltage (Vref+ minus Vref-) should not be less than 1.8V,
regardless of the reference voltage used, in order for the ADC module to
work within the datasheet specifications.   Also, as Vref- cannot be a
negative voltage (voltages below GND) the lowest voltage on it is 0V.
  Then an FVR of 1.024V cannot be used as VREF+ for the ADC, but only
2.048 and 4.098 values.

The 1.024V FVR value exists for usage with other modules not just the
ADC module.

<span class="strong">**Example:**</span>

``` screen
    '// use FVR 4096 as Reference
    FVRInitialize ( FVR_4x )
    wait while FVRIsOutputReady = false
    ADVal = ReadAd(AN0)

    '// Turn off FVR
    FVRInitialize ( FVR_Off )
```

<span class="strong">**For more help, see**</span>
<a href="_fvrisoutputready.html" class="link" title="FVRIsOutputReady">FVRIsOutputReady</a>

</div>
