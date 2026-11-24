<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="fnnotbit"></span>FnNotBit

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    BitOut = FnNotBit(BitIn)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`FnNotBit` is the bitwise equivalent of the logical NOT operator. Where
BitOut will be the Logical Compliment of BitIn.

`FnNotBit` will return the Logic Compliment State of BitIn. It is
equivalent to the 'C' statement as shown below.

``` screen
    BitOut != BitIn
```

`FnNotBit` can be used to assign a non bit variable to a bit variable.
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
    ' This program will flash the LED - DS1(RC0) on the Microchip PIC Low Pin Count Demo Board.

    #chip   16f690    ' declare the target Device

    #Define DS1 PORTC.0

    DIR DS1 Out

    Do
      ' set the Bit DS1 to the Compliment of DS1
      SetWith( DS1, FnNotBIT( DS1 ) )
      wait 500 ms
    Loop

    END
```

<span class="strong">**See Also
<a href="bitwise_operations_overview" class="link" title="Bitwise Operations Overview">Bitwise Operations Overview</a>**</span>
and <span
class="strong">**<a href="conditions" class="link" title="Conditions">Conditions</a>**</span>

</div>
