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
cd 'C:\Windows\System32\'

# Remocao do DriverEasy
WinGet Uninstall Easeware.Drivereasy --silent

# Instalacao do modulo de atualizacao do Windows Update pelo Powershell
Write-Host "Realizando o Update do Windows"
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate

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
