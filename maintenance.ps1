# Desabilitar as restricoes do Powershell
Set-ExecutionPolicy Unrestricted

# Autorizacao para segurança de repositorio
Set-PSRepository -Name PSGallery -InstalationPolicy Trusted

# Download e Instalacao do DriverEasy
cd C:\Temp
Invoke-WebRequest -Uri "https://www.drivereasy.com/DriverEasy_Setup.exe" -OutFile setup.exe
$drivereasy = setup.exe
Start-Process -FilePath $drivereasy -Wait

# Instalacao do modulo de atualizacao do Windows Update pelo Powershell
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate

# Fazer a limpeza dos arquivos temporarios
Remove-Item -Path "C:\Temp" -Recurse
Remove-Item -Path "C:\Windows\Temp\*" -Recurse
Remove-Item -Path "C:\Windows\System32\LogFiles\*" -Recurse
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse
