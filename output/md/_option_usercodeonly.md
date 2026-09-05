<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_usercodeonly"></span>\#Option UserCodeOnly

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    #option UserCodeOnly LABEL:
```

This option enables <span class="strong">**minimal-startup user
mode**</span>, allowing the developer to take full control of the
program’s behaviour from the very first instruction.

When enabled, the compiler omits all standard automatic startup routines
normally inserted by GCBASIC. This directive is ideal for applications
where the user requires absolute control over the execution environment.

The label is mandatory. The label specified will be included in the
generated ASM.

<span class="strong">**Behaviour:**</span>

Enabling <span class="strong">**UserCodeOnly**</span> removes or
suppresses the following:

<div class="itemizedlist">

-   <span class="strong">**No automatic stack initialisation**</span>
    The compiler does not configure the hardware stack or related
    registers.
-   <span class="strong">**No global interrupt enable (sei)**</span>
    Interrupts remain disabled unless explicitly enabled by the user.
-   <span class="strong">**Optional removal of the standard interrupt
    vector table**</span> If the label provided replaces the default
    vector, the user must supply their own interrupt entry code.
-   <span class="strong">**No GCBASIC runtime startup code**</span> No
    variable initialisation, no system setup, no runtime housekeeping.
-   <span class="strong">**No automatic calls to INITSYS or other init
    routines**</span> All system configuration must be performed
    manually.
-   <span class="strong">**Reduced .ORG directives at page
    boundaries**</span> The compiler avoids inserting automatic
    page-alignment directives, giving the user full control of memory
    layout.

</div>

This mode is intended for advanced users who require a bare-metal
environment.

<span class="strong">**Ideal for:**</span>

<div class="itemizedlist">

-   <span class="strong">**Bare-metal applications**</span> Where the
    user wants to define every instruction executed from reset.
-   <span class="strong">**Custom bootloaders**</span> Allows precise
    control over memory layout, vectors, and startup flow.
-   <span class="strong">**Mixed GCBASIC + assembly projects**</span>
    Ensures no hidden runtime code interferes with hand-written
    assembly.
-   <span class="strong">**Minimal firmware with full user
    control**</span> Perfect for ultra-small, deterministic, or
    timing-critical applications.

</div>

<span class="strong">**Example 1:**</span>

``` programlisting
    'Set chip model
    #chip 16f877a

    'Enable minimal user-mode startup
    #option usercodeonly StartHere:          ' <<< skipping all automatic startup code

StartHere:
    'User-defined reset entry point
    #asmraw[
        nop
        nop
    #asmraw]

    'Your program continues here
```

<span class="strong">**Key line:**</span>
`#option usercodeonly StartHere:` — the very first instruction the chip
executes after reset is at the `StartHere:` label below, with none of
GCBASIC’s usual stack setup, interrupt configuration, or INITSYS call
run beforehand.

<span class="strong">**Example 2:**</span>

``` programlisting
    'Set chip model
    #chip 18f452

    'UserCodeOnly with custom interrupt vector
    #option USERCODEONLY    myReset:



MyReset:
    'Manual system setup
        clrf INTCON     ; interrupts remain disabled
        clrf STATUS

MainLoop:
    goto MainLoop
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_option_noconfig" class="link" title="#Option NoConfig">#Option NoConfig</a> — suppressing
    compiler-generated CONFIG statements, often used alongside this
    option
-   <a href="_option_nocontextsave" class="link" title="#Option NoContextSave">#Option NoContextSave</a> — disabling
    automatic interrupt context save/restore
-   <a href="_asmraw" class="link" title="#asmraw">#asmraw</a> — inserting
    raw assembly, as used in Example 1

</div>

</div>
