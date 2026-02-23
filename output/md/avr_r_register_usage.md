<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="avr_r_register_usage"></span>AVR R Register Usage

</div>

</div>

</div>

<span class="strong">**Overview**</span>

GCBASIC uses a set of <span class="strong">**system variables**</span>
for internal calculations, temporary storage, division/multiplication
results, delays, string handling, and more. These are mapped to <span
class="strong">**General Purpose Registers (GPRs)**</span> on AVR
targets to avoid RAM access overhead where possible.

The mapping is determined by the GCBASIC source code function
`GetRegisterLoc(RegName As String)`, which returns the register number
(0–31) or -1 if not found (falling back to RAM).

Key points:

<div class="itemizedlist">

-   On chips with <span class="strong">**only 16 GPRs**</span>
    (`ChipGPR = 16`, e.g., ATtiny4/5/9/10 — physically mapped as
    R16–R31), system variables are placed in R16–R31.
-   On chips with <span class="strong">**full 32 GPRs**</span>
    (`ChipGPR != 16`, most AVRs), system variables use a mix of low
    (R0–R5) and high (R21–R31) registers.
-   <span class="strong">**R6–R20**</span> are typically unused for
    system variables in full mode (available for user code).
-   <span class="strong">**X, Y, Z**</span> pointers (R26:R27, R28:R29,
    R30:R31) are <span class="strong">**not**</span> allocated as system
    variables — reserved for addressing.
-   If DestLoc = -1 (e.g., SysSignByte on 16-GPR chips), the variable
    uses SRAM (RAM) instead of GPR.

</div>

<span class="strong">**GPR16 Allocation (ChipGPR = 16)**</span>

Allocation for low-GPR chips (only R16–R31 available).

<div class="informaltable">

| Register | Primary System Variable(s)                                                                                          | Aliases / Shared With | Notes                                                       |
|:---------|:--------------------------------------------------------------------------------------------------------------------|:----------------------|:------------------------------------------------------------|
| R16      | SysCalcTempX, SysByteTempX, SysWordTempX, SysIntegerTempX, SysLongTempX                                             | \-                    | Multi-precision calculation temp (low byte)                 |
| R17      | SysCalcTempX\_H, SysWordTempX\_H, SysIntegerTempX\_H, SysLongTempX\_H                                               | \-                    | High byte of above                                          |
| R18      | SysCalcTempX\_U, SysLongTempX\_U, SysDivMultX                                                                       | \-                    | Upper byte (for 32-bit ops) or division/multiplication temp |
| R19      | SysCalcTempX\_E, SysLongTempX\_E, SysDivMultX\_H                                                                    | \-                    | Extra/remainder byte                                        |
| R20      | SysDivLoop, SysBitTest                                                                                              | \-                    | Division loop counter or bit test temp                      |
| R21      | SysValueCopy                                                                                                        | \-                    | Temporary copy for value transfers (e.g. stack/out ops)     |
| R22      | SysCalcTempA, SysByteTempA, SysWordTempA, SysIntegerTempA, SysLongTempA                                             | \-                    | Primary calculation temp A (low)                            |
| R23      | SysCalcTempA\_H, SysWordTempA\_H, SysIntegerTempA\_H, SysLongTempA\_H                                               | \-                    | High byte                                                   |
| R24      | SysCalcTempA\_U, SysLongTempA\_U, SysDivMultA                                                                       | \-                    | Upper byte                                                  |
| R25      | DelayTemp, SysCalcTempA\_E, SysLongTempA\_E, SysDivMultA\_H, SysStringLength                                        | DelayTemp2 (partial)  | Delay counters + string length                              |
| R26      | DelayTemp2, SysStringA                                                                                              | \-                    | Secondary delay or string pointer low                       |
| R27      | SysWaitTempUS, SysWaitTemp10US, SysWaitTempM, SysStringA\_H                                                         | \-                    | Microsecond delay temps + string high                       |
| R28      | SysWaitTempUS\_H, SysWaitTempH, SysCalcTempB, SysByteTempB, SysWordTempB, SysIntegerTempB, SysLongTempB, SysStringB | \-                    | Byte/word/long temp B (low) + millisecond delay high        |
| R29      | SysWaitTempMS, SysCalcTempB\_H, SysWordTempB\_H, SysIntegerTempB\_H, SysLongTempB\_H, SysStringB\_H                 | \-                    | High bytes                                                  |
| R30      | SysWaitTempMS\_H, SysCalcTempB\_U, SysLongTempB\_U, SysDivMultB, SysReadA                                           | \-                    | Upper bytes or read temp                                    |
| R31      | SysWaitTemp10MS, SysWaitTemps, SysCalcTempB\_E, SysLongTempB\_E, SysDivMultB\_H, SysReadA\_H                        | \-                    | Extra temps / high bytes                                    |

