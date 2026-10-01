<#
.SYNOPSIS
    Wires new GCBASIC keywords/constants into the IDE tooling: syntax-highlight
    colour in GCcode (the bundled VS Code extension) and the F1-Help lookup in
    SynWrite.

.DESCRIPTION
    Whenever a new keyword, constant, or directive is added to the GCBASIC
    compiler, two editor-side files have to be updated for it to show up
    correctly in the IDE:

        1. GCB.tmLanguage.json  - the VS Code/GCcode syntax grammar. Which of
           its "scopes" a word is placed in decides what colour the active
           VS Code theme paints it (see -ListTypes below, or the TYPE TABLE
           section further down this file).
        2. gcbasic.acp          - SynWrite's autocomplete file. A line here
           is what makes F1 open the right Help page for the word.

    TO ADD OR CHANGE A KEYWORD: scroll down to the "KEYWORDS TO ADD" block
    below, add or edit an AddKeywords line, then just run this script - no
    arguments, no separate data file. That block is the only part of this
    file you should ever need to touch.

    This is add-OR-update, not add-only:
      - Keyword not present anywhere yet           -> added
      - Keyword present with the same Type/HelpPage -> left alone (unchanged)
      - Keyword present but Type has changed         -> moved to the new
        scope's list and removed from the old one (so it is never coloured
        by two scopes at once)
      - Keyword present in gcbasic.acp but HelpPage has changed -> that
        line's trailing help-page reference is corrected in place; any
        signature/description text already on the line is preserved
      - Keyword present in gcbasic.acp with no help-page reference at all
        (a bare hand-authored entry) -> a help-page reference is appended to
        that line rather than replacing it
    So re-running the script after editing an existing AddKeywords line's
    Type or HelpPage will correct the IDE files to match - you do not need
    to remove the old wiring by hand first.

    New keywords are appended at the END of their category's alternation
    list in GCB.tmLanguage.json (never inserted alphabetically or re-sorted).
    This keeps every diff minimal and can never disturb an existing
    order-sensitive pair of alternatives (e.g. USE_HPWM[0-9] must still be
    tried after USE_HPWMCCP[0-9] keeps matching correctly regardless of
    where in the list either one sits - but re-sorting the whole list on
    every run would produce a huge, unreviewable diff for no benefit).

    This script does NOT write Help content - the HelpPage value must name
    an HTML page that already exists under the Help output (or one you are
    adding separately). It only wires the keyword to that page and to a
    colour.

.PARAMETER GCstudioRoot
    Root of the GCstudio install. Defaults to C:\GCstudio. The script expects
    to find:
        <GCstudioRoot>\vscode\data\extensions\MierEngineering.GreatCowBasic\syntaxes\GCB.tmLanguage.json
        <GCstudioRoot>\synwrite\data\autocomplete\gcbasic.acp
    Override this if you're running the script on a machine where GCstudio is
    installed somewhere else.

.PARAMETER ListTypes
    Print the Type -> IDE scope -> colour reference table and exit, without
    touching the KEYWORDS TO ADD table or any file.

.PARAMETER SkipHelpLookup
    Only update the syntax-highlight colouring (GCB.tmLanguage.json); do not
    touch gcbasic.acp. Useful for a word that has no Help page yet.

.EXAMPLE
    .\Add-GCBasicKeyword.ps1 -ListTypes

    Shows the available Type values and what colour each one paints.

.EXAMPLE
    .\Add-GCBasicKeyword.ps1

    Applies every AddKeywords line in the table below to both IDE files -
    adding anything missing and correcting anything changed.

.EXAMPLE
    .\Add-GCBasicKeyword.ps1 -WhatIf

    Shows exactly what would be added/updated, without writing anything.
#>

[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$GCstudioRoot = 'C:\GCstudio',
    [switch]$ListTypes,
    [switch]$SkipHelpLookup,
    [switch]$NoPause
)

$ErrorActionPreference = 'Stop'

# Double-clicking this script (or launching it from a shortcut/menu item)
# opens a PowerShell window that runs it and then closes the instant it
# finishes - every Write-Host message above flashes and vanishes before it
# can be read. Pausing for a keypress before the window can close is what
# fixes that. Pass -NoPause to skip this (e.g. when calling the script from
# another script/CI, where nothing is there to press a key anyway).
function Wait-ForExit {
    if (-not $NoPause) {
        Write-Host ""
        Write-Host "Press Enter to close this window..." -ForegroundColor DarkGray
        try { Read-Host | Out-Null } catch { }
    }
}

