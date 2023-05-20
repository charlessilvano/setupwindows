
Set-ExecutionPolicy Unrestricted

Invoke-WebRequest -Uri "https://file.notion.so/f/s/8fcfdda3-3f69-49a7-b225-8a4d08b2eb75/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle?id=5bd193ab-ea07-43c2-9ddf-f9f5e90c5e21&table=block&spaceId=e2e3fc15-fa09-4d25-8b3f-a651c7cad2fd&expirationTimestamp=1683739062542&signature=qdvbGU_dejS6Ot257c2UpM7sY6D6UvgS4ZzuFxgqT0Y&downloadName=Microsoft.DesktopAppInstaller.msixbundle" -OutFile "C:\Users\Usuário\Downloads\Winget.msixbundle"
Add-AppxPackage -Path "C:\Users\Usuário\Downloads\Winget.msixbundle"

New-Item -ItemType Directory -Path "C:\Windows\Web\Charles Silvano"

Add-LocalGroupMember -Group 'Administradores' -Member 'Usuário'

Invoke-WebRequest -Uri "https://trello.com/1/cards/645a43925195e2b10e4205e5/attachments/645a43c1bfafadfdcde2be31/download/Logo_Simples_Colorida.png" -OutFile "C:\Users\Usuário\Downloads\user.png"
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