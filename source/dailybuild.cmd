echo off
cls
if exist ..\output\chm\gcbasic.chm t del ..\output\chm\gcbasic.chm
if NOT exist "C:\Program Files\FileZilla FTP Client\psftp.exe"  (
echo C:\Program Files\FileZilla FTP Client\psftp.exe required
pause
goto fin
)

if NOT exist ..\prog\utils\installNote.txt (
echo Unpack GCBdoc_TooChain.zip to create the "prog" folders
pause
goto fin
)

svn up ..\..\..\help.git
call all
:jump1
if exist ..\output\chm\gcbasic.chm (
"C:\Program Files\FileZilla FTP Client\psftp.exe"  -v great-cow-basic@web.sourceforge.net -pw %1 -b BatchFile.psftp
)
:fin
