function menu{
@"
ACCIONES PARA USUARIOS
----------------------
1.Listar usuarios disponibles
2.Crear nuevo usuario (nombre y contraseña)
3.Eliminar usuario
4.Modificar usuario
5.Salir

"@

}

do {
    menu
    $opciones = Read-Host "Introduce la acción que quiera hacer: "
    switch($opciones){
    "1"{
       Get-LocalUser | Select-Object name | Out-Host
       }

    "2"{
       Clear-Host
       $usuario = Read-Host "Introduce el nombre de usuario"
       $contraseña = Read-Host "Introduce la contraseña" -AsSecureString
       New-LocalUser $usuario -Password $contraseña
       }

    "3"{
       $usuario = Read-host "Introduce el usuario que quiera eliminar"
       Remove-LocalUser $usuario
       }

    "4"{
       $usuario = Read-Host "Introduce el usuario a cambiar"
       $nuevonombre = Read-Host "Introduce el nuevo nombre de usuario "
       $contraseña = Read-Host "Introduce la contraseña a cambiar"

       Rename-LocalUser $usuario -NewName $nuevonombre 
       Set-LocalUser -Name $nuevonombre -Password (ConvertTo-SecureString $contraseña -AsPlainText -Force)
       
       }

    "5"{
       Write-Host "Saliendo"
       }
    default{
       Write-Host "Opción no válida"
       }
    
    
    }


}while($opciones -ne "5")
