<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="lcdhex"></span>LCDHex

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    LCDHex value

    LCDHex value, LeadingZeroActive
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The LCDHex will display the byte value as a 1 or 2 character HEX string.

`value` is a byte value from 0 to 255.

`LeadingZeroActive` is a constant or byte value of 2.

<span class="strong">**Example :**</span>

``` programlisting
    ;Set chip model required:
    #chip mega328p, 16
    ;Setup LCD Parameters
    #define LCD_IO 4
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_NO_RW
    #define LCD_Speed MEDIUM 'FAST IS OK ON ARDUINO UNO R3

    'Change as necessary
    #define LCD_RS PortC.0
    #define LCD_Enable PortC.1
    #define LCD_DB4 PortC.2
    #define LCD_DB5 PortC.3
    #define LCD_DB6 PortC.4
    #define LCD_DB7 PortC.5

    '  #chip 16f877a, 8
    '  ;Setup LCD Parameters
    '  #define LCD_IO 4
    '  #define LCD_NO_RW
    '  #define LCD_Speed fast 'FAST IS OK ON 16f877a
    '
    '  ;Change as necessary
    '  #define LCD_RS PortB.2
    '  #define LCD_Enable PortB.3
    '  #define LCD_DB4 PortB.4
    '  #define LCD_DB5 PortB.5
    '  #define LCD_DB6 PortB.6
    '  #define LCD_DB7 PortB.7

    'Program Start
    DO Forever
       CLS
       WAIT 2 s
       PRINT "Test LCDHex "
       wait 3 s
       CLS
       wait 1 s

       for bv = 0 to 255
          locate 0,0
          Print "DEC " : Print BV
          locate 1,0
          Print "HEX "
          LCDHex BV, LeadingZeroActive ; dislay leading Zero          ' <<< the LCDHex instruction
        ' LCDHex BV         ; do not display leading zero
          wait 1 s
       next
       CLS
       wait 1 s
       Print "END TEST"
    LOOP
```

<span class="strong">**Key line:**</span>
`LCDHex BV, LeadingZeroActive` — displays `BV` as a 2-digit hex string
with a leading zero when needed; the commented-out `LCDHex BV` line
below shows the shorter 1-or-2-digit form without the leading zero.

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcdhome" class="link" title="LCDHome">LCDHome</a> — related
    command in the same category
-   <a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a> — related
    command in the same category

</div>

</div>
