#Pedimos el número del disco
Get-disk
$numdisk = Read-Host "¿Qué disco quiere utilizar?"

#Obtenemos el tamaño del disco pedido en GB
$tamdisk = (Get-Disk -Number $numdisk | Select-Object Size).Size /1GB
Write-Host "El tamaño del disco $numdisk es de $tamdisk GB."

#Abrimos el diskpart, limpiamos el disco seleccionado y lo convertimos en dinámico y gpt.
@"
sel disk $numdisk
clean
conv gpt
con dyn
"@ | diskpart

#Creamos particiones de 1GB hasta que no quede espacio en el disco.
$letra = 'D'
$numvol = 0
for ($espacdisk = 1; $espacdisk -le $tamdisk; $espacdisk++) {
$letra = [char]([int]$letra[0] + 1)
$numvol++
@"
sel disk $numdisk
create volume simple size=1022
format fs='NTFS' label='Volumen $numvol' 'quick'
assign letter $letra
"@ | diskpart
}
