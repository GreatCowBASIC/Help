<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="using_variables"></span>Using Variables

</div>

</div>

</div>

<span class="strong">**Explaination**</span>

Using and accessing bytes within word and long numbers etc may be
required when you are creating your solution. This can be done with some
ease.

<span class="strong">**Example 1:**</span>

You can access the bytes within word and longs variables using the
following as a guide using the Suffixes `_H`, `_U` and `_E`  

``` screen
    Dim workvariable as word
    workvariable = 21845
    Dim lowb as byte
    Dim highb as byte
    Dim upperb as byte
    Dim lastb as byte

    lowb = workvariable
    highb = workvariable_H
    upperb = workvariable_U
    lastb = workvariable_E
```

  
To further explain, where  

``` screen
    Dim rB as Byte
    Dim sW as Word
```

  
To extract the bytes from a WORD of 16 bits use the Suffix `_H`  

``` screen
    'To use the bits 7-0 [lower byte] in the Word variable sW
    rB = sW

    'For bits 15-8 [upper byte] in the Word variable sW, use sw_H
    rB = sW_H
```

  
To extract the bytes from a LONG of 32 bits use the Suffixes `_H`, `_U`
and `_E`, where  

``` screen
    Dim rB as Byte
    Dim tL as Long

    ‘ For bits 7-0 [lowest byte #0] in Long variable tL
    rB = tL

    ‘ For bits 15-8 [lower middle byte #1] in Long variable tL
    rB = tL_H

    ‘ For bits 23-16 [upper middle byte #2] in Long variable tL
    rB = tL_U

    ‘ For bits 31-24 [highest byte #3] in Long variable tL
    rB = tL_E
```

  
To extract nibbles from the variable `rB`  

``` screen
    lower_nibble = rB & 0x0F
    upper_nibble = (rB & 0xF0) / 16
```

  
  
<span class="strong">**Example 2:**</span>

Assigning values to Word and Long variables via the the Byte variable
(the Least Significant Byte \[.lsb\]) of the same Word and Long
variable.

Because a Long (or Word) variable and the Least Significant Byte, of the
variable, have the same variable assignments to specific byte elements
(\_e, \_u and \_h) assignment must be appropriate to the element.

The code below uses a Long variable but the same principle is used for a
Word.

Assigning two values, a byte and a word constant value, to the variable
tL to compare resulting impact on Long variable.

``` screen
    Dim tL as Long

    tL = 255  'All bits of the value 255 will reside in the lowest byte of the Long variable tL
    tL = 286   'This assignment will flow into tL_H where tL_H =1 and tl=30.
```

Assigning values to specific elements of a Long variable.

``` screen
    'Assign value to specific elements
    tL_E = 0xF7
    tL_U = 0xC5
    tL_H = 0xE3

    'is same as the following assignment, we show the use of casting for clarification only.
    [Long] tL = 0xF7C5E300   The lower byte (tL) is empty (zero).

    'or, treat the Long as a byte and assign a byte.
    [byte]tL = [byte]0xA4
```

Assigning values to the byte element of a long variable.

``` screen
    'This will assign the lowest byte with 0xA4 but this assignment will also clear the upper 3 byte elements of the long variable.
    tL = 0xA4

    'To assign the lowest byte
    tL = ( tL and 0xffffff00 ) + 0xA4  'Wwill preserve the upper bytes and ensure the lowest byte is assigned correctly.
```

A method to check a variable is assigned as expected is to use HserPrint
and HserPrint hex(), as follows:

``` screen
    ' HserPrint hex() only prints one byte so we need to handle the four elements
    HserPrint " Print tL _E, tL_U, tL_H & tL as hex"
    HserPrint hex (tL_E)
    HserPrint hex (tL_U)
    HserPrint hex (tL_H)
    HserPrint hex (tL)
    HserPrintCRLF
    HserPrint "Variable tL = "
    HserPrint tL
```

The user code above will result in an output as follows:

``` screen
    Print tL _E, tL_U, tL_H & tL as hexF7C5E3A4
    Variable tL = 4156941220
```

  
  

</div>
