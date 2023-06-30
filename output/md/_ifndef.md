<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_ifndef"></span>\#ifndef

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #ifndef Constant | Constant Value | Var(VariableName)
      ...
    [#else]
      ...
    #endif
```

<span class="strong">**Explanation:**</span>

The `#ifndef` directive is used to selectively enable sections of code.
It is the opposite of the `#ifdef` directive - it will delete code in
cases where `#ifdef` would leave it, and will leave code where `#ifdef`
would delete it.

<span class="strong">**See**</span> the
<a href="_ifdef" class="link" title="#ifdef">#ifdef</a> article
for more information.

</div>
