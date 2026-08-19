<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="keypadraw"></span>KeypadRaw

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    largevar = KeypadRaw
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This function will return a 16 bit value, in which each bit corresponds
to a key on the keypad. If the key is pressed its bit will hold 1, and
if it is released its bit will contain a 0.

This table shows the key that each bit corresponds to:

<div class="informaltable">

| <span class="strong">**Bit**</span> | <span class="strong">**Key Position (row, col)**</span> | <span class="strong">**Common Key Symbol**</span> |
|:-----------------------------------:|:-------------------------------------------------------:|:-------------------------------------------------:|
|                 15                  |                           1,1                           |                         1                         |
|                 14                  |                           1,2                           |                         2                         |
|                 13                  |                           1,3                           |                         3                         |
|                 12                  |                           1,4                           |                         A                         |
|                 11                  |                           2,1                           |                         4                         |
|                 10                  |                           2,2                           |                         5                         |
|                  9                  |                           2,3                           |                         6                         |
|                  8                  |                           2,4                           |                         B                         |
|                  7                  |                           3,1                           |                         7                         |
|                  6                  |                           3,2                           |                         8                         |
|                  5                  |                           3,3                           |                         9                         |
|                  4                  |                           3,4                           |                         C                         |
|                  3                  |                           4,1                           |                        \*                         |
|                  2                  |                           4,2                           |                         0                         |
|                  1                  |                           4,3                           |                        \#                         |
|                  0                  |                           4,4                           |                         D                         |

</div>

<span class="strong">**Example:**</span>

``` screen
    'Program to show the keypad status using LEDs
    #chip 16F877A, 20

    'Keypad connection settings
    #define KeypadPort PORTB

    'LEDs
    #define LED1 PORTC
    #define LED2 PORTD
    Dir LED1 Out
    Dir LED2 Out

    'Declare a 16 bit variable for the key value
    Dim KeyStatus As Word

    'Main loop
    Do
        'Get key
        KeyStatus = KeypadRaw

        'Display
        LED1 = KeyStatus_H 'High Byte
        LED2 = KeyStatus 'Low Byte
    Loop
```

<span class="strong">**For more help, see**</span>
<a href="keypad_overview" class="link" title="Keypad Overview">Keypad Overview</a>

</div>
