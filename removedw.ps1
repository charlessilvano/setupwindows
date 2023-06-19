# Parar o servico do DWService
Stop-Service -Name DWAgent
# Remover o servico do DWService
Remove-Service -Name DWAgent
# Excluir a pasta com os recursos do DWService
Remove-Item -Recurse -Force "c:\Program Files\DWAgent"
# Remover a pasta dos recursos do DWService do Regedit
Remove-Item -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DWAgent" -Recurse
