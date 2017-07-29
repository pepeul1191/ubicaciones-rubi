class App < Sinatra::Base
	get '/distrito/listar/:provincia_id' do
		distrito = Distrito.new
		distrito.listar(params['provincia_id']).to_json
	end
end