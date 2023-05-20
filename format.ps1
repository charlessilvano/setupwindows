#Desabilitar as restrições do Powershell
Set-ExecutionPolicy Unrestricted
#Fazer download do pacote WinGet
Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "C:\Users\Usuário\Downloads\Winget.msixbundle"
#Executar instalação do pacote WinGet
Add-AppxPackage -Path "C:\Users\Usuário\Downloads\Winget.msixbundle"
#Criando um direto de arquivos de mídia
New-Item -ItemType Directory -Path "C:\Windows\Web\Charles Silvano"
#Configurando o usuário para o grupo Administradores
Add-LocalGroupMember -Group "Administradores" -Member "Usuário"
#Fazer downloads dos arquivos user e wallpaper
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/charlessilvano/setupwindows/main/files/user.png" -OutFile "C:\Users\Usuário\Downloads\user.png"
Invoke-WebRequest -Uri "https://trello.com/1/cards/645a43925195e2b10e4205e5/attachments/645a43dc4cf4eeee4912dd27/download/wallpaper.png" -OutFile "C:\Users\Usuário\Downloads\wallpaper.png"

Copy-Item -Path "C:\Users\Usuário\Downloads\user.png" -Destination "C:\Windows\Web\Charles Silvano"
Copy-Item -Path "C:\Users\Usuário\Downloads\wallpaper.png" -Destination "C:\Windows\Web\Charles Silvano"

Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Name LockScreenImage -Value 'C:\Windows\Web\Charles Silvano\wallpaper.png'
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name LockScreenImage -Value 'C:\Windows\Web\Charles Silvano\wallpaper.png'
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name Wallpaper -Value 'C:\Windows\Web\Charles Silvano\wallpaper.png'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Name Wallpaper -Value 'C:\Windows\Web\Charles Silvano\wallpaper.png'
winget install 7zip.7zip --silent
winget install Google.Chrome --silent
winget install XPDM1ZW6815MQM --silent
winget install XPDP273C0XHQH2 --silent
winget uninstall microsoft.onedrive --silent
winget uninstall Microsoft.BingNews_8wekyb3d8bbwe --silent
winget uninstall Microsoft.GetHelp_8wekyb3d8bbwe --silent
winget uninstall Microsoft.Getstarted_8wekyb3d8bbwe --silent
winget uninstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe --silent
winget uninstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe --silent
winget uninstall Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe --silent
winget uninstall Microsoft.Todos_8wekyb3d8bbwe --silent
winget uninstall Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe --silent


 $NewName = Read-Host -Promp "Digite o novo nome de usuário"
Rename-LocalUser -Name "Usuário" -NewName $NewName
$Computador = Read-Host "Digite o novo nome do Computador"
Rename-Computer -NewName $Computador

Install-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate