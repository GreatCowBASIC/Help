<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_keypaddata"></span>KeypadData

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    var = KeypadData
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This function will return a value corresponding to the key that is
pressed on the keypad. Note that if two or more keys are pressed, then
only one value will be returned. `var` can have one of the following
values:

<div class="informaltable">

| <span class="strong">**Value**</span> | <span class="strong">**Constant Name**</span> | <span class="strong">**Key Pressed**</span> |
|:-------------------------------------:|:---------------------------------------------:|:-------------------------------------------:|
|                   0                   |                                               |                      0                      |
|                   1                   |                                               |                      1                      |
|                   2                   |                                               |                      2                      |
|                   3                   |                                               |                      3                      |
|                   4                   |                                               |                      4                      |
|                   5                   |                                               |                      5                      |
|                   6                   |                                               |                      6                      |
|                   7                   |                                               |                      7                      |
|                   8                   |                                               |                      8                      |
|                   9                   |                                               |                      9                      |
|                  10                   |                    KEY\_A                     |                      A                      |
|                  11                   |                    KEY\_B                     |                      B                      |
|                  12                   |                    KEY\_C                     |                      C                      |
|                  13                   |                    KEY\_D                     |                      D                      |
|                  14                   |                   KEY\_STAR                   |             Asterisk/Star (\*)              |
|                  15                   |                   KEY\_HASH                   |                  Hash (\#)                  |
|                  255                  |                   KEY\_NONE                   |                    None                     |

</div>

<span class="strong">**Example:**</span>

``` screen
    'Program to show the value of the last pressed key on the LCD
    #chip 18F4550, 20

    'LCD connection settings
    #define LCD_IO 4
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_DB4 PORTD.4
    #define LCD_DB5 PORTD.5
    #define LCD_DB6 PORTD.6
    #define LCD_DB7 PORTD.7
    #define LCD_RS PORTD.0
    #define LCD_RW PORTD.1
    #define LCD_Enable PORTD.2

    'Keypad connection settings
    #define KeypadPort PORTB

    'Main loop
    Do
        'Get key
        Temp = KeypadData

        'If a key is pressed, then display it
        If Temp <> KEY_NONE Then
            CLS
            Print Temp
            Wait 100 ms
        End If
    Loop
```

<span class="strong">**For more help, see**</span>
<a href="_keypad_overview.html" class="link" title="Keypad Overview">Keypad Overview</a>

</div>
