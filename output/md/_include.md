<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_include"></span>\#include

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #include filename
```

<span class="strong">**Explanation:**</span>

`#include` tells GCBASIC to open up another file, read all of the
subroutines and constants from it, and then copy them into the current
program.

There are two forms of include; absolute and relative.

Absolute is used to refer to files in the `..\GCBASIC\include`
directory. The name of the file is specified in between &lt; and &gt;
symbols. For instance, to include the file `srf04.h`, the directive is:

``` screen
    #include <srf04.h>
```

Relative is used to read files in the same folder as the currently
selected program. Filenames are given enclosed in quotation marks, such
as where `mycode.h` is the name of the file that is to be read.

``` screen
    #include "mycode.h"
```

<span class="strong">**NOTES:**</span> It is not essential that the
include file name ends in .h - the important thing is that the name
given to GCBASIC is the exact name of the file to be included.

Those who are familiar with `#include` in assembly or C should bear in
mind that `#include` in GCBASIC works differently to `#include` in most
other languages - code is not inserted at the location of the
`#include`, but rather at the end of the current program.

</div>
