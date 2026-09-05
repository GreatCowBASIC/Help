<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="fvrisoutputready"></span>FVRIsOutputReady

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    user_var = FVRIsOutputReady()
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip microcontrollers with the Fixed Voltage
Reference (FVR) module.

<span class="strong">**Explanation:**</span>

This function returns the state of the FVR.   The returned value can be
assigned to a variable or used directly as a condition.

The method returns 0 or 1, as follows:

0 = Fixed Voltage Reference output is not ready or not enabled

1 = Fixed Voltage Reference output is ready for use

After `FVRInitialize` enables the FVR, the reference voltage takes a
short time to stabilise. Reading the ADC before it stabilises can give
an inaccurate result, so it is good practice to wait for
`FVRIsOutputReady` to become true first.

<span class="strong">**Example:**</span>

``` programlisting
    '// use FVR 4096 as Reference
    FVRInitialize ( FVR_4x )
    wait while FVRIsOutputReady = false          ' <<< the FVRIsOutputReady instruction
    ADVal = ReadAd(AN0)
```

<span class="strong">**Key line:**</span>
`wait while FVRIsOutputReady = false` — blocks here until the FVR
reports that its output has stabilised, so the following `ReadAd` call
reads against a settled reference voltage.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="fvrinitialize" class="link" title="FVRInitialize">FVRInitialize</a> — enabling
    the FVR and selecting its voltage
-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — the
    ADC read this check protects the accuracy of

</div>

</div>
