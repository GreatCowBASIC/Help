<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_glcdtimedelay"></span>GLCDTimeDelay

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    GLCDTime
```

<span class="strong">**Explanation:**</span>

This will call the delay routine that delays data transmissions. By
default this is set to `20`, which equate to `20 us`. `GLCDTimeDelay`
default of `20us` is for 32Mhz support. The can be reduced for slower
chip speeds by change the constant `ST7920WriteDelay`.

<span class="strong">**Example usage:**</span>

``` screen
    GLCDTime                       'call the delay routine
    #define ST7920WriteDelay 1     'set the delay to 1 us
```

</div>
