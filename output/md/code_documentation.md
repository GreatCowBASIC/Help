<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="code_documentation"></span>Code Documentation

</div>

</div>

</div>

Documenting GCBASIC is key for ease of use. This section is intended for
developers only.

Documenting is the ability to read some extra information from comments
in libraries.

Some comments that start with ''' have a special meaning, and will be
displayed as tooltips or as information to the user. These tooltips
helps inexperienced users to use extra libraries.

<div class="orderedlist">

1.  GCBASIC uses ; (a semicolon) to show comments that it has placed
    automatically, and // or ' to indicate ones that the user has
    placed. When loading a program, it will not load any that start with
    a ; (semi-colon). The use of comments do not impact the users but it
    worthy of note.
2.  As for code documentation comments, GCBASIC will load information
    about subroutines/functions and any hardware settings that need to
    be set.
3.  For subroutines, a line before the Sub or Function line that starts
    with ''' will be used as a tooltip when the user hovers over the
    icon. A line that starts with '''@ will be interpreted differently,
    depending on what comes after the @. '''@param ParamName Parameter
    Description will add a description for the parameter. For a
    subroutine, this will show in the Icon Settings panel under the
    parameter when the user has selected that icon.
4.  For functions, it will show at the appropriate time in the Parameter
    Editor wizard. '''@return Returned value applies to functions only.
    It will be displayed in the Parameter Editor wizard when the user is
    asked to choose a function. An example of all this is given in
    srf04.h:

</div>

``` screen
    '''Read the distance to the nearest object
    '''@param US_Sensor Sensor to read (1 to 4)
    '''@return Distance in cm
    Function USDistance(US_Sensor) As Word
```

<div class="orderedlist">

1.  If a subroutine or command is used internally in the library, but
    GCBASIC users should not see it, it can be hidden by placing
    '''@hide before the Sub or Function line. Another example from
    srf04.h:

</div>

``` screen
    '''@hide
    Sub InitUSSensor
```

These should hopefully be pretty easy to add. It is also possible to add
Hardware Settings. A particular setting can be defined anywhere in the
file, using this syntax:

``` screen
    '''@hardware condition, display name, constant, value type
```

These comments informs GCBASIC when to show the setting. Normally, this
is All, but sometimes it can include a constant, a space and then a
comma separated list of values. display name is a friendly name for the
setting to display. constant is the constant that must be set, and
valuetype is the type that will be accepted for that constant’s value.
To allow for multiple value types, enter a list of types with a \|
between them.

<div class="orderedlist">

1.  Allowed types are:

</div>

``` screen
    free - Allows anything
    label - Allows any label
    condition - Allows a condition
    table - Allows a data table
    bit - Allows any bit from variable, or bit variable
    io_pin - Allows an IO pin
    io_port - Allows an entire IO port
    number - Allows any fixed number or variable
    rangex:y - Allows any number between x and y
    var - Allows any variable
    var_byte - Allows any byte variable
    var_word - Allows any word variable
    var_integer - Allows any integer variable
    var_string - Allows any string variable
    const - Allows any fixed number
    const_byte - Allows any byte sized fixed number
    const_word - Allows any word sized fixed number
    const_integer - Allows any integer sized fixed number
    const_string - Allows any fixed string
    byte - Allows any byte (fixed number or variable)
    word - Allows any word
    integer - Allows any integer
    string - Allows any string
    array - Allows any array
```

<div class="orderedlist">

1.  When the library is added the program, GCBASIC will show a new
    device with the name of the library file on the Hardware Settings
    window. The user can then set the relevant constants without
    necessarily needing to see any code. Adding a GCBASIC library to
    GCBASIC will not result in any changes to the library. GCBASIC uses
    the information it reads to help edit the user’s program, but then
    the user’s program is passed to the compiler along with the
    unchanged library.
2.  Hardware Settings are a bit more involved to add, but hopefully the
    bit of extra documentation for subroutines will be straight forward.

</div>

</div>
