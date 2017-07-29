# Ruby Ubicaciones del Perú - SQLite3

Basado en boilerplate wixel de Sinatra. Gestión de las ubicaciones (departamento, provincia y distritos) del Perú.

### Antes de usar

	$ bundler install

### Rutas

	+ get - departamento/listar
	+ get - provincia/listar/:departamento_id
	+ get - distrito/listar/:provincia_id

# Fuentes:

+	https://github.com/Wixel/Frank-Sinatra
+ https://github.com/jeremyevans/sequel