# Mostra o que esta ocupando espaco no PC. SO LE, NAO APAGA NADA.
$ErrorActionPreference = 'SilentlyContinue'
$dl = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
function Tam($p) { if (Test-Path $p) { [math]::Round(((Get-ChildItem $p -Recurse -Force -File | Measure-Object Length -Sum).Sum) / 1GB, 1) } else { 0 } }

$saida = @()
$saida += "=== DISCOS ==="
Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Used -gt 0 } | ForEach-Object {
  $tot = $_.Used + $_.Free
  $saida += "{0}:  livre {1} GB de {2} GB ({3}% cheio)" -f $_.Name, [math]::Round($_.Free/1GB,1), [math]::Round($tot/1GB,1), [math]::Round($_.Used*100/$tot)
}

$saida += ""
$saida += "=== LIXO QUE DA PRA LIMPAR (GB) ==="
$itens = [ordered]@{
  'Temporarios do usuario'        = $env:TEMP
  'Temporarios do Windows'        = 'C:\Windows\Temp'
  'Atualizacoes baixadas'         = 'C:\Windows\SoftwareDistribution\Download'
  'Windows antigo (Windows.old)'  = 'C:\Windows.old'
  'Cache NVIDIA (DXCache)'        = "$env:LOCALAPPDATA\NVIDIA\DXCache"
  'Cache NVIDIA (GLCache)'        = "$env:LOCALAPPDATA\NVIDIA\GLCache"
  'Cache AMD'                     = "$env:LOCALAPPDATA\AMD\DxCache"
  'Cache sombreador DirectX'      = "$env:LOCALAPPDATA\D3DSCache"
  'Cache Chrome'                  = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache"
  'Cache Edge'                    = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache"
  'Erros salvos (CrashDumps)'     = "$env:LOCALAPPDATA\CrashDumps"
  'Downloads'                     = $dl
}
foreach ($k in $itens.Keys) { $saida += "{0,-32} {1}" -f $k, (Tam $itens[$k]) }
$lixeira = (New-Object -ComObject Shell.Application).NameSpace(10).Items() | Measure-Object -Property Size -Sum
$saida += "{0,-32} {1}" -f 'Lixeira', [math]::Round($lixeira.Sum/1GB,1)

$saida += ""
$saida += "=== 20 MAIORES PROGRAMAS INSTALADOS (GB) ==="
$chaves = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*','HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
Get-ItemProperty $chaves | Where-Object { $_.DisplayName -and $_.EstimatedSize } |
  Sort-Object EstimatedSize -Descending | Select-Object -First 20 | ForEach-Object {
    $saida += "{0,-55} {1}" -f $_.DisplayName, [math]::Round($_.EstimatedSize/1MB,1)
  }

$saida += ""
$saida += "=== 15 MAIORES ARQUIVOS EM DOWNLOADS ==="
Get-ChildItem $dl -File -Recurse | Sort-Object Length -Descending | Select-Object -First 15 | ForEach-Object {
  $saida += "{0,-55} {1} GB  (mexido em {2:dd/MM/yyyy})" -f $_.Name, [math]::Round($_.Length/1GB,2), $_.LastWriteTime
}

$arq = (Join-Path ([Environment]::GetFolderPath('Desktop')) 'relatorio-espaco.txt')
$saida | Out-File -Encoding utf8 $arq
$saida
Write-Host "`nPronto! Relatorio salvo na Area de Trabalho: relatorio-espaco.txt" -ForegroundColor Green
Read-Host "Aperte Enter para fechar"

