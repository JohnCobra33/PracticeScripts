function menu{
@"
Selecciona el tipo de pizza que quiera
--------------------------------------

1.Pizza vegana
2.Pizza comun
3.Salir

--------------------------------------

"@
}

do{
    menu

    $opcion = Read-Host "Introduce la opción que quiera:"

    switch ($opcion){
        "1"{
            Write-Host "Ingredientes para la pizza"
            Write-Host "`t1.Pimiento"
            Write-host "`t2.Tofu"
            $ingrediente = Read-Host "Selecciona un ingrediente: "
            if ($ingrediente -eq 1){
                Write-Host "La pizza contiene tomate, mozzarella y pimineto "
            } 
            else {
                Write-Host "Has añadido el tofu"
                Write-Host "----------"
                Write-Host "La pizza contiene tomate, mozzarella y tofu"
            }
            

        }
        "2"{
            Write-Host "Ingredientes para la pizza"
            Write-Host "`t1.Peperoni"
            Write-host "`t2.Jamon"
            Write-Host "`t3.Salmon"
            $ingrediente = Read-Host "Selecciona un ingrediente: "
            if ($ingrediente -eq 1){
                Write-Host "La pizza contiene tomate, mozzarella y peperoni "
            } 
            elseif ($ingrediente -eq 2){
                Write-Host "La pizza contiene tomate, mozzarella y jamon "
            }
            else{
                Write-Host "La pizza contiene tomate, mozzarella y salmon"
            }
        }
        "3"{
            Write-host "Saliendo del menu"
        }
        default{
    Write-Host "Introduce un valor valido"
    }
    }
    

}
While ($opcion -ne "3")
