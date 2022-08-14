<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_ifnot"></span>\#ifnot

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #ifnot Condition
      ...
    [#else]
      ...
    #endif
```

<span class="strong">**Explanation:**</span>

The `#ifnot` directive is used to prevent a section of code from
compiling unless `Condition` is false.

`Condition` has the same syntax as the condition in a normal Great Cow
BASIC if command. The only difference is that it uses constants instead
of variables and does not use "then".

<span class="strong">**Example:**</span>

``` screen
    'This program will set the constant to true only if NOT a PIC family
    #chip 16F88, 8

    #ifnot ChipFamily = 14

      #define myConstant True

    #endif
```

</div>
