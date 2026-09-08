<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="regression_testing_the_compiler_against_the_demos"></span>Regression Testing the Compiler Against the Demos

</div>

</div>

</div>

Before publishing a compiler change, run it against the full demo corpus
to catch regressions. The `testcompilealldemos.bat` script walks a
target folder (the demos repository by default) and compiles every
`.gcb` file it finds, logging the outcome of each into four files:
`test.log` (files with real errors/warnings, or that failed to produce
ASM/HEX), `success.log`, `invalidsources.log` (files with no
`#chip`/recognised chip include, so not a compilable source), and
`skipped.log`.

<span class="strong">**Excluding files and folders from the
run:**</span>

There are two independent ways to keep a source out of a regression run:

<div class="informaltable">

| Mechanism                                                    | Effect                                                                                                                                                                                                                                                                                                             |
|:-------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A file named `skiptest` or `skiptest.txt` placed in a folder | Skips every `.gcb` file in that folder <span class="strong">**and all its subfolders**</span>. The script walks up from each file’s folder toward the target root looking for this marker, so placing one at a high-level folder (e.g. a whole `TestSolutions`-style scratch area) excludes everything beneath it. |
| The `#SKIPTEST` directive inside a `.gcb` file               | Skips only that individual file, wherever it lives. The script detects it with a plain text search for `#SKIPTEST` in the source, so it does not need to sit in any particular location in the file.                                                                                                               |

</div>

Neither mechanism is understood by `GCBASIC.EXE` itself - `#SKIPTEST` is
not a compiler directive; the compiler never inspects it. Both are
conventions read only by the regression-test script, used to exclude
demos that are intentionally non-compiling (work in progress,
illustrative snippets, or requiring build options the batch run doesn’t
set).

  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="development_guide" class="link" title="Development Guide">Development Guide</a> — the
    equivalent contributor guide for GCBASIC libraries
-   <a href="gcbasic_maintenance" class="link" title="GCBASIC Maintenance">GCBASIC Maintenance</a> — the
    release/build/DAT-file maintenance process
-   <a href="command_line_parameters" class="link" title="Command Line Parameters">Command Line Parameters</a> — the
    use.ini settings this compiler reads
-   <a href="performance_overview" class="link" title="Performance Overview">Performance</a> — the
    user-facing guide to writing fast GCBASIC code

</div>

</div>
