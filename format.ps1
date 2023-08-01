# Desabilitar as restricoes do Powershell
Set-ExecutionPolicy Unrestricted

# Definir o repositorio como seguro para instalacoes.
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# Renomear a particao do disco principal
Set−Volume −DriveLetter 'C' −NewFileSystemLabel 'Windows'

# Iniciando o processo de atualizacao dos aplicativos Na Microsoft Store
Write-Host "Inicie a Microsoft Store e atualize todos os programas, antes de continuar com a configuracao"
pause
Write-Host "Atualizacao de programas finalizada"

# Fazer download do pacote WinGet
Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.5.1881/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "$env:USERPROFILE\Downloads\Winget.msixbundle"

# Fazer download do certificado de garantia do serviço de formatacao
Invoke-WebRequest -Uri 'https://raw.github.com/charlessilvano/setupwindows/main/files/CSTI.p12' -OutFile $env:USERPROFILE\Downloads\CSTI.p12

# Insercao de senha raiz
$Password = Read-Host -Promp "Digite a senha master"

# Instalacao do certificado
Get-ChildItem -Path $env:USERPROFILE\Downloads\CSTI.p12 | Import-PfxCertificate -CertStoreLocation Cert:\CurrentUser\Root -Password (ConvertTo-SecureString -String $Password -AsPlainText -Force)

# Executar instalacoo do pacote WinGet
Add-AppxPackage -Path "$env:USERPROFILE\Downloads\Winget.msixbundle"

# Criando um direto de arquivos de mídia
New-Item -ItemType Directory -Path "C:\Windows\Web\Charles Silvano"

# Download do pacote Microsoft Office
Invoke-WebRequest -Uri "https://raw.github.com/charlessilvano/setupwindows/main/files/office.exe" -OutFile "$env:USERPROFILE\Downloads\office.exe"

# Iniciar instalacao do pacote Microsoft Office
$office = "$env:USERPROFILE\Downloads\office.exe"
Start-Process -FilePath $office -Wait

# Ativacao do Microsoft Office
$info = "cd %ProgramFiles%\Microsoft Office\Office16 >nul&for /f %x in ('dir /b ..\root\Licenses16\Standard2021VL*.xrm-ms') do cscript ospp.vbs /inslic:'..\root\Licenses16\%x'  >nul&cscript //nologo ospp.vbs /inpkey:KDX7X-BNVR8-TXXGX-4Q7Y8-78VT3  >nul&cscript //nologo slmgr.vbs /ckms >nul&cscript //nologo slmgr.vbs /ckms >nul&cscript //nologo ospp.vbs /setprt:1688 >nul&cscript //nologo ospp.vbs /sethst:e8.us.to >nul&cscript //nologo ospp.vbs /act"
New-Item -Path "$env:USERPROFILE\Downloads\active.txt" -ItemType File -Value $info

# Fazer downloads dos arquivos user e wallpaper
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/charlessilvano/setupwindows/main/files/user.png" -OutFile "$env:USERPROFILE\Downloads\user.png"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/charlessilvano/setupwindows/main/files/wallpaper.png" -OutFile "$env:USERPROFILE\Downloads\wallpaper.png"

# Copiando os arquivos para a pasta de midia
Copy-Item -Path "$env:USERPROFILE\Downloads\user.png" -Destination "C:\Windows\Web\Charles Silvano"
Copy-Item -Path "$env:USERPROFILE\Downloads\wallpaper.png" -Destination "C:\Windows\Web\Charles Silvano"

# Explicar como definir o papel de parede no dispositivo
Write-Host "A seguir sera aberto o papel de parede padrao e para defini-lo voce poderia usar o comando Windows + B e Windows + L, se estiver tudo certo pressione qualquer tecla."
pause

# Abrir o papel de parede pelo aplicativo Fotos
$wallpaper = 'C:\Windows\Web\Charles Silvano\wallpaper.png'
Start-Process $wallpaper

# Confirmacao de configuração do papel de parede padrao
Write-Host 'Se o papel de parede estiver definido, feche o aplicativo Fotos e pressione qualquer tecla para continuar'
pause

# Instalando programas padroes
WinGet Install 7zip.7zip --Silent
WinGet Install Google.Chrome --Silent
WinGet Install Easeware.Drivereasy --Silent
WinGet Install XPDM1ZW6815MQM --Silent
WinGet Install XPDP273C0XHQH2 --Silent

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
WinGet UnInstall Microsoft.Todos_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.Office.OneNote_8wekyb3d8bbwe --Silent
WinGet UnInstall Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe --Silent

# Como verificar os caches do processador
Write-Host "Por favor, abra o Gerenciador de Tarefas e na aba Desempenho verifique quais os valores de cacheado processador."
$input = Read-Host -Prompt "Pressione qualquer tecla para continuar"

# Inserindo o valor do cache L2
Write-Host "Qual e o valor do cache L2 em KB?"
$L2 = Read-Host

# Verificando se o processador tem cache L3 e qual o seu valor
Write-Host "Seu processador tem cache L3?"
$cacheL3 = Read-Host -Prompt "Digite sim ou nao."
If ($cacheL3 -eq "sim") {
Write-Host "Qual e o valor do cache L3 em KB?"
$L3 = Read-Host
}

# Inserindo os valores dos caches L2 no registro do sistema
Write-Host "Alterando o valor do arquivo Dword do cache L2"
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name SecondLevelDataCache -Value $L2 -Type DWord

# Inserindo os valores dos caches L3 no registro do sistema
If ($cacheL3 -eq "sim") {
Write-Host "Criando um arquivo Dword do cache L3"
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name ThirdLevelDataCache -Type DWord -Value $L3
}

# Configurando nome de usuario
$NewName = Read-Host -Promp "Digite o novo nome de usuario"
Rename-LocalUser -Name "Usuario" -NewName $NewName

# Configurando nome do computador
$Computador = Read-Host "Digite o novo nome do Computador"
Rename-Computer -NewName $Computador

# Realizando atualizacoes pelo Windows Update
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate
