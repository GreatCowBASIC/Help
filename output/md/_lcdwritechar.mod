<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="lcdwritechar"></span>LCDWriteChar

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    LCDWriteChar char
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `LCDWriteChar` command will show the specified character on the LCD,
at the current cursor position.

`char` is the ASCII value of the character to show. On most LCDs,
characters 0 through 7 are user defined, and can be set using the
`LCDCreateChar` command.

<span class="strong">**Example :**</span>

``` screen
    'This program draws a smiling face character

    'Create an array to store the character until it is copied
    Dim CharArray(8)

    'Set the array to hold the character
    CharArray(1) = b'00011011'
    CharArray(2) = b'00011011'
    CharArray(3) = b'00000000'
    CharArray(4) = b'00000100'
    CharArray(5) = b'00000000'
    CharArray(6) = b'00010001'
    CharArray(7) = b'00010001'
    CharArray(8) = b'00001110'

    'Copy the character from the array to the LCD
    LCDCreateChar 0, CharArray()

    'Draw the custom character
    LCDWriteChar 0
```

<span class="strong">**For more help, see**</span>
<a href="lcdcreatechar" class="link" title="LCDCreateChar">LCDCreateChar</a>,
<a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
