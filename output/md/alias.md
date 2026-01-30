<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="alias"></span>Alias

</div>

</div>

</div>

`Alias` creates a variable that shares the same memory location as
another variable:

``` screen
    Dim ADResult As Word Alias ADRESH, ADRESL
```

`Alias` and `At` cannot be used together on the same declaration line.

`Alias` does not support `Bit` variables. For bit‑level aliasing, use
constants or `#Define` macros.

</div>
