class App < Sinatra::Base
	get '/distrito/listar/:provincia_id' do
		distrito = Distrito.new
		distrito.listar(params['provincia_id']).to_json
	end

	get '/distrito/buscar' do
		distrito = Distrito.new
		distrito.buscar(params['nombre']).to_json
	end

	post '/distrito/guardar' do
   	data = params[:data]
      array_json_tabla = JSON.parse(data)

      nuevos = array_json_tabla["nuevos"]
      editados = array_json_tabla["editados"]
      eliminados = array_json_tabla["eliminados"]

      begin
          if !nuevos.empty?
              array_nuevos = Array.new
              for i in 0..nuevos.length - 1
                  temp_id = nuevos[i]['id']
                  nombre = nuevos[i]['nombre'].gsub(" ", "%20") #esto es para reemplazar los espacios en blanco porque httparty arroja error
                  nuevo = crear_distrito(temp_id, nombre)
                  array_nuevos.push(nuevo)
              end
          end
          if !editados.empty?
              for i in 0..editados.length - 1
                  id = editados[i]['id']
                  nombre = editados[i]['nombre'].gsub(" ", "%20") #esto es para reemplazar los espacios en blanco porque httparty arroja error
                  editar_distrito(id, nombre)
              end
          end
          if !eliminados.empty?
              for i in 0..eliminados.length - 1
                  id = eliminados[i]
                  eliminar_distrito(id)
              end
          end
          rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha registrado los cambios en los distritos", array_nuevos] }.to_json
      rescue StandardError => e #ZeroDivisionError
          rpta = { :tipo_mensaje => "error", :mensaje => ["Se ha producido un error en guardar la tabla de distritos", e] }.to_json
      end

      rpta
    end

    private
    def crear_distrito(temp_id, nombre, distritio_id)
    	distrito = Distrito.new
      id_generado = distrito.crear(nombre, distritio_id)
      {:temporal => temp_id, :nuevo_id => id_generado}
    end

    private
    def editar_distrito(id, nombre)
    	distrito = Distrito.new
     distrito.editar(id, nombre)
    end

    private
    def eliminar_distrito(id)
    	 distrito = Distrito.new
       distrito.eliminar(id)
    end
end