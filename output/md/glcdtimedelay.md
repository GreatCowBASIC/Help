<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="glcdtimedelay"></span>GLCDTimeDelay

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    GLCDTime
```

<span class="strong">**Explanation:**</span>

This will call the delay routine that delays data transmissions. By
default this is set to `20`, which equate to `20 us`. `GLCDTimeDelay`
default of `20us` is for 32Mhz support. The can be reduced for slower
chip speeds by change the constant `ST7920WriteDelay`.

<span class="strong">**Example usage:**</span>

``` programlisting
    GLCDTime                       'call the delay routine          ' <<< the GLCDTime instruction
    #define ST7920WriteDelay 1     'set the delay to 1 us
```

<span class="strong">**Key line:**</span> `GLCDTime` — inserts the write
delay needed between GLCD data transmissions; the delay length comes
from the `ST7920WriteDelay` constant, which defaults to 20 (20 us, tuned
for a 32 MHz chip) and should be reduced on slower chips such as the 1
us shown here.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="glcdtransaction" class="link" title="GLCDTransaction">GLCDTransaction</a> — related
    command in the same category
-   <a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a> — related
    command in the same category

</div>

</div>
