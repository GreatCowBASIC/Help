<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="sqrt"></span>Sqrt

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    word_variable = sqrt ( word )
```

<span class="strong">**Explanation:**</span>

A square root routine for GCBASIC. The function only involves bit
shifting, addition and subtraction, which makes it fast and efficient.

This method required a word variable as the input and a word variable as
the output. The method will handle arguments of up to 4294.

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers, required MATHS.H include file.

<span class="strong">**Example:**</span>

``` screen
    ;Demo: Show the first 100 square roots to 2 decimal places.
    ;This uses the maths.h include file.

    ;----- Configuration

    #chip 16F88, 8                  ;PIC16F88 running at 8 MHz
    #config mclr=off                ;reset handled internally

    #include <maths.h>              ;required maths.h

    ;----- Constants

    #define LCD_IO      4           ;4-bit mode
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_RS      PortB.2     ;pin 8 is LCD Register Select
    #define LCD_Enable  PortB.3     ;pin 9 is LCD Enable
    #define LCD_DB4     PortB.4     ;DB4 on pin 10
    #define LCD_DB5     PortB.5     ;DB5 on pin 11
    #define LCD_DB6     PortB.6     ;DB6 on pin 12
    #define LCD_DB7     PortB.7     ;DB7 on pin 13
    #define LCD_NO_RW   1           ;ground the RW line on LCD

    ;----- Variables

    dim length as byte
    dim i as word
    dim valStr, outStr as string

    ;----- Program

    dir PortB out       ;all outputs to the LCD

    for i = 0 to 100   ;print first 100 square roots
      cls
      print "sqrt("
      print i
      print ")="

      valStr = str(sqrt(i))         ;format decimal nicely
      length = len(valStr)

      select case length
       case 1:
          outStr = "0.00"           ;zero case
       case 3:
          outStr = left(valStr,1)+ "."+right(valStr,2)
        case 4:
          outStr = left(valStr,2)+ "."+right(valStr,2)
        case 5:
          outStr = left(valStr,3)+ "."+right(valStr,2)
      end select

      print outStr                  ;display results
      wait 2 S
    next i
```

<span class="strong">**Supported in &lt;MATHS.H&gt;**</span>

</div>