# =====================================================================================
# TYPE TABLE - which "Type" paints which colour in the IDE
#
#   Type              Scope (GCB.tmLanguage.json)   Colour in GCstudio's current theme
#   ----------------  -----------------------------  -----------------------------------
#   ControlKeyword    keyword.control.GCB            Purple/magenta - If, Do, For, Sub, ...
#   Constant          constant.language.GCB          Blue - built-in constants/directives/
#                                                     library commands (ChipName, TRUE, ...)
#   LogicalOperator   invalid.gcb                     Red - AND, OR, XOR, NOT, BIT, ...
#   MathFunction      storage.type.GCB                Blue - Sin, Cos, Sqr, ByteToHex, ...
#   DataType          storage.type.GCB                Blue - Byte, Word, String, Long, ...
#   TypeModifier      storage.modifier.GCB            Blue - Alias
#   Preprocessor      keyword.other.GCB               Purple/pink - #DEFINE, #IFDEF, ...
#
# Run this script with -ListTypes to print this same table on demand. See
# CHANGES_since_2025-11.md rows 78/79 for why some of these scopes were chosen
# (retargeted to scopes the loaded theme actually colours).
# =====================================================================================
$TypeMap = [ordered]@{
    'ControlKeyword'  = @{
        BlockAnchor = '"keywords": {'
        Occurrence  = 1
        CloseToken  = ')\\b"'
        Scope       = 'keyword.control.GCB'
        Colour      = 'Purple/magenta - language control-flow keywords (If, Do, For, Sub, Return, ...)'
    }
    'Constant'        = @{
        BlockAnchor = '"intrinsics": {'
        Occurrence  = 1
        CloseToken  = ')\\b"'
        Scope       = 'constant.language.GCB'
        Colour      = 'Blue - built-in constants, compiler directives and library command names (e.g. ChipName, TRUE, CHIPASSEMBLER)'
    }
    'LogicalOperator' = @{
        BlockAnchor = '"operators": {'
        Occurrence  = 1
        CloseToken  = ')\\b"'
        Scope       = 'invalid.gcb'
        Colour      = 'Red - logical/bitwise operators (AND, OR, XOR, NOT, BIT, ...) - deliberately painted via the theme''s "invalid" scope, per explicit prior request'
    }
    'MathFunction'    = @{
        BlockAnchor = '"operators": {'
        Occurrence  = 2
        CloseToken  = ')\\b"'
        Scope       = 'storage.type.GCB'
        Colour      = 'Blue - math/conversion functions (Sin, Cos, Sqr, ByteToHex, ...)'
    }
    'DataType'        = @{
        BlockAnchor = '"types": {'
        Occurrence  = 1
        CloseToken  = ')\\b"'
        Scope       = 'storage.type.GCB'
        Colour      = 'Blue - fundamental data types (Byte, Word, String, Long, Integer, ...)'
    }
    'TypeModifier'    = @{
        BlockAnchor = '"typemods": {'
        Occurrence  = 1
        CloseToken  = ')\\b"'
        Scope       = 'storage.modifier.GCB'
        Colour      = 'Blue - type modifiers (Alias)'
    }
    'Preprocessor'    = @{
        BlockAnchor = '"preprocessor": {'
        Occurrence  = 1
        CloseToken  = '))"'
        Scope       = 'keyword.other.GCB'
        Colour      = 'Purple/pink - #directives (#DEFINE, #IFDEF, #SCRIPT, ...)'
    }
}

function Show-TypeTable {
    [PSCustomObject[]]$rows = foreach ($key in $TypeMap.Keys) {
        [PSCustomObject]@{
            Type   = $key
            Scope  = $TypeMap[$key].Scope
            Colour = $TypeMap[$key].Colour
        }
    }
    $rows | Format-Table -AutoSize -Wrap
}

if ($ListTypes) {
    Show-TypeTable
    Wait-ForExit
    return
}

