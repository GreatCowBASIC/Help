<div class="section">

<div class="titlepage">

<div>

<div>

<span id="compiler_insights"></span>Compiler Insights
------------------------------------------------------

</div>

</div>

</div>

This section will provide some insights into what the compiler does

<span class="strong">**How does the compiler cope with read only
registers in the Chip Family 12 range?**</span>

Within this chip range the Option register is a write only register.
Reading the register is not permitted.

GCBASIC needs to update this when the user wants to change the
configuration - the Sleep process is an example of a user change.

The compiler handles this by the creation of the Option\_reg byte
variable. This byte is created by the compiler to manage the required
write process.

The Option\_reg variable is a cache that compiler will create if any
bits of option\_reg have been set manually.

If the user changes any of the bits in a program, then the compiler will
find any uses of the option instruction and insert a "movwf OPTION\_REG"
immediately before the option instruction to cache the value in the
buffer.

If Option\_reg bits aren’t set individually anywhere, then option\_reg
doesn’t get created, and nothing special is done with the option
instruction.

Essentially the compiler maintains a special variable and manages the
whole process without the user being aware.

<span class="strong">**How does the compiler cope with the TRIS register
in the 10f products?**</span>

The compiler ensures that a TRIS cache matches the actual TRIS register.
The TRIS cache is a byte variable called TRISIO. The TRISIO cache is
required as TRIS is a write-only register.

All ports default to input ( where all TRIS bits to 1) on reset.
Therefore, this is assumed to be the value 255.

TRISIO is updated when required by the user code and then used in the
writing to the correct register.

The example user code and the associated assembly shows TRISIO cache in
use. This method complies with datasheet.

User Code

``` literallayout
'set as input
dir gpio.0 in
gpio0State = gpio.0
'set as output this will require TRIS GPIO to be set using the TRISIO cache.
dir gpio.0 out
gpio.0 = 1
```

ASM

``` literallayout
;dir gpio.0 in
  bsf TRISIO,0
  movf  TRISIO,W
  tris  GPIO
;gpio0State = gpio.0
  clrf  GPIO0STATE
  btfsc GPIO,0
  incf  GPIO0STATE,F
;dir gpio.0 out
  bcf TRISIO,0
  movf  TRISIO,W
  tris  GPIO
;gpio.0 = 1
  bsf GPIO,0
```

Anywhere that an individual TRIS bit is set/cleared by change the port
direction, the bit in the cache is changed and then that gets written to
the TRIS register.

<span class="strong">**Forcing the ASM to contain comments**</span>

It may be useful to force comments into the ASM file. The verbose mode
of creating the ASM will include ALL the source program as comments but
it may be useful to have specific comments in the ASM to aid the
understanding of code or to support debugging.

To force an assembly comment use the following:

``` screen
    asm showdebug  `comment`
```

Where the `comment` will be placed into the ASM file.

Example.

The source file contains the following, where the comment text is
`OSCCON type is 100`

``` screen
    asm showdebug OSCCON type is 100
    OSCCON1 = 0x60
```

The generated assembly will be as following - this assumes verbose mode
is not selected.

``` screen
    INITSYS
    ;osccon type is 100
      movlw 96
      banksel OSCCON1
```

<span class="strong">**Constants, variables, subs and function and
labels**</span>

GCBASIC uses a single namespace. A namespace is the set of names used to
identify and refer to objects of various kinds.   In GCBASIC these can
be constants, variables, methods, and labels.  Wwhere a label is a true
label like the start of sub, function or macro.   A namespace ensures
that all of a given set of objects have unique names so that they can be
identified.   This organises constants, variables, methods, labels etc
into a single list - the single namespace.

The namespace includes all libraries and source GCBASIC source files.   
If using MPASM this expands to chip specific INF file.   If using PICAS
then all of the PICAS toolchain including non-chip specific files.
  There are changes already in place to resolve this issue for PICAS as
HEX and LINE are reserved with PICAS toolchain and these conflict with
GCBASIC methods.   These are automatically resolved by the GCBASIC
compiler.

So, given that a constants, variables, methods, labels etc are number,
the compiler does not know if that is a constant, a variable, a method,
or a call to a label. Some are use cases using a constant called
`NORMAL` follow.   `NORMAL` is defined as a constant with `0`.  

\#1. Code segment

``` screen
  #DEFINE NORMAL 0
  CALL Normal
```

The compiler will issue no error.   The compiler will assume the
following and will do as instructed.   Call normal - this calls normal
which has a value of 0

Resulting ASM

``` screen
  ;CALL Normal
  call 0
```

\#2. Code segment

``` screen
  #DEFINE NORMAL 0
  CALL Normal()
```

The compiler will issue no error.   The compiler will assume the
following and will do as instructed.   Call normal() - this calls normal
which has a value of 0

Resulting ASM

``` screen
    ;CALL Normal()
    call 0
```

\#3. Code segment

``` screen
  #DEFINE NORMAL 0
  Normal
```

The compiler will issue an error message.   The compiler will try to
resolve the constant normal to a sub but it cannot as it is a value of
0.

Resulting ASM

``` screen
    ;Normal
    0 ;?F1L8S0I8?
```

\#4. Code segment

``` screen
  #DEFINE NORMAL 0
  Normal()
```

The compiler will issue an error message.   The compiler will try to
resolve the constant normal to a sub but it cannot as it is a value of
0.

Resulting ASM

``` screen
    ;Normal()
    0() ;?F1L8S0I8?
```

\#5. Code segment

``` screen
  #DEFINE NORMAL 0
  Normal = 1
```

The compiler will issue an error message.   This tries to assign a value
to the object.

Resulting ASM

``` screen
  ;Normal = 1
  0 = 1
```

\#6. Code segment

``` screen
  #DEFINE NORMAL 0
  Goto normal
```

The compiler will not issue an error message.   The compiler will `goto`
(same for `jmp`) to the value of the object.

Resulting ASM

``` screen
    ;goto Normal
    goto 0
```

</div>
