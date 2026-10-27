Get-ChildItem .\XMLS\*.xml | ForEach-Object {
    [xml]$x = Get-Content $_.FullName -Raw
    $vals = $x.SelectNodes("//*[inputSymbol='_pdg_list']/value") | ForEach-Object {
        $_.InnerText -split ','
    }
    if ($vals) {
        ($_.FullName + ';' + ($vals -join ';'))
    }
} | Set-Content pdg_list.csv