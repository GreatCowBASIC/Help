<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_indcall"></span>IndCall

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    IndCall Address
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`IndCall` provides a basic implementation of function pointers.
`Address` is the program memory location of the subroutine that is to be
called. There are two ways to specify this - either by providing a
direct reference to the subroutine using the @ operator, or by
specifying a word variable that contains the address.

This command is useful for callbacks. For example, a particular
subroutine might read bytes from a serial connection, but different
actions may need to be taken at different times. A different subroutine
could be created for each action, and then the subroutine for the
appropriate action could be passed to the serial connection reading
routine each time it is called.

<span class="strong">**Note:**</span> Calling subroutines that have
parameters using `IndCall` is not supported. Errors may occur. If data
needs to be passed, use a variable instead.

<span class="strong">**Example:**</span>

``` screen
    'Flash an LED using an indirect call
    #chip 12F683

    'Create a word variable, and set it to the memory location of the
    'Blink subroutine.
    Dim FlashingSub As Word
    FlashingSub = @Blink

    'Main loop
    Do
    'Indirect call to subroutine at location FlashingSub
        IndCall FlashingSub
    Loop

    'LED flashing subroutine
    Sub Blink
        PulseOut GPIO.0, 500 ms
        Wait 500 ms
    End Sub
```

</div>
