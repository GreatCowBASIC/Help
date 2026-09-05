<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="gcbasic_hxl_memory_map_output"></span>GCBASIC HXL- Memory Map Output

</div>

</div>

</div>

<span class="strong">**Overview**</span>

GCBASIC and its assembler GCASM generate a diagnostic memory-map report
that is functionally similar to Microchip’s HEXMATE <span
class="strong">**HXL**</span> output.

The report provides a linearised, human-readable view of program-memory
usage, showing which regions contain compiled code and which remain
unused.

The purpose mirrors the original HXL format:

<div class="itemizedlist">

-   Verify memory usage
-   Detect unused or unexpected gaps
-   Confirm placement of reset and interrupt vectors
-   Debug memory-mapping behaviour

</div>

GCBASIC extends the traditional HXL concept by adding a <span
class="strong">**visual hex-grid map**</span>, making memory analysis
easier and more intuitive.

<span class="strong">**Structure of the GCASM Output Summary**</span>

A typical output summary contains:

``` programlisting
    ### GCASM logfile and output summary ###

    ### Command-line arguments ###
    C:\GCstudio\gcbasic\GCBASIC.EXE ... /DO

    ### Memory Definition (bytes) ###
    0h-00001FFFh

    ### Memory Usage ###
    Input file ranges:
    0h-1h; 4h-5Fh
    Unused ranges:
    2h-3h; 60h-1FFFh

    ### Hex Memory Map ###
    Legend:
    -- = Unused memory
    H1 = Used memory
```

This structure mirrors the HEXMATE HXL file but adds a graphical
representation of memory.

<span class="strong">**Memory Definition**</span>

The <span class="strong">**Memory Definition**</span> section specifies
the linear memory window that GCBASIC will analyse:

``` programlisting
    0h-00001FFFh
```

Unlike HEXMATE, which often uses a generic 64-Kiword window, GCBASIC
uses the <span class="strong">**actual device memory size**</span>,
producing a more accurate and device-specific report.

<span class="strong">**Memory Usage (HXL-Equivalent)**</span>

This section is directly comparable to HEXMATE’s <span
class="strong">**Input file ranges**</span> and <span
class="strong">**Unused ranges**</span>.

<span class="strong">**Input File Ranges**</span>

These are contiguous blocks of addresses that contain compiled program
bytes:

``` programlisting
    0h-1h; 4h-5Fh
```

Interpretation:

``` programlisting
    `0h-1h` -> Reset vector and initial instructions
    `4h-5Fh` -> Main program body
```

<span class="strong">**Unused Ranges**</span>

These are the gaps between used blocks:

``` programlisting
    2h-3h; 60h-1FFFh
```

This is equivalent to HEXMATE’s unused-range reporting, and is essential
for verifying expected gaps, bootloader boundaries, and linker-like
behaviour.

<span class="strong">**Hex Memory Map (GCBASIC-Exclusive
Feature)**</span>

GCBASIC adds a visual hex-grid map similar to HEXMATE:

``` programlisting
    00000000 | H1 H1 -- -- H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1
    00000010 | H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1
    00000020 | H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1
    00000030 | H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1
    00000040 | H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1
    00000050 | H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1 H1
```

This grid provides:

<div class="itemizedlist">

-   Byte-accurate visibility of memory usage
-   Immediate identification of gaps
-   A debugging tool for startup code, ISRs, and padding
-   A way to confirm that GCBASIC is generating dense, efficient code

</div>

<span class="strong">**How GCBASIC Builds the HXL-Style Map**</span>

GCBASIC follows a process similar to HEXMATE:

<div class="orderedlist">

1.  Compile GCBASIC source into GCASM assembly.
2.  Assemble into a HEX file.
3.  Linearise all addresses.
4.  Mark each byte as used or unused.
5.  Consolidate contiguous used regions.
6.  Emit <span class="strong">**Input**</span> and <span
    class="strong">**Unused**</span> ranges.
7.  Render the visual hex-grid map.

</div>

The key difference is that GCBASIC uses the <span
class="strong">**actual device memory limits**</span> and integrates the
report directly into the compiler output.

<span class="strong">**Comparison: HEXMATE HXL vs GCBASIC
Output**</span>

<div class="informaltable">

| Feature                       | HEXMATE HXL | GCBASIC/GCASM  |
|:------------------------------|:------------|:---------------|
| Microcontroller Support       | PIC         | PIC, AVR & LGT |
| Input file ranges             | Yes         | Yes            |
| Unused ranges                 | Yes         | Yes            |
| Linearised address space      | Yes         | Yes            |
| Device-specific memory window | No          | Yes            |
| Visual hex-grid map           | Yes         | Yes            |
| Integrated into compiler      | No          | Yes            |
| Config-word mapping           | Yes         | Yes            |

</div>

<span class="strong">**To enable HXL file output**</span>

There are two options to enable the compiler to produce the HXL output
file.

<div class="orderedlist">

1.  Use the Preferences Editor, select the Compiler tab, and select the
    HXL option.
2.  Add the following to your configuration file. Typically, this is
    called `use.ini`. Add `hxloutput = y` to the `[gcbasic]` section.

</div>

``` programlisting
    [gcbasic]
    hxloutput = y
    debughxloutput = y
```

Optionally, you can add debug output by using the `debughxloutput = y`
entry.

<span class="strong">**Summary**</span>

GCBASIC’s GCASM output summary is effectively a modernised HXL file:

<div class="itemizedlist">

-   Same range reporting
-   Same linear memory model
-   Same diagnostic purpose
-   Enhanced with a visual hex map
-   More accurate due to real device memory limits

</div>

It is a powerful tool for validating memory layout, debugging unexpected
gaps, and ensuring correct program placement on microcontrollers.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="command_line_parameters" class="link" title="Command Line Parameters">Command Line Parameters</a> — the
    use.ini settings file this feature is enabled through
-   <a href="compiler_insights" class="link" title="Compiler Insights">Compiler Insights</a> — more
    on how the compiler generates ASM output

</div>

</div>
