<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="setwith"></span>SetWith

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    SetWith(TargetBit, Source)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`SetWith` is an extended version of SET, it allows a Bit Field to be set
or cleared by evaluating the content of Source. `SetWith` should always
be used when TargetBit is an I/O Bit and Source is a Function, in order
to avoid the possibility of I/O jitter.

Source may be a variable and of type: Bit, Byte, Word or Long, a
Constant, an expression or a Function.

It will SET TargetBit to 1 if Source evaluates to anything other than
zero. TargetBit will always be a 1 or a 0 regardless of the variable
type of TargetBit.

<span class="strong">**Example:**</span>

``` screen
    ' This program will reflect the state of SW1(RA3) on LED DS1(RC0) of the Microchip
    ' Low Pin Count Demo Board. Notice that because SW1 is normally High the state has to
    ' be inverted to turn on the LED (DS1) when SW1 is pressed.

    #chip   16f690    ' declare the target Device

    #Define SW1 PORTA.3
    #Define DS1 PORTC.0

    DIR DS1 Out
    DIR SW1 In

    Do
      ' set the Bit DS1 to equal the Bit SW1
      SetWith( DS1, !SW1 )
    Loop
    END
```

<span class="strong">**See Also
<a href="bitwise_operations_overview" class="link" title="Bitwise Operations Overview">Bitwise Operations Overview</a>**</span>
and <span
class="strong">**<a href="conditions" class="link" title="Conditions">Conditions</a>**</span>

</div>
