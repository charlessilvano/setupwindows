# Download do pacote Microsoft Office
Invoke-WebRequest -Uri "https://raw.github.com/charlessilvano/setupwindows/main/files/office.exe" -OutFile "$env:USERPROFILE\Downloads\office.exe"

# Iniciar instalacao do pacote Microsoft Office
$office = "$env:USERPROFILE\Downloads\office.exe"
Start-Process -FilePath $office -Wait

# Ativacao do Microsoft Office
$info = "cd %ProgramFiles%\Microsoft Office\Office16 >nul&for /f %x in (dir /b ..\root\Licenses16\Standard2021VL*.xrm-ms) do cscript ospp.vbs /inslic:..\root\Licenses16\%x  >nul&cscript //nologo ospp.vbs /inpkey:KDX7X-BNVR8-TXXGX-4Q7Y8-78VT3  >nul&cscript //nologo slmgr.vbs /ckms >nul&cscript //nologo slmgr.vbs /ckms >nul&cscript //nologo ospp.vbs /setprt:1688 >nul&cscript //nologo ospp.vbs /sethst:e8.us.to >nul&cscript //nologo ospp.vbs /act"
New-Item -Path "$env:USERPROFILE\Downloads\active.txt" -ItemType File -Value $info

# Fazer download do certificado de garantia do serviço de formatacao
Invoke-WebRequest -Uri "https://raw.github.com/charlessilvano/setupwindows/main/files/CSTI.p12" -OutFile "$env:USERPROFILE\Downloads\CSTI.p12"

# Insercao de senha raiz
$Password = Read-Host -Promp "Digite a senha master"

# Instalacao do certificado
Get-ChildItem -Path $env:USERPROFILE\Downloads\CSTI.p12 | Import-PfxCertificate -CertStoreLocation Cert:\CurrentUser\Root -Password (ConvertTo-SecureString -String $Password -AsPlainText -Force)
