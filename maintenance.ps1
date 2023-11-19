# Desabilitar as restricoes do Powershell
Write-Host "Alterando as Politicas do Powershell"
Set-ExecutionPolicy Unrestricted

# Autorizacao para seguranca de repositorio
Write-Host "Autorizando o uso de repositorio"
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# Download e Instalacao do DriverEasy
Write-Host "Instalando o atualizador de driver"
cd C:\Temp
Invoke-WebRequest -Uri "https://www.drivereasy.com/DriverEasy_Setup.exe" -OutFile setup.exe
$drivereasy = "C:\Temp\setup.exe"
Start-Process -FilePath $drivereasy -Wait
Invoke-webRequest -Uri "https://maker.ifttt.com/trigger/checar_comandos/json/with/key/eAB2rNKFcLikbDNdEl7k0ukFZgkHaxOpnU5MeP-s68J"
$folder = "C:\Program Files\Easeware"
if ($folder -eq "C:\Program Files\Easeware") {
    $drivereasy = "$folder\DriverEasy\DriverEasy.exe"
    Start-Process $drivereasy -Wait
}
else {
    $folder = "C:\Program Files (x86)\Easeware"
    $drivereasy = "$folder\DriverEasy\DriverEasy.exe"
    Start-Process $drivereasy -Wait
}
Invoke-webRequest -Uri "https://maker.ifttt.com/trigger/checar_comandos/json/with/key/eAB2rNKFcLikbDNdEl7k0ukFZgkHaxOpnU5MeP-s68J"
cd 'C:\Windows\System32\'
Invoke-webRequest -Uri "https://maker.ifttt.com/trigger/checar_comandos/json/with/key/eAB2rNKFcLikbDNdEl7k0ukFZgkHaxOpnU5MeP-s68J"

# Remocao do DriverEasy
WinGet Uninstall Easeware.Drivereasy --silent

# Instalacao do modulo de atualizacao do Windows Update pelo Powershell
Write-Host "Realizando o Update do Windows"
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Invoke-webRequest -Uri "https://maker.ifttt.com/trigger/checar_comandos/json/with/key/eAB2rNKFcLikbDNdEl7k0ukFZgkHaxOpnU5MeP-s68J"
Install-WindowsUpdate
Invoke-webRequest -Uri "https://maker.ifttt.com/trigger/checar_comandos/json/with/key/eAB2rNKFcLikbDNdEl7k0ukFZgkHaxOpnU5MeP-s68J"

# Removendo programas sem utilidade
WinGet UnInstall microsoft.onedrive --Silent
WinGet UnInstall Microsoft.BingNews_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.GetHelp_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.Getstarted_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.SkypeApp_kzf8qxf38zg5c --Silent
WinGet UnInstall Microsoft.Microsoft3DViewer_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.MixedReality.Portal_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe --Silent
WinGet UnInstall SpotifyAB.SpotifyMusic_zpdnekdrzrea0 --Silent
WinGet UnInstall Disney.37853FC22B2CE_6rarf9sa4v8jt --Silent
WinGet UnInstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.Teams_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.Todos_8wekyb3d8bbwe --Silent
WinGet UnInstall MicrosoftCorporationII.MicrosoftFamily_8wekyb3d8bbwe --Silent
WinGet UnInstall MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.Office.OneNote_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe --Silent

# Fazer a limpeza dos arquivos temporarios
Write-Host "Efetuando o processo de limpeza do Windows"
Remove-Item -Path "C:\Windows\Temp\*" -Recurse
Remove-Item -Path "C:\Windows\System32\LogFiles\*" -Recurse
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse

# Limpeza interna do sistema
$default = "C:\Windows\System32\"
cd $default
Start-Process .\cleanmgr.exe -Wait

# Desfragmentar todo o disco
defrag /C /U /V
defrag /C /U /V
defrag /C /U /V

# Renicio da maquina para finalizar as otimizacoes
Invoke-webRequest -Uri "https://maker.ifttt.com/trigger/checar_comandos/json/with/key/eAB2rNKFcLikbDNdEl7k0ukFZgkHaxOpnU5MeP-s68J"
chkdsk /f
Sfc /ScanNow
Dism /Online /Cleanup-Image /RestoreHealth
ShutDown -r -t 0
