class App < Sinatra::Base
	get '/departamento/listar' do
		departamento = Departamento.new
		departamento.listar.to_json
	end

	post '/departamento/guardar' do
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
                  nuevo = crear_departamento(temp_id, nombre)
                  array_nuevos.push(nuevo)
              end
          end
          if !editados.empty?
              for i in 0..editados.length - 1
                  id = editados[i]['id']
                  nombre = editados[i]['nombre'].gsub(" ", "%20") #esto es para reemplazar los espacios en blanco porque httparty arroja error
                  editar_departamento(id, nombre)
              end
          end
          if !eliminados.empty?
              for i in 0..eliminados.length - 1
                  id = eliminados[i]
                  eliminar_departamento(id)
              end
          end
          rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha registrado los cambios en los departamentos", array_nuevos] }.to_json
      rescue StandardError => e #ZeroDivisionError
          rpta = { :tipo_mensaje => "error", :mensaje => ["Se ha producido un error en guardar la tabla de departamentos", e] }.to_json
      end

      rpta
    end

    private
    def crear_departamento(temp_id, nombre)
    	departamento = Departamento.new
      id_generado = departamento.crear(nombre)
      {:temporal => temp_id, :nuevo_id => id_generado}
    end

    private
    def editar_departamento(id, nombre)
    	departamento = Departamento.new
     departamento.editar(id, nombre)
    end

    private
    def eliminar_departamento(id)
    	 departamento = Departamento.new
       departamento.eliminar(id)
    end
end