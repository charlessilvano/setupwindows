#Desabilitar as restrições do Powershell
Set-ExecutionPolicy Unrestricted
#Fazer download do pacote WinGet
Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "$env:USERPROFILE\Downloads\Winget.msixbundle"
#Executar instalação do pacote WinGet
Add-AppxPackage -Path "$env:USERPROFILE\Downloads\Winget.msixbundle"
#Criando um direto de arquivos de mídia
New-Item -ItemType Directory -Path "C:\Windows\Web\Charles Silvano"
#Configurando o usuário para o grupo Administradores
Add-LocalGroupMember -Group "Administradores" -Member "Usuario"
#Download do pacote Microsoft Office
Invoke-WebRequest -Uri "https://raw.github.com/charlessilvano/setupwindows/main/files/office.exe" -OutFile "$env:USERPROFILE\Downloads"
#Iniciar instalacao do pacote Microsoft Office
$office = "$env:USERPROFILE\Downloads\office.exe"
Start-Process -FilePath $office -Wait
#Ativacao do Microsoft Office
$info = "cd %ProgramFiles%\Microsoft Office\Office16`n`nfor /f %x in ('dir /b ..\root\Licenses16\Standard2021VL*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%x"`n`ncscript ospp.vbs /setprt:1688`n`ncscript ospp.vbs /unpkey:6MWKP >nul`n`ncscript ospp.vbs /inpkey:KDX7X-BNVR8-TXXGX-4Q7Y8-78VT3`n`ncscript ospp.vbs /sethst:e8.us.to`n`ncscript ospp.vbs /act`n`ncscript //nologo slmgr.vbs /ckms >nul&cscript //nologo slmgr.vbs /ckms >nul&cscript //nologo ospp.vbs /setprt:1688 >nul&cscript //nologo ospp.vbs /sethst:e8.us.to >nul&cscript //nologo ospp.vbs /act"
$info | Out-File -FilePath "env:USERPROFILE\Downloads\active.txt"
#Fazer downloads dos arquivos user e wallpaper
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/charlessilvano/setupwindows/main/files/user.png" -OutFile "$env:USERPROFILE\Downloads\user.png"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/charlessilvano/setupwindows/main/files/wallpaper.png" -OutFile "$env:USERPROFILE\Downloads\wallpaper.png"
#Copiando os arquivos para a pasta de mídia
Copy-Item -Path "$env:USERPROFILE\Downloads\user.png" -Destination "C:\Windows\Web\Charles Silvano"
Copy-Item -Path "$env:USERPROFILE\Downloads\wallpaper.png" -Destination "C:\Windows\Web\Charles Silvano"
#Configurando a foto de usuário e papel de parede
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Name LockScreenImage -Value 'C:\Windows\Web\Charles Silvano\wallpaper.png'
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name LockScreenImage -Value 'C:\Windows\Web\Charles Silvano\wallpaper.png'
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name Wallpaper -Value 'C:\Windows\Web\Charles Silvano\wallpaper.png'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Name Wallpaper -Value 'C:\Windows\Web\Charles Silvano\wallpaper.png'
#Instalando programas padrões
winget install 7zip.7zip --silent
winget install Google.Chrome --silent
winget install Easeware.Drivereasy --silent
winget install XPDM1ZW6815MQM --silent
winget install XPDP273C0XHQH2 --silent
#Removendo programas sem utilidade
winget uninstall microsoft.onedrive --silent
winget uninstall Microsoft.BingNews_8wekyb3d8bbwe --silent
winget uninstall Microsoft.GetHelp_8wekyb3d8bbwe --silent
winget uninstall Microsoft.Getstarted_8wekyb3d8bbwe --silent
winget uninstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe --silent
winget uninstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe --silent
winget uninstall Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe --silent
winget uninstall Microsoft.Todos_8wekyb3d8bbwe --silent
winget uninstall Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe --silent
#Configurando nome de usuário
$NewName = Read-Host -Promp "Digite o novo nome de usuario"
Rename-LocalUser -Name "Usuario" -NewName $NewName
#Configurando nome do computador
$Computador = Read-Host "Digite o novo nome do Computador"
Rename-Computer -NewName $Computador
#Realizando atualizações pelo Windows Update
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate
