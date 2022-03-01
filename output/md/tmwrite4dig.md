<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="tmwrite4dig"></span>TMWrite4Dig

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    TMWrite4Dig (dig1, dig2, dig3, dig4  [, Brightness ],  Colon ]  ] )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

Command defines each digit (left to right) as 0 to 9 OR 0x00 to 0x0F
(15). Additionally 0x10 (16) is a blank, 0x11 (17) is a minus sign, 0x12
(18) is a degree sign, 0x13 (19) is a bracket and 0x14 (20) is a
question mark.

<span class="emphasis">*Brightness*</span> set the brightness (8-15).
<span class="emphasis">*Colon*</span> turns the colon (only on digit 2)
to off (0) or on (1).  
  
  
  
  
  

</div>
