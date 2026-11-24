<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="pause"></span>Pause

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
Fixed Length Delay:
    Pause time_ms
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Pause` command causes the program to pause for a specified time in
milliseconds. The only unit of time permitted is milliseconds — unlike
`Wait`, `Pause` takes a bare number and always treats it as
milliseconds.

`Pause` is an older, simpler command kept for compatibility with
existing programs. For new code, use the `Wait` command instead, since
it supports a full range of time units (microseconds through hours) and
conditional forms (`Wait While`/`Wait Until`).

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F628A, 4

    #define LIGHT PORTB.0
    Dir LIGHT Out

    Do
      Set LIGHT On
      Pause 500          ' <<< the Pause instruction
      Set LIGHT Off
      Pause 500
    Loop
```

<span class="strong">**Key line:**</span> `Pause 500` — pauses the
program for 500 milliseconds; the bare number `500` is always
interpreted as milliseconds, unlike `Wait`, which requires an explicit
unit such as `500 ms`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="wait" class="link" title="Wait">Wait</a> — the modern
    replacement, supporting more units and conditional delays

</div>

</div>