</div>

<span class="strong">**Full Register Set Allocation (ChipGPR !=
16)**</span>

Allocation for full 32-GPR chips (R0–R31 available).

<div class="informaltable">

| Register    | Primary / Common System Variable(s)                                          | When ChipGPR=16 (shifted to) | Notes / Conflicts                              |
|:------------|:-----------------------------------------------------------------------------|:-----------------------------|:-----------------------------------------------|
| R0          | SysCalcTempX, SysByteTempX, SysWordTempX, SysIntegerTempX, SysLongTempX      | R16                          | Low byte of multi-byte calc temp X             |
| R1          | SysCalcTempX\_H, SysWordTempX\_H, SysIntegerTempX\_H, SysLongTempX\_H        | R17                          | High byte                                      |
| R2          | SysCalcTempX\_U, SysLongTempX\_U, SysDivMultX                                | R18                          | Upper / division temp                          |
| R3          | SysCalcTempX\_E, SysLongTempX\_E, SysDivMultX\_H                             | R19                          | Extra byte                                     |
| R4          | SysSignByte                                                                  | RAM                          | Sign byte for signed operations                |
| R5          | SysDivLoop, SysBitTest                                                       | R20                          | Loop / bit temp                                |
| R6–R20      | (unused for system vars)                                                     | \-                           | Available for user variables or scratch        |
| R21         | SysValueCopy                                                                 | R21                          | Value copy register (used in stack init, etc.) |
| R22         | SysCalcTempA, SysByteTempA, SysWordTempA, SysIntegerTempA, SysLongTempA      | R22                          | Primary calculation temp A (low)               |
| R23         | SysCalcTempA\_H, SysWordTempA\_H, SysIntegerTempA\_H, SysLongTempA\_H        | R23                          | High byte                                      |
| R24         | SysCalcTempA\_U, SysLongTempA\_U, SysDivMultA                                | R24                          | Upper byte                                     |
| R25         | DelayTemp, SysCalcTempA\_E, SysLongTempA\_E, SysDivMultA\_H, SysStringLength | R25                          | Delay + string length                          |
| R26         | DelayTemp2, SysStringA                                                       | R26                          | Secondary delay / string low                   |
| R27         | SysWaitTempUS etc., SysStringA\_H                                            | R27                          | Microsecond delays + string high               |
| R28         | SysWaitTempUS\_H, SysWaitTempH, SysCalcTempB etc.                            | R28                          | Temp B low + delays                            |
| R29         | SysWaitTempMS, SysCalcTempB\_H etc.                                          | R29                          | High bytes                                     |
| R30         | SysWaitTempMS\_H, SysCalcTempB\_U etc.                                       | R30                          | Upper bytes                                    |
| R31         | SysWaitTemp10MS, SysWaitTemps, SysCalcTempB\_E etc.                          | R31                          | Extra temps                                    |
| R26:R27 (X) | Not used as system vars                                                      | \-                           | Reserved for pointer operations                |
| R28:R29 (Y) | Not used as system vars                                                      | \-                           | Reserved for pointer / stack frame             |
| R30:R31 (Z) | Not used as system vars                                                      | \-                           | Reserved for program memory / indirect jumps   |

</div>

<span class="strong">**Alphabetical Variable Mapping for GPR16 Mode
(ChipGPR = 16)**</span>

Variables sorted alphabetically, with their assigned register (or RAM if
-1).

<div class="informaltable">

