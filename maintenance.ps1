# Fazer a limpeza dos arquivos temporários
Remove-Item -Path C:\Windows\Temp -Recurse
Remove-Item -Path C:\Windows\System32\Temp -Recurse
Remove-Item -Path $env:USERPROFILE\AppData\Local\Temp -Recurse
Remove-Item -Path $env:USERPROFILE\AppData\Local\Microsoft\Windows\Temporary Internet Files -Recurse
# Teste