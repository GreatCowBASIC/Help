<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_undefine"></span>\#UNDEFINE

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #UNDEFINE existing-symbol
```

<span class="strong">**Explanation:**</span>  
  
`#UNDEFINE` undefines a symbol previously defined with `#DEFINE`.

It can be used to ensure that a symbol has a limited lifespan and does
not conflict with a similar macro definition that may be defined later
in the source code.

(Note: `#UNDEFINE` should not be used to undefine variable or function
names used in the current program. The names are needed internally by
the compiler, and removing them can cause strange and unexpected
results.)  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="constants" class="link" title="Constants">Constants</a> — the
    general constants/precedence reference
-   <a href="_define" class="link" title="#DEFINE">#DEFINE</a> — creating
    the constant this directive removes

</div>

</div>
