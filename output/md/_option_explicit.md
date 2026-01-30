<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_explicit"></span>\#Option Explicit

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option explicit
```

This option ensures that all variables are dimensioned in the user
program. The scope is the user code only and no other code space like .h
or include files.

`#option explicit` requires all variables,including bytes, in the user
program to be defined.

Variables can be defined and not used within your user program. Unused
variables will not allocate memory.

<span class="strong">**Introduction:**</span>

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16f877a

    'Example command
    #option explicit

    dim myuserflag as byte

    myuserflag = true
```

<span class="strong">**For more help, see**</span>
<a href="variable_lifecycle" class="link" title="Variable Lifecycle">Variable Lifecycle</a>

</div>