# =====================================================================================
# KEYWORDS TO ADD - this is the record. Add one AddKeywords call per new word,
# naming all three fields:
#
#     AddKeywords -Keyword <name> -Type <TypeName> -HelpPage <file.html>
#
#   Keyword   the identifier exactly as GCBASIC source would use it, e.g. CHIPPSP
#   Type      one of the Type names from the TYPE TABLE above (case-insensitive)
#   HelpPage  the Help .html filename used for F1 lookup, exactly as other
#             entries in gcbasic.acp reference it, e.g. _other_directives.html
#
# Keep every line you've already added - re-running this script is always safe.
# Editing an existing line's Type or HelpPage and re-running CORRECTS the IDE
# files to match (add-or-update, not add-only) - see the script's own
# .DESCRIPTION (Get-Help .\Add-GCBasicKeyword.ps1 -Full) for exactly what
# "update" does in each case.
# =====================================================================================
$Keywords = [System.Collections.Generic.List[object]]::new()
function AddKeywords {
    param(
        [Parameter(Mandatory)] [string]$Keyword,
        [Parameter(Mandatory)] [string]$Type,
        [Parameter(Mandatory)] [string]$HelpPage
    )
    $Keywords.Add([PSCustomObject]@{ Keyword = $Keyword; Type = $Type; HelpPage = $HelpPage })
}

AddKeywords -Keyword CHIPASSEMBLER      -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPPSP            -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPIO             -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPADCCONSTANTS   -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPCONFIGWORDS    -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPHEFMEMWORDS    -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPINTOSC         -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPMAXADDRESS     -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPMAXMHZ         -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPSAFMEMWORDS    -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPSELFWRITE      -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPSHAREDRAM      -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPSTACKS         -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPUSART          -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPUSERIDADDRESS  -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPUSERIDLENGTH   -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword CHIPVECTORS_END    -Type Constant -HelpPage _other_directives.html
AddKeywords -Keyword IGNORECOMPILE      -Type Constant -HelpPage _ignorecompile.html
AddKeywords -Keyword UBOUND             -Type MathFunction -HelpPage _ubound.html

# =====================================================================================
# END OF TABLE - nothing below this line needs to change to add or update a keyword.
# =====================================================================================

