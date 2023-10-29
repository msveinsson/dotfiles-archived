# 
# ██████╗  ██████╗ ██╗    ██╗███████╗██████╗ ███████╗██╗  ██╗███████╗██╗     ██╗     
# ██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔══██╗██╔════╝██║  ██║██╔════╝██║     ██║     
# ██████╔╝██║   ██║██║ █╗ ██║█████╗  ██████╔╝███████╗███████║█████╗  ██║     ██║     
# ██╔═══╝ ██║   ██║██║███╗██║██╔══╝  ██╔══██╗╚════██║██╔══██║██╔══╝  ██║     ██║     
# ██║     ╚██████╔╝╚███╔███╔╝███████╗██║  ██║███████║██║  ██║███████╗███████╗███████╗
# ╚═╝      ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
#  

#Requires -modules Terminal-Icons,PSTree

$Global:MYPSHOME = "$HOME/code/personal/pwsh"
$Global:MYSQLHOME = "$HOME/code/personal/db-sql/pwsh"


# Load PWSH Environment if available
if (Test-Path $Global:MYPSHOME) {
    $Global:MYPSFUNCTIONS = Join-Path -Path $Global:MYPSHOME -ChildPath 'functions'
    $Global:MYPSMODULES = Join-Path -Path $Global:MYPSHOME -ChildPath 'modules'
    $Global:MYPSSCRIPTS = Join-Path -Path $Global:MYPSHOME -ChildPath 'scripts'

    Get-ChildItem -Path $(Join-Path -Path $Global:MYPSFUNCTIONS -ChildPath 'auto') -Filter *.ps1 | ForEach-Object {
        . $_.FullName
    }

    if (-Not ($env:PSModulePath.Contains($Global:MYPSMODULES) )) {
        $env:PSModulePath += ':' + ($Global:MYPSMODULES)
    }
}

# Load MS SQL Server Environment if available
if (Test-Path $Global:MYSQLHOME) {

    $Global:MYSQLFUNCTIONS = Join-Path -Path $Global:MYSQLHOME -ChildPath 'functions'
    $Global:MYSQLMODULES = Join-Path -Path $Global:MYSQLHOME -ChildPath 'modules'
    $Global:MYSQLSCRIPTS = Join-Path -Path $Global:MYSQLHOME -ChildPath 'scripts'

    Get-ChildItem -Path $(Join-Path -Path $Global:MYSQLFUNCTIONS -ChildPath 'auto') -Filter *.ps1 | ForEach-Object {
        . $_.FullName
    }

    if (-Not ($env:PSModulePath.Contains($Global:MYSQLMODULES) )) {
        $env:PSModulePath += ':' + ($Global:MYSQLMODULES)
    }
}

$env:PATH += ':/opt/homebrew/bin:/opt/homebrew/sbin'

$ENV:STARSHIP_CONFIG = "$HOME/.config/starship_ps.toml"
$ENV:STARSHIP_DISTRO = "ps "

Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons

if ($Host.UI.RawUI.WindowSize.Width -lt 54 -or $Host.UI.RawUI.WindowSize.Height -lt 15) {
    $SetPredictionViewStyle = "InlineView"
}
else {
    $SetPredictionViewStyle = "ListView"
}

$PSReadLineOptions = @{
    PredictionSource              = "HistoryAndPlugin"
    PredictionViewStyle           = $SetPredictionViewStyle
    EditMode                      = "Vi"
    HistoryNoDuplicates           = $true
    HistorySearchCursorMovesToEnd = $true
    ViModeIndicator               = "Cursor"
}
Set-PSReadLineOption @PSReadLineOptions

# Enables Up Arrow and Down keys to search backward and forward for commands in the history.
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Sometimes you enter a command but realize you forgot to do something else first.
# This binding will let you save that command in the history so you can recall it,
# but it doesn't actually execute.  It also clears the line with RevertLine so the
# undo stack is reset - though redo will still reconstruct the command line.
Set-PSReadLineKeyHandler -Key Alt+w `
    -BriefDescription SaveInHistory `
    -LongDescription "Save current line in history but do not execute" `
    -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
}

# Traversing directories
function cd... { Set-Location ..\.. }
function cd.... { Set-Location ..\..\.. }

# Git stuff
function gcom { git add . && git commit -m "$args" }
function lazyg { git add . && git commit -m "$args" && git push }

# Other
function ix ($file) {
    curl.exe -F "f:1=@$file" ix.io
}
function grep($regex, $dir) {
    if ( $dir ) {
        Get-ChildItem $dir | Select-String $regex
        return
    }
    $input | Select-String $regex
}
function touch($file) {
    "" | Out-File $file -Encoding ASCII
}
function df {
    get-volume
}
function sed($file, $find, $replace) {
    (Get-Content $file).replace("$find", $replace) | Set-Content $file
}
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}
function export($name, $value) {
    set-item -force -path "env:$name" -value $value;
}
function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}
function pgrep($name) {
    Get-Process $name
}