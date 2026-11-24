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

`Condition` has the same syntax as the condition in a normal GCBASIC If
command. The only difference is that it uses constants instead of
variables, and does not use "then".

<span class="strong">**Example:**</span>

``` programlisting
    'This program will set the constant to true only if NOT a PIC family
    #chip 16F88, 8

    #ifnot ChipFamily = 14          ' <<< compiling the block only when the chip is NOT PIC family 14

      #define myConstant True

    #endif
```

<span class="strong">**Key line:**</span>
`#ifnot ChipFamily = 14` — `ChipFamily = 14` identifies the mid-range
PIC family the 16F88 belongs to, so on this chip the condition is true
and the block is NOT compiled; `myConstant` would only be defined when
compiling for a chip outside PIC family 14.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="if" class="link" title="If">#if</a> — the
    positive-condition counterpart to this directive
-   <a href="_ifdef" class="link" title="#ifdef">#ifdef</a> — testing
    whether a constant is defined, rather than its value

</div>

</div>
