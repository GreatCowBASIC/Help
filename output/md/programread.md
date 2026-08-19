<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="programread"></span>ProgramRead

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ProgramRead (location, store)

    or for the 18FxxQ41 family of chips use:
    PFMRead (location, store)
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC microcontrollers with self write
capability. Not available on Atmel AVR at present.

<span class="strong">**Explanation:**</span>

`ProgramRead` reads information from the program memory on chips that
support this feature. `location` and `store` are both word variables,
meaning that they can store values over 255.

The largest value possible for `location` depends on the amount of
program memory on the Microchip PIC microcontroller, which is given on
the datasheet. `store` range is explained in the next section.

``` literallayout
_Maximum Stored Value_
```

The <span class="strong">**maximum value**</span> that can be stored in
a single program memory <span class="strong">**word**</span> location
across the PIC families:

<div class="informaltable">

|                                                            |                       |                           |                                           |                 |                                                    |
|:-----------------------------------------------------------|:----------------------|:--------------------------|:------------------------------------------|:----------------|:---------------------------------------------------|
| Family                                                     | Instruction Word Size | Program Memory Word Width | Maximum Value per Word (unsigned decimal) | Hex Range       | Can store full 16-bit value (0–65535) in one word? |
| <span class="strong">**PIC10**</span>                      | 12-bit                | 12 bits                   | 4095                                      | 0x000 – 0xFFF   | No                                                 |
| <span class="strong">**PIC12**</span> (baseline)           | 12-bit                | 12 bits                   | 4095                                      | 0x000 – 0xFFF   | No                                                 |
| <span class="strong">**PIC12**</span> (enhanced mid-range) | 14-bit                | 14 bits                   | 16383                                     | 0x0000 – 0x3FFF | No                                                 |
| <span class="strong">**PIC14**</span>                      | 14-bit                | 14 bits                   | 16383                                     | 0x0000 – 0x3FFF | No                                                 |
| <span class="strong">**PIC16**</span> (mid-range)          | 14-bit                | 14 bits                   | 16383                                     | 0x0000 – 0x3FFF | No                                                 |
| <span class="strong">**PIC16**</span> (enhanced mid-range) | 14-bit                | 14 bits                   | 16383                                     | 0x0000 – 0x3FFF | No                                                 |
| <span class="strong">**PIC18**</span>                      | 16-bit                | 16 bits                   | 65535                                     | 0x0000 – 0xFFFF | <span class="strong">**Yes**</span>                |

</div>

<span class="emphasis">*Quick Summary Table (most common cases)*</span>

<div class="informaltable">

|                                |                   |                                                    |                                             |
|:-------------------------------|:------------------|:---------------------------------------------------|:--------------------------------------------|
| Family group                   | Typical word size | Max value you can store in one program memory word | Equivalent to storing a full 16-bit number? |
| PIC10 / baseline PIC12         | 12 bits           | <span class="strong">**4095**</span> (0xFFF)       | No                                          |
| PIC14 / PIC16 / enhanced PIC12 | 14 bits           | <span class="strong">**16383**</span> (0x3FFF)     | No                                          |
| PIC18                          | 16 bits           | <span class="strong">**65535**</span> (0xFFFF)     | Yes                                         |

</div>

<span class="emphasis">*Important Notes*</span>

<div class="itemizedlist">

-   <span class="strong">**PIC18**</span> is the only 8-bit PIC family
    where you can directly store any 16-bit value (0–0xFFFF) in a single
    program memory word location.
-   On all earlier families (PIC10, PIC12 baseline, PIC14, PIC16,
    enhanced mid-range), you must split any value &gt; 0x3FFF (16383)
    across <span class="strong">**two words**</span> if you need the
    full 16-bit range.
-   The values above apply when storing constants, lookup table entries,
    `retlw` literals, `data`/`db` directives, etc. — i.e., the largest
    number that fits in one program memory <span
    class="strong">**word**</span>.

</div>

<span class="emphasis">*Addressing Notes*</span>

<div class="itemizedlist">

-   <span class="strong">**PIC18F family**</span>: `location` is a <span
    class="strong">**byte address**</span> (TBLPTR is byte-oriented).
    For reading 16-bit <span class="strong">**words**</span>, `location`
    <span class="strong">**must be even**</span> (word starts on even
    byte boundary). Reading odd locations may return misaligned or
    garbage data.
-   <span class="strong">**Non-18F families**</span> (mid-range,
    baseline): `location` is a <span class="strong">**word
    address**</span> (consecutive integers indexing 12/14-bit words).
-   Special variant: On some newer chips (e.g., 18FxxQ41 family), use
    `PFMRead (location, store)` instead.

</div>

See <a href="data" class="link" title="DATA">DATA command</a> for
examples of storing and reading byte/word values in program memory.

<span class="strong">**For more help, see
<a href="programerase" class="link" title="ProgramErase">ProgramErase</a>**</span>
and <span
class="strong">**<a href="programwrite" class="link" title="ProgramWrite">ProgramWrite</a>**</span>

</div>
