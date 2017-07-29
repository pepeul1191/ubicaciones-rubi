# Ruby Ubicaciones del Perú - SQLite3

Basado en boilerplate wixel de Sinatra. Gestión de las ubicaciones (departamento, provincia y distritos) del Perú.

### Antes de usar

	$ bundler install

### Rutas

	+ get - departamento/listar
	+ post - departamento/buscar
	+ get - provincia/listar/:departamento_id
	+ post - provincia/buscar
	+ get - distrito/listar/:provincia_id
	+ post - distrito/buscar
	+ get - distrito/buscar?nombre={$nombre}

### TODO

	+ Probar con una tabla js y vista html : post - departamento/buscar
	+ Probar con una tabla js y vista html : post - provincia/buscar
	+ Probar con una tabla js y vista html : post - distrito/buscar

# Fuentes:

+	https://github.com/Wixel/Frank-Sinatra
+ https://github.com/jeremyevans/sequel