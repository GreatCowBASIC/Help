<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="at_fixed_memory_location"></span>At (Fixed Memory Location)

</div>

</div>

</div>

`At` places a variable at a specific RAM location:

``` programlisting
    Dim SerialBuffer As Byte At 0x20
```

If the location is already used or invalid, a warning is generated:
`Memory location specified for name may be invalid`.

On PIC18 chips, keep all the bytes of a multi-byte variable in one RAM
bank. `Dim VW As Word At 0x7FF`, for example, puts the high byte at
0x800 in the next bank, and gives the warning
`Fixed location of name puts its bytes in two RAM banks: each use of it needs a bank change`.
The program works, but each use of the variable needs a bank change. The
compiler does not place a multi-byte variable of its own across a bank
boundary. See the Multi-byte variable constraint in
<a href="constraints_and_error_messages_overview" class="link" title="Constraints and Error Messages Overview">Constraints and Error Messages</a>.

`At` and `Alias` are mutually exclusive.

</div>
