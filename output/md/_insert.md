<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_insert"></span>\#insert

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #insert filename
```

<span class="strong">**Explanation:**</span>

`#insert` tells Great Cow BASIC to open up another file, read all of the
subroutines and constants from it, and then copy them into the current
program at the specific line where the \#insert directive is located.

There are two forms of include; absolute and relative.

Absolute is used to refer to files in the `..\GreatCowBASIC\include`
directory. The name of the file is specified in between &lt; and &gt;
symbols. For instance, to include the file `toolchain.il`, the directive
is:

``` screen
    #insert <"toolchain.il">
```

Relative is used to read files in the same folder as the currently
selected program. Filenames are given enclosed in quotation marks, such
as where `mycode.h` is the name of the file that is to be read.

``` screen
    #insert "toolchain.il"
```

<span class="strong">**Difference from \#include:**</span>

This is very different from \#include.   With \#include you can organize
constant, method and macro definitions and then use \#include directive
to add them to any source file.   Include files are also useful for
incorporating declarations of external variables and complex data types.
The types may be defined and named only once in an include file created
for that purpose. The compiler will optimise the include files to
determine the best order/location in your program.

Using \#insert you are determining the location of the code segment.  
It will be inserted exactly where you specify.   The optimisation will
only be applied to any methods that you insert but the rest of the code
essentially exits at the point of insertion.

<span class="strong">**\#Insert does not support Conversion:**</span>

There is no conversion of the inserted file.  For conversion use
\#Include.  

If you need to convert a file from an external source then see the
Converters section of the Help.

<span class="strong">**Usage Notes:**</span>

The file must exist. An error message is issued if not found.   When an
error is encountered in the inserted file the error line number is in
the format of xxxxyyyy.   Where xxxx is the code line number in the user
program and the yyyy is the the line number in the inserted file.

An example error message.  Where the source insert instruction is on
line 6 and the error in the inserted file is on line 4.

``` screen
    An error has been found:
     insertexample.gcb (60004): Error: Syntax Error
    The message has been logged to the file Errors.txt.
```

</div>