| Variable Name      | Register | Notes                                |
|:-------------------|:---------|:-------------------------------------|
| delaytemp          | R25      | Delay counter                        |
| delaytemp2         | R26      | Secondary delay counter              |
| sysbittest         | R20      | Bit test temp                        |
| sysbytetempa       | R22      | Byte temp A                          |
| sysbytetempb       | R28      | Byte temp B                          |
| sysbytetempx       | R16      | Byte temp X                          |
| syscalctempa       | R22      | Calc temp A (low)                    |
| syscalctempa\_e    | R25      | Extra byte A                         |
| syscalctempa\_h    | R23      | High byte A                          |
| syscalctempa\_u    | R24      | Upper byte A                         |
| syscalctempb       | R28      | Calc temp B (low)                    |
| syscalctempb\_e    | R31      | Extra byte B                         |
| syscalctempb\_h    | R29      | High byte B                          |
| syscalctempb\_u    | R30      | Upper byte B                         |
| syscalctempx       | R16      | Calc temp X (low)                    |
| syscalctempx\_e    | R19      | Extra byte X                         |
| syscalctempx\_h    | R17      | High byte X                          |
| syscalctempx\_u    | R18      | Upper byte X                         |
| sysdivloop         | R20      | Division loop counter                |
| sysdivmulta        | R24      | Division/multiplication temp A       |
| sysdivmulta\_h     | R25      | High byte                            |
| sysdivmultb        | R30      | Division/multiplication temp B       |
| sysdivmultb\_h     | R31      | High byte                            |
| sysdivmultx        | R18      | Division/multiplication temp X       |
| sysdivmultx\_h     | R19      | High byte                            |
| sysintegertempa    | R22      | Integer temp A (low)                 |
| sysintegertempa\_h | R23      | High byte                            |
| sysintegertempb    | R28      | Integer temp B (low)                 |
| sysintegertempb\_h | R29      | High byte                            |
| sysintegertempx    | R16      | Integer temp X (low)                 |
| sysintegertempx\_h | R17      | High byte                            |
| syslongtempa       | R22      | Long temp A (low)                    |
| syslongtempa\_e    | R25      | Extra byte                           |
| syslongtempa\_h    | R23      | High byte                            |
| syslongtempa\_u    | R24      | Upper byte                           |
| syslongtempb       | R28      | Long temp B (low)                    |
| syslongtempb\_e    | R31      | Extra byte                           |
| syslongtempb\_h    | R29      | High byte                            |
| syslongtempb\_u    | R30      | Upper byte                           |
| syslongtempx       | R16      | Long temp X (low)                    |
| syslongtempx\_e    | R19      | Extra byte                           |
| syslongtempx\_h    | R17      | High byte                            |
| syslongtempx\_u    | R18      | Upper byte                           |
| sysreada           | R30      | Read temp A                          |
| sysreada\_h        | R31      | High byte                            |
| syssignbyte        | RAM      | Sign byte (uses RAM on 16-GPR chips) |
| sysstringa         | R26      | String pointer A (low)               |
| sysstringa\_h      | R27      | High byte                            |
| sysstringb         | R28      | String pointer B (low)               |
| sysstringb\_h      | R29      | High byte                            |
| sysstringlength    | R25      | String length                        |
| sysvaluecopy       | R21      | Value copy temp                      |
| syswaittemp10ms    | R31      | 10ms wait temp                       |
| syswaittemp10us    | R27      | 10us wait temp                       |
| syswaittemph       | R28      | Hour wait temp                       |
| syswaittempm       | R27      | Minute wait temp                     |
| syswaittempms      | R29      | ms wait temp                         |
| syswaittempms\_h   | R30      | High byte                            |
| syswaittemps       | R31      | Second wait temp                     |
| syswaittempus      | R27      | us wait temp                         |
| syswaittempus\_h   | R28      | High byte                            |
| syswordtempa       | R22      | Word temp A (low)                    |
| syswordtempa\_h    | R23      | High byte                            |
| syswordtempb       | R28      | Word temp B (low)                    |
| syswordtempb\_h    | R29      | High byte                            |
| syswordtempx       | R16      | Word temp X (low)                    |
| syswordtempx\_h    | R17      | High byte                            |

</div>

<span class="strong">**Alphabetical Variable Mapping for Full Mode
(ChipGPR != 16)**</span>

Variables sorted alphabetically, with their assigned register.

<div class="informaltable">

