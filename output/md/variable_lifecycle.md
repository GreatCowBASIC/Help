<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="variable_lifecycle"></span>Variable Lifecycle

</div>

</div>

</div>

<span class="strong">**Explanation**</span>

Within GCBASIC you can use variables. This section details the Variable
Lifecycle when using variables.

<span class="strong">**Variable rules - with \#Option Explicit**</span>

As shown below in the rule without \#Option Explicit but ALL variables
MUST be defined including bytes variables.

<span class="strong">**Variable rules - without \#Option
Explicit**</span>

Scope - every variable is global from an addressing/usage point of view.

Once a variable is defined, and then the variable it is used the
variable persists.

Aliasing - You can reduce memory usage by Aliasing. Remember all
variables are global so you must be careful.

If there are two variables with the same name, they will be placed in
the same memory location. You can reuse the same variable name in two
subs/functions, and you can make the variables different types, but
writing to the variable in one sub will overwrite the value from the
other sub, see the example below.

As a general guide define any shared variables near the start of the
program for easier readability.

All variables should be initialised with a desired initialisation value.
Do not assume the initialisation value is Zero.

Variables local to particular subroutines are not implemented.

<span class="strong">**Specific rules to spefic variable types**</span>

All variables are global. Bit variables defined in subs/function are
global.

Byte variables do not need to be defined using the DIM statement. See
\#Option Explicit above. Just to clarify byte is default type, this
means:

``` programlisting
    Dim MainVar As Byte is unnecessary.
    MainVar = 128    automatic defines the MainVar variable
```

Bit, Word, Longs, Integers and Strings variables must be defined.

All variables are global, but, if they are defined inside a particular
subroutine then their type is not, see the example below:

Example code:

``` programlisting
    Dim MainVar As Byte
    Dim OtherVar As Word

    MainVar = 128
    OtherVar = 514

    DemoSub
    'At this point:
    'MainVar is a byte, value 128
    'OtherVar is a word, value 514
    'Counter is a byte, value 2
    '(Byte is default type, but location shared with that of Counter in DemoSub. High byte ignored)

    Sub DemoSub
        Dim Counter As Word          ' <<< a Word-typed alias for the same memory the caller sees as a Byte named Counter
        Counter = 2050
        'At this point:
        'MainVar and OtherVar as byte and word, as in main routine
        'Counter is a word, value 2050
    End Sub
```

<span class="strong">**Key line:**</span>
`Dim Counter As Word` — because every variable in GCBASIC is global by
name and address, this local `Dim` does not create separate storage; it
only changes how the <span class="strong">**same**</span> memory is
interpreted inside `DemoSub`. Outside the sub, that memory is read as a
`Byte`, so `2050` (`0x0802`) is truncated to its low byte, `2`.

In DemoSub, Counter is a word. But anywhere else in the program it is a
byte unless otherwise specified. If the variable is used/read in the
main routine, it will be treated as a byte, and only the low 8 bits will
be returned. In this example the low 8 bits of 2050 are 2.

The main reason for keeping the type inside the subroutine was for the
following scenario: A subroutine uses a temporary variable of type byte,
and relies on it overflowing.

Another subroutine uses a temporary variable of the same name, but of
word type.

If the first subroutine is already in the program, and then the second
one is added, the behaviour of the first one will not change at all due
to the addition of the second one.

The handling of variable types using this method minimises the size of
the generated assembly code.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_option_explicit" class="link" title="#Option Explicit">Option Explicit</a>
-   <a href="dim" class="link" title="Dim">Dim</a> — declaring
    variables, as used throughout this page
-   <a href="using_variables" class="link" title="Using Variables">Using Variables</a> — accessing
    individual bytes of a wider variable directly, without aliasing by
    name

</div>

</div>
