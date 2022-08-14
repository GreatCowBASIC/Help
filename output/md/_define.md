<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_define"></span>\#DEFINE

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #DEFINE SYMBOL body
```

<span class="strong">**Explanation:**</span>  
  
`#DEFINE` allows to declare text-based preprocessor symbols.  

Once the compiler has seen a \#DEFINE, it will start replacing further
occurrences of symbol with body.    Body may be empty.   The expansion
is done recursively, until there is nothing more to expand and the
compiler can continue analyzing the resulting code.

\#UNDEFINE can be used to make the compiler forget about a \#DEFINE.

  
  
The compiler replaces a SYMBOL with the value, it then searches the line
for constants again and will make any more replacements needed.   It
will do this up to 100 times on a line, then it will stop replacing and
show an error.   The limitation of 100 iteractions is to prevent
something like "\#DEFINE Const\_A Const\_B" and then "\#DEFINE Const\_B
Const\_A" from causing an infinite loop in the compiler.

  
  

<span class="strong">**See Also**</span>
<a href="constants" class="link" title="Constants">DEFINEs</a>

</div>
