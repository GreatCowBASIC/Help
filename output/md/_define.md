<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_define"></span>\#define

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #define Find Replace
```

<span class="strong">**Explanation:**</span>  
  
`#define` will search through the program for `Find`, and replace it
with the value given for `Replace`.  
  
The compiler replaces a constant with the value, it then searches the
line for constants again and will make any more replacements needed.  
It will do this up to 100 times on a line, then it will stop replacing
and show an error.   The limitation of 100 iteractions is to prevent
something like "\#define Const\_A Const\_B" and then "\#define Const\_B
Const\_A" from causing an infinite loop in the compiler.

  
  

<span class="strong">**See Also**</span>
<a href="constants" class="link" title="Constants">Defines</a>

</div>
