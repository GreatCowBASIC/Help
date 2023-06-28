<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_glcdtransaction"></span>GLCDTransaction

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    GLCD_Open_PageTransaction
      ....
        additional number of other GLCD methods
      ....
    GLCD_Close_PageTransaction
```

<span class="strong">**Explanation:**</span>

To make the operation of GLCD seamless - specific library supports
GLCDTransaction.   GLCDTransaction automatically manages the methods to
update the GLCD display via a RAM memory buffer, where this buffer can
be small relative to the size of the total number of GLCD pixels.

The process of GLCDtransaction sends GLCD commands to the GLCD display
on a page and page basis.   Each page is the size of the buffer and for
a large GLCD display the number of pages may be equivilent to the
numbers of pixels high (height).

GLCDTransaction simplies the operation by ensure the buffer is setup
correctly, handles the GLCD appropiately, handles the sending of the
buffer and then close out the update to the display.

To use GLCDTransaction use the followng methods.

``` screen
    GLCD_Open_PageTransaction
      ....
      additional number of other GLCD methods
      ....
    GLCD_Close_PageTransaction
```

It recommended to use GLCDTransactions at all times when using the
e-Paper libraries.   Other GLCD libraries support GLCDTransaction to
reduce the memory requirement.  

Thes GLCDTransactions methods remove the complexity of the GLCD display
update process when RAM within the microcontroller is limited.

When using GLCDTransaction you must commence with
GLCD\_Open\_PageTransaction then a series of GLCD commands and then
terminate with GLCD\_Close\_PageTransaction.

<span class="strong">**GLCDTransaction Insight**</span>: When using
GLCDtransactions the number of buffer pages is probably be greater then
1 (unless using the SRAM option), so the process of incrementing
variables and calls to non-GLCD methods must be considered carefully.
The transaction process will increment variables and call non-GLCD
methods the same number of times as the number of pages. Therefore,
design GLCDTransaction operations with this is mind.

<span class="strong">**SRAM as the display buffer**</span>

To improve memory usage the e-paper the e-Paper libraries support the
use of SRAM. SRAM can be used as an alternative to the microcontrollers
RAM. Using SRAM does have a small performance impact but does free up
the critical resource of the microcontroller RAM. The use of SRAM within
the e-paper library is transparent to the user. To use SRAM as the
e-paper buffer you will need to set-up the SRAM library. See the SRAM
library for more details on SRAM usage.

When using SRAM for the e-paper buffer it is still remcommend to use
GLCDTransaction as this ensure the SRAM buffer is correctly initialised.

<span class="strong">**Optional GLCD\_Open\_Transaction
parameters**</span>

<span class="strong">**Syntax:**</span>

``` screen
    GLCD_Open_PageTransaction ( low_page, high_page )
```

<span class="strong">**Explanation:**</span>

You can optionally pass `GLCD_Open_PageTransaction` two parmeters. The
parameters will constrain the GLCD display update process to the
specific pages.

This can be used when only updating a potion of the screen to improve
performance.

</div>
