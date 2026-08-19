<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="make_asm_make_hex_and_programming_operations_using_the_provided_linux_scripts"></span>Make ASM, Make HEX and Programming Operations using the provided Linux scripts

</div>

</div>

</div>

The scripts provided are intended to assist in the creation of the ASM
file ( from a GCBASIC source file ), creation of the HEX file ( also
from a GCBASIC source file ) and to support programming operations (
often called \`FLASH\`ing the microcontroller ).

<div class="informaltable">

| <span class="strong">**Script**</span> | <span class="strong">**Usage**</span>                                                                                                             | <span class="strong">**Example**</span> |
|:---------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------|
| `makeasm.sh`                           | To compile the GCBASIC source program to create the ASM.                                                                                          | `makeasm.sh sourcefile.gcb`             |
| `makehex.sh`                           | To compile and asseble the GCBASIC source program to create the ASM and a microcontroller specific HEX file.                                      | `makehex.sh sourcefile.gcb`             |
| `flash.sh`                             | To compile,asseble the GCBASIC source program to create the ASM and a microcontroller specific HEX file, and, then to program the microcontroller | `flash.sh sourcefile.gcb`               |

</div>

<span class="strong">**Examples**</span>

There are multiple constructs to run multiple programs on a single
command line.  The most common are ';' and '&&'

To run another command immadiately after running makehex.sh.  Use the
following:

``` screen
   makehex.sh sourcefile.gcb; anothercommand
```

To run another command only if makehex.sh does not exit with an error
such as a compiler error.  Use the following:

``` screen
   makehex.sh sourcefile.gcb && anothercommand
```

</div>
