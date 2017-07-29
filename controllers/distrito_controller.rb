class App < Sinatra::Base
	get '/distrito/listar/:provincia_id' do
		distrito = Distrito.new
		distrito.listar(params['provincia_id']).to_json
	end

	get '/distrito/buscar' do
		distrito = Distrito.new
		distrito.buscar(params['nombre']).to_json
	end
end