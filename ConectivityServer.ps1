#Connection with servers
# Headboard
Clear-Host
Write-Host " ----- Conectividad -----"
#Import the data
$datos= Import-Csv -Path C:\material\servidores.csv
#We go through the data
    foreach ($i in $datos) {
    $respuesta=Test-Connection $i.ip -Count 1 -quiet
    if ($respuesta -eq "true") {
        Write-Host "$i Conexión establecida"
        }else {Write-Host "$i Error de conexión"}
    }

