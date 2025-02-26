# RandomPluginNvim
  Este es un plugin de nvim diseñado con el objetivo de generar números y strings aleatorios, principalmente para crear archivos de prueba sin necesidad de usar una inteligencia artificial, ya que puede generar una línea entera con el formato que la persona desee con solo un comando.

### Instalacion :
_Lazy_ :
```lua
return {
  "FedeLupianez/RandomPluginNvim",
  -- En esta tabla se pueden cambiar los valor default
  opts = {
    defaults = {
      min_number = 1, -- Mínimo por default para el random number
      max_number = 999, -- Máximo por default para el random number
      length_string = 14, -- Longitud por default del random string
    },

    keymaps = {
      random_number = "<leader>rn", -- Keymap para generar un número random
      random_string = "<leader>rs", -- Keymap para generar un string random
      random_format = "<leader>rf", -- Keymap para acceder al Random format
    },
	},

  config = function (opts)
    require("RandomPlugin").setup(opts)
  end,
}
```

>[!IMPORTANT]
> Debe tener en cuenta que este plugin escribe el resultado aleatorio que usted eligió sin antes preguntar si lo permite.
> Pero en caso de que el buffer no permita escribir en él, el plugin mostrará una notificación en la parte superior 
> derecha de la pantalla con el resultado

>[!NOTE]
> Los string generados son completamente al azar, así que no tendrán algún sentido.

### Keybinds :
  ( Estos atajos son los que están configurados por defecto, si desea cambiarlos debe hacerlo en la tabla `opts` )
  - El atajo `<leader>rs` generará un string aleatorio con la longitud por default.
  - El atajo `<leader>rn` generará un numero aleatorio entre los valores min y max default.
  - El atajo `<leader>rf` es un atajo al comando _`RandomFormat`_  [Comandos](#Comandos)

### Comandos :
  - `RandomNumber`
    - Nos pedirá dos inputs en la command line, los cuales corresponden primero al mínimo y al máximo personalizados, 
      después de eso, presione enter e insertará el número resultante en el buffer.

  - `RandomString`
    - Nos pedirá un input con la longitud que queremos que tenga la cadena, después de eso, 
      presione enter e insertará el string resultante en el buffer.
  
  - `RandomFormat`
    - Nos pedirá un input en el cual le vamos a tener que especificar el formato de la línea que queremos que genere.
    ##### Las pautas a complir son :
      - Separar cada columna por una *coma ( , )*
      - Especificar al comienzo de cada columna qué tipo de dato se desea en ella
        - `n` -> Para un números
        - `s` -> Para un string
    
    #### Sin argumentos :
      Si no quiere utilizar argumentos, solo debe seguir las pautas anteriores y especificar si la columna es un numero o un string.

      >[!NOTE]
      >Al no utilizar argumentos, plugin utilizará los valores por defecto para generar las columnas.

      _Ejemplo:_
      `n,s,s,n` -> `454,SKTA2Cn,NkzfmgL,381`


    #### Con argumentos :
    - _Número_ :
      - Después de poner la `n`, se debe poner un signo igual ( = ) y después 
        especificar el mínimo y el máximo que debe respetar el resultado separado por una barra ( / ).
        - La línea para especificar un numero con 1 como mínimo y 100 como máximo -> `n=1/100`
    
    - _String_ :
      - Después de poner la `s`, se debe poner un signo igual ( = ) y después especificar la longitud de la cual queremos que la cadena sea.
        - La línea para especificar un string con una longitud de 16 dígitos -> `s=16`

    ##### Un ejemplo de una línea con argumentos sería:
      `n=10/900,s=7,s=15,n=9/100` -> `15,qaEhuFR,hHwQIojmajfAsCM,78`

---
**Autor :** FedeLupianez
**Perfil :**  [Github](https://github.com/FedeLupianez/)
