class App < Sinatra::Base
	get '/provincia/listar/:departamento_id' do
		provincia = Provincia.new
		provincia.listar(params['departamento_id']).to_json
	end
end