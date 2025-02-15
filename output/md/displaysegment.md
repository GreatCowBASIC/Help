<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="displaysegment"></span>DisplaySegment

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    DisplayValue (display, data)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command will display the given value on a seven segment LED
display.

`display` is the number of the display to use. Up to 4 digits.  

`data` is the value between 0 and 255. Where <span
class="emphasis">*data*</span> is the representation of the segments to
be set.

<span class="strong">**Example**</span>

``` screen
      'This program will count from 10 to 0 then fire the rocket!
      'The method DisplaySegment 1, smallTCharacter.  Sets the 7 segment to the value of 120, see the constant, 120 equates to a small t.
      ; ----- Configuration

        #chip 16F690, 4

      ; ----- Define Hardware settings
        Dir PORTC Out
        DIR PORTA.5 out
        DIR PORTA.4 out
        DIR PORTA.0 out
        DIR PORTA.1 out
        DIR PORTA.2 in
        DIR PORTB.7 out
      ; ----- Constants
        ; You need to specify the port settings
        #define DISP_SEG_A PORTC.0
        #define DISP_SEG_B PORTC.1
        #define DISP_SEG_C PORTC.2
        #define DISP_SEG_D PORTC.3
        #define DISP_SEG_E PORTC.4
        #define DISP_SEG_F PORTC.5
        #define DISP_SEG_G PORTC.6
        #define DECPNT     PORTC.7
        #define DISP_SEL_1 PORTA.5
        #define DISP_SEL_2 PORTA.4
        #define DISP_SEL_3 PORTA.1
        #define DISP_SEL_4 PORTA.0

        #define smallTCharacter 120 'raw character for 't' on 7 segment.

        #define sw1 PORTA.2

        #define firingPort PORTB.7

      ; ----- Variables
        CountDownValue = 10

      ; ----- Main body of program commences here.
      DECPNT = 1 'Decimal Point off

        Main:
          ' Push number to 7 Segment Display
        if sw1 = 0 then goto Countdown

         num2 = 1
         num3 = 0
         cnt = 5
         gosub display

      goto main

        Countdown:


          num2 = CountDownValue/10
          num3 = CountDownValue%10
          cnt = 60

          gosub display

          If sw1 = 0 then goto hld

          if CountDownValue = 0 then
              firingPort = 1
              cnt = 200
              gosub dispfire
              firingPort = 0
             CountDownValue = 10
             goto main
          end if

          CountDownValue = CountDownValue - 1

        goto Countdown


        display:
         Repeat cnt
                DisplaySegment 1, smallTCharacter
                wait 5 ms
                Displaychar 2, "-"
                DisplayValue 3, Num2
                wait 5 ms
                DisplayValue 4, Num3
                wait 5 ms
         end Repeat

         return

       hld:
        if sw1 = 0 then goto hld
        cnt = 5
        gosub Display
        if sw1 = 1 then goto hld
        goto countdown

       DispFire:
        Repeat cnt

                Displaychar 1, "F"
                wait 5 ms
                Displaychar 2, "i"
                wait 5 ms
                Displaychar 3, "r"
                wait 5 ms
                Displaychar 4, "E"
                wait 5 ms
        End Repeat
       return

      end
```

<span class="strong">**Also, see**</span>
<a href="7_segment_displays_overview" class="link" title="7 Segment Displays Overview">7 Segment Display Overview</a>,
<a href="displaychar" class="link" title="DisplayChar">DisplayChar</a>

</div>
