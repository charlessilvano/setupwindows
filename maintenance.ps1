# Download e Instalação do DriverEasy
Invoke-WebRequest -Uri "https://www.drivereasy.com/DriverEasy_Setup.exe" -OutFile C:\Temp\setup.exe
$drivereasy = C:\Temp\setup.exe
Start-Process -FilePath $drivereasy -Wait

# Instalção do módulo de atualização do Windows Update pelo Powershell
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate

# Fazer a limpeza dos arquivos temporários
Remove-Item -Path "C:\Temp" -Recurse
Remove-Item -Path "C:\Windows\Temp\*" -Recurse
Remove-Item -Path "C:\Windows\System32\LogFiles\*" -Recurse
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse
