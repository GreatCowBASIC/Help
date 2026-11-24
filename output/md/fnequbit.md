<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="fnequbit"></span>FnEquBit

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    bit = FnEquBit(BitIn)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`FnEquBit` is a function and is the bitwise equivalent of the assign
operator "=".

`FnEquBit` will return the Logic State of BitIn. It is equivalent to the
'C' statement as shown below.

``` screen
    BitOut = BitIn
```

`FnEquBit` can be used to assign a non bit variable to a bit variable.
BitIn may be a variable and of type: Bit, Byte, Constant or another
Function. If BitIn is of type Word or Long only the Least Significant 8
bits will be evaluated. It will return 1 if BitIn evaluates to anything
other than zero.

<span class="strong">**Note:**</span> If BitOut is an I/O Bit, then
<span
class="strong">**<a href="setwith" class="link" title="SetWith">SetWith</a>**</span>
should be used to encapsulate the function. See below.

<span class="strong">**Example:**</span>

``` screen
    ' This program will reflect the opposite of the state of
    ' SW1(RA3) on DS1(RC0) on the Microchip PIC Low Pin Count Demo
    ' Board. Notice that because SW1 is normally High the state is
    ' inverted and LED (DS1) turns off if SW1 is pressed.


    #chip   16f690    ' declare the target Device

    #Define SW1 PORTA.3
    #Define DS1 PORTC.0

    DIR DS1 Out
    DIR SW1 In

    Do
      ' set the Bit DS1 to equal the Bit SW1
      SetWith( DS1, FnEquBIT( SW1 ) )
    Loop
    END
```

<span class="strong">**See Also
<a href="bitwise_operations_overview" class="link" title="Bitwise Operations Overview">Bitwise Operations Overview</a>**</span>
and <span
class="strong">**<a href="conditions" class="link" title="Conditions">Conditions</a>**</span>

</div>
