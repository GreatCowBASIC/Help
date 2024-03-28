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
  
`#UNDEFINE` Undefines a symbol previously defined with \#DEFINE.

Can be used to ensure that a symbol has a limited lifespan and does not
conflict with a similar macro definition that may be defined later in
the source code.

(Note: \#UNDEFINE should not be used to undefine variable or function
names used in the current program. The names are needed internally by
the compiler and removing them can cause strange and unexpected
results.)  
  

<span class="strong">**See Also**</span>
<a href="constants" class="link" title="Constants">Defines</a>

</div>