# Everything from here to the end of the script runs inside try/finally so the
# "Press Enter to close" pause always happens - on normal completion, on an
# early "nothing to do" exit, AND on an error - a double-clicked script that
# hits a throw() would otherwise flash the error and close before it can be
# read, which is worse than not pausing on success.
try {

# ---------------------------------------------------------------------------
# Resolve target files
# ---------------------------------------------------------------------------
$grammarPath = Join-Path $GCstudioRoot 'vscode\data\extensions\MierEngineering.GreatCowBasic\syntaxes\GCB.tmLanguage.json'
$acpPath     = Join-Path $GCstudioRoot 'synwrite\data\autocomplete\gcbasic.acp'

if (-not (Test-Path $grammarPath)) {
    throw "Grammar file not found: $grammarPath (wrong -GCstudioRoot?)"
}
if (-not $SkipHelpLookup -and -not (Test-Path $acpPath)) {
    throw "SynWrite autocomplete file not found: $acpPath (wrong -GCstudioRoot?, or pass -SkipHelpLookup)"
}

if ($Keywords.Count -eq 0) {
    Write-Host "KEYWORDS TO ADD table is empty - nothing to do." -ForegroundColor Yellow
    return
}

foreach ($row in $Keywords) {
    if (-not $TypeMap.Contains($row.Type)) {
        Write-Host "Unknown Type '$($row.Type)' for keyword '$($row.Keyword)'. Valid Types:" -ForegroundColor Red
        Show-TypeTable
        throw "Unknown Type '$($row.Type)'"
    }
}

# ---------------------------------------------------------------------------
# Grammar (GCB.tmLanguage.json) helpers - every one of these re-locates its
# bucket fresh against whatever $grammarText currently is, never against a
# cached index, so keywords are always processed correctly one at a time
# regardless of how much earlier keywords in this run have already resized
# the text (an add, a remove, or both, for a Type change).
# ---------------------------------------------------------------------------
function Get-NthIndexAfter {
    param([string]$Text, [string]$Anchor, [string]$Token, [int]$Occurrence)
    $anchorIdx = $Text.IndexOf($Anchor)
    if ($anchorIdx -lt 0) { throw "Anchor not found in grammar file: $Anchor" }
    $idx = $anchorIdx + $Anchor.Length
    for ($i = 1; $i -le $Occurrence; $i++) {
        $idx = $Text.IndexOf($Token, $idx)
        if ($idx -lt 0) { throw "Could not find occurrence $Occurrence of '$Token' after '$Anchor'" }
        if ($i -lt $Occurrence) { $idx += $Token.Length }
    }
    return $idx
}

function Get-BucketSpan {
    param([string]$Text, [string]$TypeName)
    $info = $TypeMap[$TypeName]
    $anchorIdx = $Text.IndexOf($info.BlockAnchor)
    $closeIdx = Get-NthIndexAfter -Text $Text -Anchor $info.BlockAnchor -Token $info.CloseToken -Occurrence $info.Occurrence
    # +1 so the list's last entry still has its trailing ')' boundary inside
    # the span - otherwise the last word in the list has no closing boundary
    # to match/remove against.
    return @{ Start = $anchorIdx; End = $closeIdx + 1 }
}

function Test-KeywordInBucket {
    param([string]$Text, [string]$TypeName, [string]$Keyword)
    $span = Get-BucketSpan -Text $Text -TypeName $TypeName
    $listSpan = $Text.Substring($span.Start, $span.End - $span.Start)
    return [regex]::IsMatch($listSpan, "(?i)[|(]$([regex]::Escape($Keyword))[|)]")
}

function Remove-KeywordFromBucket {
    param([string]$Text, [string]$TypeName, [string]$Keyword)
    $span = Get-BucketSpan -Text $Text -TypeName $TypeName
    $listSpan = $Text.Substring($span.Start, $span.End - $span.Start)
    $esc = [regex]::Escape($Keyword)
    if ($listSpan -match "(?i)(?<=[|(])$esc\|") {
        $newListSpan = [regex]::Replace($listSpan, "(?i)(?<=[|(])$esc\|", '', 1)
    } elseif ($listSpan -match "(?i)\|$esc(?=[|)])") {
        $newListSpan = [regex]::Replace($listSpan, "(?i)\|$esc(?=[|)])", '', 1)
    } else {
        throw "Could not locate '$Keyword' for removal in the $TypeName bucket (unexpected)"
    }
    return $Text.Substring(0, $span.Start) + $newListSpan + $Text.Substring($span.End)
}

function Insert-KeywordIntoBucket {
    param([string]$Text, [string]$TypeName, [string]$Keyword)
    $span = Get-BucketSpan -Text $Text -TypeName $TypeName
    # $span.End is one past the ')' - the insert point is right before it,
    # i.e. right before the ')' itself.
    return $Text.Insert($span.End - 1, "|$Keyword")
}

# ---------------------------------------------------------------------------
# Apply the table to the grammar text (add-or-update, in memory only so far)
# ---------------------------------------------------------------------------
$grammarText = Get-Content -Path $grammarPath -Raw
$grammarReport = [System.Collections.Generic.List[string]]::new()
$grammarChanged = 0

foreach ($row in $Keywords) {
    $kw = $row.Keyword.Trim()
    $targetType = ($TypeMap.Keys | Where-Object { $_ -ieq $row.Type })

    $foundIn = @($TypeMap.Keys | Where-Object { Test-KeywordInBucket -Text $grammarText -TypeName $_ -Keyword $kw })

    if ($foundIn -contains $targetType -and $foundIn.Count -eq 1) {
        $grammarReport.Add("= $kw (Type=$targetType, unchanged)")
        continue
    }

    foreach ($staleType in ($foundIn | Where-Object { $_ -ne $targetType })) {
        $grammarText = Remove-KeywordFromBucket -Text $grammarText -TypeName $staleType -Keyword $kw
    }

    if ($foundIn -contains $targetType) {
        # Already in the right bucket; only stale duplicates elsewhere were cleaned up.
        $staleList = ($foundIn | Where-Object { $_ -ne $targetType }) -join ', '
        $grammarReport.Add("~ $kw (Type=$targetType, removed stale duplicate(s) from: $staleList)")
        $grammarChanged++
    } elseif ($foundIn.Count -gt 0) {
        $grammarText = Insert-KeywordIntoBucket -Text $grammarText -TypeName $targetType -Keyword $kw
        $grammarReport.Add("~ $kw (Type changed: $($foundIn -join ', ') -> $targetType)")
        $grammarChanged++
    } else {
        $grammarText = Insert-KeywordIntoBucket -Text $grammarText -TypeName $targetType -Keyword $kw
        $grammarReport.Add("+ $kw (Type=$targetType, scope=$($TypeMap[$targetType].Scope), added)")
        $grammarChanged++
    }
}

# ---------------------------------------------------------------------------
# Apply the table to gcbasic.acp (add-or-update, in memory only so far)
# ---------------------------------------------------------------------------
$acpReport = [System.Collections.Generic.List[string]]::new()
$acpChanged = 0
$acpLines = $null

if (-not $SkipHelpLookup) {
    $acpLines = [System.Collections.Generic.List[string]]::new()
    $acpLines.AddRange([string[]](Get-Content -Path $acpPath))

    foreach ($row in $Keywords) {
        $kw = $row.Keyword.Trim()
        $help = $row.HelpPage.Trim()
        $esc = [regex]::Escape($kw)

        $lineIdx = -1
        for ($i = 0; $i -lt $acpLines.Count; $i++) {
            # Boundary after the keyword is "(" (signature follows), "|" (help
            # page or description follows), or end-of-line (a bare entry with
            # nothing after the keyword at all, e.g. "-> VarToBin").
            if ($acpLines[$i] -match "(?i)^->\s*$esc\s*(\(|\||$)") { $lineIdx = $i; break }
        }

        if ($lineIdx -lt 0) {
            $acpLines.Add("-> $kw | \$help")
            $acpReport.Add("+ $kw -> $help (added)")
            $acpChanged++
            continue
        }

        $line = $acpLines[$lineIdx]
        if ($line -match "(?i)\\?[\w\-\.]+\.html\s*$") {
            $currentHelp = $Matches[0].Trim().TrimStart('\')
            if ($currentHelp -ieq $help) {
                $acpReport.Add("= $kw (HelpPage=$help, unchanged)")
                continue
            }
            $acpLines[$lineIdx] = [regex]::Replace($line, "(?i)\\?[\w\-\.]+\.html\s*$", "\$help")
            $acpReport.Add("~ $kw (HelpPage changed: $currentHelp -> $help)")
            $acpChanged++
        } else {
            $acpLines[$lineIdx] = $line.TrimEnd() + " | \$help"
            $acpReport.Add("~ $kw (had no help-page reference - appended \$help)")
            $acpChanged++
        }
    }
}

# ---------------------------------------------------------------------------
# Report, then write (respecting -WhatIf / -Confirm via SupportsShouldProcess)
# ---------------------------------------------------------------------------
Write-Host ""
Write-Host "Grammar (GCB.tmLanguage.json):" -ForegroundColor Cyan
foreach ($line in $grammarReport) {
    $colour = if ($line.StartsWith('+')) { 'Green' } elseif ($line.StartsWith('~')) { 'Yellow' } else { 'DarkGray' }
    Write-Host "  $line" -ForegroundColor $colour
}

if (-not $SkipHelpLookup) {
    Write-Host ""
    Write-Host "F1 Help lookup (gcbasic.acp):" -ForegroundColor Cyan
    foreach ($line in $acpReport) {
        $colour = if ($line.StartsWith('+')) { 'Green' } elseif ($line.StartsWith('~')) { 'Yellow' } else { 'DarkGray' }
        Write-Host "  $line" -ForegroundColor $colour
    }
}
Write-Host ""

if ($grammarChanged -eq 0 -and $acpChanged -eq 0) {
    Write-Host "Nothing to do - every keyword in the table already matches." -ForegroundColor Yellow
    return
}

if ($grammarChanged -gt 0) {
    if ($PSCmdlet.ShouldProcess($grammarPath, "Add/update $grammarChanged keyword(s)")) {
        $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
        Copy-Item -Path $grammarPath -Destination "$grammarPath.bak_$stamp"
        # Write UTF-8 with NO BOM, matching the original file exactly - Set-Content
        # -Encoding UTF8 in Windows PowerShell 5.1 always adds a BOM, which this
        # file does not otherwise have.
        $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
        [System.IO.File]::WriteAllText($grammarPath, $grammarText, $utf8NoBom)
        Write-Host "Updated $grammarPath (backup: $grammarPath.bak_$stamp)" -ForegroundColor Green
    }
}

if (-not $SkipHelpLookup -and $acpChanged -gt 0) {
    if ($PSCmdlet.ShouldProcess($acpPath, "Add/update $acpChanged F1-help line(s)")) {
        $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
        Copy-Item -Path $acpPath -Destination "$acpPath.bak_$stamp"
        # Same no-BOM concern as the grammar file - WriteAllLines uses
        # Environment.NewLine (CRLF on Windows) between lines, matching this
        # file's existing line endings.
        $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
        [System.IO.File]::WriteAllLines($acpPath, $acpLines, $utf8NoBom)
        Write-Host "Updated $acpPath (backup: $acpPath.bak_$stamp)" -ForegroundColor Green
    }
}

}
catch {
    Write-Host ""
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}
finally {
    Wait-ForExit
}
