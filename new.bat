@ECHO OFF
if "%~1" == [] goto select
bin\dosomething "%~1"
goto :EOF
@ECHO OFF

if "%~1" == "" goto SELECT
bin\dosomething "%~1"
goto :EOF

:SELECT

setlocal
for /f "delims=" %%I in ('powershell -noprofile "iex (${%~f0} | out-string)"') do (
    echo You chose %%~I
    bin\dosomething "%%~I"
)
goto :EOF

: end Batch portion / begin PowerShell hybrid chimera #>

Add-Type -AssemblyName System.Windows.Forms
$f = new-object Windows.Forms.OpenFileDialog
$f.InitialDirectory = pwd
$f.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
$f.ShowHelp = $true
$f.Multiselect = $true
[void]$f.ShowDialog()
if ($f.Multiselect) { $f.FileNames } else { $f.FileName }