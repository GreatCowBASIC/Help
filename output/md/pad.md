<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="pad"></span>Pad

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    out_string = Pad( string_variable, byte_value_of_the_new_length, pad_character)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Pad` function creates a string of a specific length, extended with
a specific character.

The length of the string is specified by the second parameter. The
character used to pad the string is specified by the third parameter.

A typical use is to pad a string to a fixed width before displaying it
on an LCD, so that shorter strings do not leave stale characters from a
previous, longer string on screen.

<span class="strong">**Example:**</span>

``` programlisting
 'Set chip model
    #chip 16f877a


    DIR PORTA 0x03


    ' make port C as output
    Dir PortC 0x0


    'Defines (Constants)
    #define LCD_SPEED slow
    #define LCD_IO 4
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_NO_RW
    #define LCD_Enable PORTc.0
    #define LCD_RS PORTc.1
    #define LCD_DB4 PORTa.5
    #define LCD_DB5 PORTa.4
    #define LCD_DB6 PORTa.3
    #define LCD_DB7 PORTa.2
    '''--------------------------------------------
    '''-------End of board-specific settings-------
    '''--------------------------------------------


    '''DEMO for pad strings to a length
    '''1st character of a given string.
    '''if no string is given, blanks are used


    ; ---- variables
    'Define the string
    Dim TestData As String * 16
    TestData = "Location"

    'show results on LCD-Display
    cls
    Print Pad ( TestData, 16, "*" )          ' <<< the Pad instruction, padded with a visible character
    Locate 1,0
    Print Pad ( TestData, 16, )


    end
```

<span class="strong">**Key line:**</span>
`Pad ( TestData, 16, "*" )` — extends `"Location"` out to 16 characters
with trailing asterisks, so the padded text always occupies the same
width on the LCD regardless of the source string’s length.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="left" class="link" title="Left">Left</a> — extracting
    a fixed-width prefix instead of padding out to one
-   <a href="asc" class="link" title="Asc">Asc</a> — related
    command in the same category

</div>

</div>