| Variable Name      | Register | Notes                          |
|:-------------------|:---------|:-------------------------------|
| delaytemp          | R25      | Delay counter                  |
| delaytemp2         | R26      | Secondary delay counter        |
| sysbittest         | R5       | Bit test temp                  |
| sysbytetempa       | R22      | Byte temp A                    |
| sysbytetempb       | R28      | Byte temp B                    |
| sysbytetempx       | R0       | Byte temp X                    |
| syscalctempa       | R22      | Calc temp A (low)              |
| syscalctempa\_e    | R25      | Extra byte A                   |
| syscalctempa\_h    | R23      | High byte A                    |
| syscalctempa\_u    | R24      | Upper byte A                   |
| syscalctempb       | R28      | Calc temp B (low)              |
| syscalctempb\_e    | R31      | Extra byte B                   |
| syscalctempb\_h    | R29      | High byte B                    |
| syscalctempb\_u    | R30      | Upper byte B                   |
| syscalctempx       | R0       | Calc temp X (low)              |
| syscalctempx\_e    | R3       | Extra byte X                   |
| syscalctempx\_h    | R1       | High byte X                    |
| syscalctempx\_u    | R2       | Upper byte X                   |
| sysdivloop         | R5       | Division loop counter          |
| sysdivmulta        | R24      | Division/multiplication temp A |
| sysdivmulta\_h     | R25      | High byte                      |
| sysdivmultb        | R30      | Division/multiplication temp B |
| sysdivmultb\_h     | R31      | High byte                      |
| sysdivmultx        | R2       | Division/multiplication temp X |
| sysdivmultx\_h     | R3       | High byte                      |
| sysintegertempa    | R22      | Integer temp A (low)           |
| sysintegertempa\_h | R23      | High byte                      |
| sysintegertempb    | R28      | Integer temp B (low)           |
| sysintegertempb\_h | R29      | High byte                      |
| sysintegertempx    | R0       | Integer temp X (low)           |
| sysintegertempx\_h | R1       | High byte                      |
| syslongtempa       | R22      | Long temp A (low)              |
| syslongtempa\_e    | R25      | Extra byte                     |
| syslongtempa\_h    | R23      | High byte                      |
| syslongtempa\_u    | R24      | Upper byte                     |
| syslongtempb       | R28      | Long temp B (low)              |
| syslongtempb\_e    | R31      | Extra byte                     |
| syslongtempb\_h    | R29      | High byte                      |
| syslongtempb\_u    | R30      | Upper byte                     |
| syslongtempx       | R0       | Long temp X (low)              |
| syslongtempx\_e    | R3       | Extra byte                     |
| syslongtempx\_h    | R1       | High byte                      |
| syslongtempx\_u    | R2       | Upper byte                     |
| sysreada           | R30      | Read temp A                    |
| sysreada\_h        | R31      | High byte                      |
| syssignbyte        | R4       | Sign byte                      |
| sysstringa         | R26      | String pointer A (low)         |
| sysstringa\_h      | R27      | High byte                      |
| sysstringb         | R28      | String pointer B (low)         |
| sysstringb\_h      | R29      | High byte                      |
| sysstringlength    | R25      | String length                  |
| sysvaluecopy       | R21      | Value copy temp                |
| syswaittemp10ms    | R31      | 10ms wait temp                 |
| syswaittemp10us    | R27      | 10us wait temp                 |
| syswaittemph       | R28      | Hour wait temp                 |
| syswaittempm       | R27      | Minute wait temp               |
| syswaittempms      | R29      | ms wait temp                   |
| syswaittempms\_h   | R30      | High byte                      |
| syswaittemps       | R31      | Second wait temp               |
| syswaittempus      | R27      | us wait temp                   |
| syswaittempus\_h   | R28      | High byte                      |
| syswordtempa       | R22      | Word temp A (low)              |
| syswordtempa\_h    | R23      | High byte                      |
| syswordtempb       | R28      | Word temp B (low)              |
| syswordtempb\_h    | R29      | High byte                      |
| syswordtempx       | R0       | Word temp X (low)              |
| syswordtempx\_h    | R1       | High byte                      |

</div>

<span class="strong">**Additional Notes**</span>

<div class="itemizedlist">

-   <span class="strong">**SysValueCopy (R21)**</span> — Frequently used
    for temporary value transfers, especially during stack pointer setup
    (`out SPH/SPL`) or register copies.
-   <span class="strong">**Delay registers**</span> — `DelayTemp`,
    `DelayTemp2`, and wait temps (`SysWaitTempUS`, `SysWaitTempMS`,
    etc.) are reused across delay routines.
-   <span class="strong">**Division/Multiplication**</span> — Remainder
    and intermediate results use `SysDivMultX`, `SysDivMultA`, etc.
-   <span class="strong">**String handling**</span> — `SysStringA`,
    `SysStringB`, `SysStringLength` for string operations.
-   <span class="strong">**No overlap with X/Y/Z**</span> — GCBASIC
    preserves these for `ld`, `st`, `lpm`, `elpm`, `ijmp`, etc.
-   <span class="strong">**UserCodeOnlyEnabled mode**</span> — May
    reduce usage of some temps if init code is skipped, but mappings
    remain the same.
-   <span class="strong">**ChipGPR detection**</span> — Determined from
    chip definition files; affects only low-GPR chips (e.g.,
    ATtiny4/5/9/10 series).

</div>

This mapping is derived directly from the `GetRegisterLoc` function in
GCBASIC source code.

</div>
