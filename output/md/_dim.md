<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_dim"></span>Dim

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    For Variables > 1 byte:
    Dim variable[, variable2 [, variable3]] [As type] [Alias othervar [, othervar2]]

    'or

    Dim variable[, variable2 [, variable3]] [As type] [At location]


    For Arrays:
    Dim array(size) [As type] [At location]
```

<span class="strong">**Explanation:**</span>

Dim has two uses:  It can be used to define 1) variables of many types
and 2) arrays.

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

The `Dim` variable command is used to instruct GCBASIC to allocate
variables or to create alternate names for existing variables (using
Alias) or to create variables at a specific memory location (using At).

The `Dim array` command also sets up array variables. The maximum array
size is determined by the parameter `size` is dynamically allocated by
the compiler and depends on the specific chip used, as well as the
complexity of the program.

The limit on array size varies dependent on the chip type. See the <span
class="strong">**Maximum Array Size**</span> section in
<a href="" class="link">Arrays</a> for more information.

`type` specifies the type of variable that is to be created. Different
variable types can hold values over different ranges, and use different
amounts of RAM. See the <a href="" class="link">Variables</a> article
for more information.

When multiple variables are included on the one line, GCBASIC will set
them all to the type that is specified at the end of the line. If there
is no type specified, then GCBASIC will make the variable a byte.

`Alias` creates a variable using the same memory location as one or more
other variables.   It is mainly used internally in GCBASIC to treat
system variables as a word.   For example, this command is used to
create a word variable, made up from the two memory locations used to
store the result of an A/D conversion.  \`Alias\` is mutually exclusive
to `At` and therefore `Alias` and `At` on the same declaration line will
cause an compiler error.

`AT` a variable can be placed at a specific location in the data memory
of the chip using the At option.   \`<span
class="emphasis">*location*</span>\` will be used whether it is a valid
location or not, but a warning will be generated if GCBASIC has already
allocated the memory, or if the memory does not appear to be valid.
  This can be used for peripherals that have multi byte buffers in
RAM.  \`At\` is mutually exclusive to `Alias` and therefore `At` and
`Alias` on the same declaration line will cause an compiler error.

``` screen
    Dim ADResult As Word Alias ADRESH, ADRESL
```

<span class="strong">**Example:**</span>

``` screen
    'This program will set up a array of ten bytes and a word variable

    dim DataList(10)
    dim Reading as word

    Reading = 21978
    DataList(1) = 15

    dim stringvariable as string
```

<span class="strong">**For more help,
see:  **</span><a href="_serprint.html" class="link" title="SerPrint">SerPrint</a>
articles as these articales show how to use Dim to create string
variables and <a href="" class="link">Variables</a> for more details in
creating and managing strings lengths.

</div>
