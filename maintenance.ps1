# Fazer a limpeza dos arquivos temporários
Remove-Item -Path "C:\Temp" -Recurse
Remove-Item -Path "C:\Windows\Temp\*" -Recurse
Remove-Item -Path "C:\Windows\System32\LogFiles\*" -Recurse
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse

