<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_implementing_a_method_with_a_pin_name_as_a_parameter"></span>Implementing a method with a Pin name as a parameter

</div>

</div>

</div>

<span class="strong">**Introduction**</span>

A constant such as a Pin name cannot be passed to a sub routine or a
function. This is a constraint of GCBASIC.

A macro can be used to implement a method of passing a constant to
reusable code section.

The example shown below implements a button press routine and takes an
input port constant and prints the result on an LCD display.

<span class="strong">**Note:**</span> A macro will use more program
memory as the macro will be compiled as inline code. Therefore, for
every use of the macro will use additional program memory - the same
amount of program memory for each call to the macro.

<span class="strong">**Demonstration Program:**</span>

``` screen
    #chip 16F877a, 16
    #define Button PORTC.1    ' Switch on PIN 14 via 10K pullup resistor
    DIR Button In
    wait 1 sec

    'USART settings
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING

    ;======== MAIN PROGRAM LOOP ================
    HSerPrint "Button Test"
    HSerPrintCRLF 2
    Do
       Test_button ( button )
    Loop
    ;==========================================

    Macro Test_button (Button)
       if Button = ON then
          wait 10 ms          'debounce
          ButtonCount = 0


           Do While Button = On
               Wait 10 ms
               ButtonCount += 1
           Loop


           if ButtonCount > 5  then
               if ButtonCount > 50 then   'Long push
                   hserprint "Long push"
               else                       'Short push
                   hserprint "Short push"
               end if
               HSerPrintCRLF
           end if
           wait 1 s
       end if
    End Macro
```

Also see
<a href="_macros_overview.html" class="link" title="Macros Overview">Macros Overview</a>

</div>
