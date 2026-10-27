param([string]$Path)

Get-ChildItem $Path -Directory -Recurse |
    Where-Object { $_.Name -match '^Action\d+$' } |
    Where-Object { -not (Test-Path (Join-Path $_.FullName 'Script.mts')) } |
    Select-Object -ExpandProperty FullName |
    Tee-Object -Variable results |
    Set-Content missing_folders.txt

Write-Host "Missing Script.mts: $($results.Count) folder(s) -> missing_folders.txt"