<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="gcbasic_documentation_toolchain"></span>GCBASIC Documentation Toolchain

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

GCBASIC documentation is written in AsciiDoc and maintained through
<a href="https://asciidoctor.org/" class="link">Asciidoctor</a>, a fast
text processor and publishing toolchain for converting AsciiDoc content
to HTML5, DocBook, PDF, and Microsoft Compiled HTML Help (CHM).

Asciidoctor is written in Ruby, packaged as a RubyGem. Because it is
Ruby-based, it runs directly on Windows without needing a Linux virtual
machine or a Cygwin environment.

The advantages of maintaining GCBASIC documentation this way are:

<div class="itemizedlist">

-   A simple, plain-text markup language that remains fully readable in
    a text editor.
-   Purpose-built for writing software documentation.
-   One set of source files converts to XML, HTML, PDF, and CHM without
    rewriting anything.

</div>

<span class="strong">**Toolchain Layout:**</span>

Unlike older setups that required each tool to be installed system-wide,
the current toolchain is fully self-contained. The repository layout is:

``` programlisting
    help
     |------ source
     |        |------- images
     |        |------- *.adoc
     |        |------- chm.bat
     |        |------- gcbdoc.bat
     |        |------- cleanhhc.bat
     |
     |------ prog
     |        |------- ruby-2.2.2-i386-mingw32
     |        |------- saxon6-5-5
     |        |------- docbook-xsl-ns-1.78.1
     |        |------- apache-ant-1.9.6
     |        |------- utils                  (bundled hhc.exe)
     |
     |------ output
              |------- chm
              |-------
              |-------5
              |------- pdf
              |------- web
              |------- xml
```

`source` and `prog` must be siblings: `gcbdoc.bat` changes up one
directory from `source` and expects `prog` there. Everything the build
needs (Ruby, Saxon, the DocBook XSL-NS stylesheets, Apache Ant, and the
HTML Help Compiler) already ships inside `prog`, so a fresh checkout
needs no separate installs.

<span class="strong">**Building the Documentation:**</span>

From the `source` directory, the entry point is:

``` programlisting
    chm.bat
```

This runs `gcbdoc gcbasic chm`, which in turn:

<div class="orderedlist">

1.  Converts `gcbasic.adoc` to DocBook XML with Asciidoctor.
2.  Transforms the XML with Saxon and the DocBook XSL-NS help.xsl`
    stylesheet, chunking one HTML topic per section and generating
    `gcbasic.hhp`/`gcbasic.hhc`/`index.hhk`.
3.  Runs `cleanhhc.bat` to strip dead links to empty category pages from
    the generated table of contents.
4.  Compiles the topics into `gcbasic.chm` with the Microsoft HTML Help
    Compiler (`hhc.exe`).

</div>

The finished file is `..\output\chm\gcbasic.chm`.

`gcbdoc.bat` also supports `xml`, `, 5`, `pdf`, `web`, and
`all` as a second parameter, generating the equivalent output under
`..\output\<type>\`, for the rare case one of those formats is needed;
the CHM is the only shipped deliverable.

<span class="strong">**Writing a New Page:**</span>

Each command or topic lives in its own `sectionname.adoc` file, wired
into the master `gcbasic.adoc` document with an
`include::sectionname.adoc[]` line under the appropriate category
heading.

Use `template.adoc` (in the `source` folder) as the starting point for a
new command page — it shows the expected structure: a `Syntax:` block,
`Command Availability:`, `Explanation:`, a worked `Example:` tagged
`[source,gcbasic]` with a `' <<<` marker on the line the page is
actually about, a `Key line:` explanation of that marker, and a <span
class="strong">**See Also:**</span> list of related pages using
AsciiDoc’s `<<_anchor,Display Text>>` cross-reference form.

<span class="strong">**Testing a Change:**</span>

While editing, rebuild with `chm.bat` and check the console output for
`ERROR` lines or `invalid reference`/`no ID for constraint linkend`
warnings — the latter means an `<<_anchor,…​>>` link points at an anchor
that does not exist. Anchors are generated automatically from a
heading’s text (lowercased, punctuation stripped to underscores,
prefixed with `_`); when a heading uses unusual punctuation, do not
guess the anchor — inspect the actual generated DocBook XML for its real
`xml:id` first.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="gcbasic_maintenance" class="link" title="GCBASIC Maintenance">GCBASIC Maintenance</a> — the
    release/build/DAT-file maintenance process
-   <a href="development_guide" class="link" title="Development Guide">Development Guide</a> — contributing
    to GCBASIC itself, as distinct from its documentation

</div>

</div>
