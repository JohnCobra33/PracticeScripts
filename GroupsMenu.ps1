function menu{
@"
ACCIONES PARA USUARIOS
----------------------
1.Listar grupos disponibles
2.Ver miembros de un grupo
3.Crear grupo
4.Eliminar grupo
5.Crear miembro de un grupo
6.Eliminar miembro de un grupo
7.Salir

"@

}

do {
    menu
    $opciones = Read-Host "Introduce la acción que quiera hacer: "
    switch($opciones){
    "1"{
       Get-LocalGroup | Select-Object name | Out-Host
       }

    "2"{
       Get-LocalGroupMember | Select-Object name | Out-Host
       }

    "3"{
       $grupo = Read-host "Introduce el grupo que quiera crear"
       New-LocalGroup $grupo
       }

    "4"{
       $elimina = Read-Host "Introduce el nombre del grupo que quiera eliminar"
       Remove-LocalGroup $elimina
       }

    "5"{
       $usuariogrupo = Read-Host "Introduce el nombre del usuario para añadirlo al grupo"
       $contraseña = Read-Host "Introduce la contraseña"
       $grupo = Read-Host "Introduce el nombre del grupo"
       
       New-LocalUser $usuariogrupo -Password (ConvertTo-SecureString $contraseña -AsPlainText -Force)
       Add-LocalGroupMember $grupo -Member $usuariogrupo
       }
    "6"{
       $usuario = Read-Host "Introduce el nombre del usuario que quiera quitar del grupo"
       $grupo = Read-Host "Introduce el nombre del grupo"
       Remove-LocalGroupMember $grupo -Member $usuario
       }
    "7"{
       Write-Host "Saliendo"
       }
    
    default{
       Write-Host "Opción no válida"
       }
    
    
    }


}while($opciones -ne "7")
