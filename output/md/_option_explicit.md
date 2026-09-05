<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_explicit"></span>\#Option Explicit

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    #option explicit
```

This option ensures that all variables are dimensioned in the user
program. The scope is the user code only, and no other code space, like
`.h` or include files.

`#option explicit` requires all variables, including bytes, in the user
program to be defined.

Variables can be defined and not used within your user program. Unused
variables will not allocate memory.

<span class="strong">**Example:**</span>

``` programlisting
    'Set chip model
    #chip 16f877a

    'Example command
    #option explicit

    dim myuserflag as byte

    myuserflag = true          ' <<< a Dimensioned variable required by #option explicit
```

<span class="strong">**Key line:**</span> `myuserflag = true` — this
assignment is only legal because `myuserflag` was explicitly Dimensioned
above; with `#option explicit` in effect, assigning to an undeclared
name anywhere in the user program raises a compile-time error instead of
silently creating an implicit variable.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="variable_lifecycle" class="link" title="Variable Lifecycle">Variable Lifecycle</a> — how
    declared variables are allocated and used
-   <a href="dim" class="link" title="Dim">Dim</a> — the command
    used to explicitly declare variables

</div>

</div>
