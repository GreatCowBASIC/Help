<?xml version="1.0" encoding="UTF-8"?>
<!--
  GCBASIC CHM customization layer.

  Imports the stock DocBook-NS htmlhelp stylesheet unmodified and overrides
  only what's needed to make external (http/https) links actually launch the
  reader's real, installed web browser when clicked from inside a compiled
  .chm file.

  Why this is needed: the Microsoft HTML Help viewer (hh.exe) renders every
  topic page in its own embedded, security-locked-down browser control. Even
  when a link carries target="_blank" (which is what docbook-xsl emits when
  an <link xlink:show="new">, i.e. the AsciiDoc "^" window marker, is
  present), hh.exe does NOT hand the navigation off to the system's default
  browser, it just opens a second copy of that same restricted embedded
  control. Many modern sites (SourceForge, GitHub, etc.) reject requests from
  that old engine's user agent/TLS stack with an HTTP 403, which is exactly
  the "The website declined to show this webpage" error this fixes.

  The actual, reliable fix (a long-standing, well-known CHM technique) is to
  have the link's onclick handler call Shell.Application.ShellExecute via
  ActiveX, which asks the Windows shell to open the URL with the OS's real
  registered default browser, completely bypassing hh.exe's own renderer.
  If that ActiveX call isn't available (e.g. this same htm is ever opened in
  a plain modern browser instead of via a .chm), the handler returns true and
  lets the normal target="_blank" navigation proceed instead, so nothing is
  ever left broken.

  gcbdoc.bat's CHM target must point its GCBxsl variable at THIS file rather
  than at prog\docbook-xsl-ns-1.78.1\htmlhelp\htmlhelp.xsl directly, or none
  of this applies.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:d="http://docbook.org/ns/docbook"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                exclude-result-prefixes="d xlink"
                version="1.0">

  <xsl:import href="../prog/docbook-xsl-ns-1.78.1/htmlhelp/htmlhelp.xsl"/>

  <!-- Standard docbook-xsl extension point: called once per topic page,
       right before </head>. Empty by default; this is exactly where a
       customization layer is meant to add shared script/style content. -->
  <xsl:template name="user.head.content">
    <xsl:param name="node" select="."/>
    <script type="text/javascript">
function gcbLaunchExternal(url) {
  try {
    var shell = new ActiveXObject("Shell.Application");
    shell.ShellExecute(url, "", "", "open", 1);
  } catch (e) {
    return true;
  }
  return false;
}
    </script>
  </xsl:template>

  <!-- Every external hyperlink in the GCBASIC help source compiles down to
       a DocBook 5 link element with an xlink:href attribute (asciidoctor's
       docbook5 converter never emits the older ulink element). Route only
       genuinely external (http/https) targets through the launcher above;
       anything else (internal cross-references, #id links) falls through
       unchanged to the stock docbook-xsl rendering via xsl:apply-imports. -->
  <xsl:template match="d:link">
    <xsl:choose>
      <xsl:when test="@xlink:href and
                      (starts-with(@xlink:href, 'http://') or
                       starts-with(@xlink:href, 'https://'))">
        <a href="{@xlink:href}" target="_blank"
           onclick="return gcbLaunchExternal(this.href);">
          <xsl:choose>
            <xsl:when test="count(child::node()) &gt; 0">
              <xsl:apply-templates mode="no.anchor.mode"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@xlink:href"/>
            </xsl:otherwise>
          </xsl:choose>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-imports/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
