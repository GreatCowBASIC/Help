<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_float"></span>\#Option Float

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option Float 1
```

This option enables float support in the user program.

This option ensures that all advanced variables are permitted in the
user program.

<span class="strong">**Options:**</span>

There are four bitwise settings for the different tpye of advanced
variables, as follows:

1 = singles 2 = doubles 4 = longint 8 = uLongINT

<span class="strong">**Example 1:**</span>

``` screen
    'Set chip model
    #chip 16f877a

    'Example command
    #option Float 1   // Enable Single 1 = 1

    dim myuserflag as single

    myuserflag = 123.456
```

<span class="strong">**Example 2:**</span>

``` screen
    'Set chip model
    #chip 16f877a

    'Example command
    #option Float 3   // Enable Single and Double 1 + 2 = 3

    dim myuserflag as single

    myuserflag = 123.456
```

<span class="strong">**For more help, see**</span>
<a href="variable_lifecycle" class="link" title="Variable Lifecycle">Variable Lifecycle</a>

</div>
