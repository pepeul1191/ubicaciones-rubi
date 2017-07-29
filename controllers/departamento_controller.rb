class App < Sinatra::Base
	get '/departamento/listar' do
		departamento = Departamento.new
		departamento.listar.to_json
	end
end