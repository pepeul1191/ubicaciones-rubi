# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

class Provincia < Model
	def listar(departamento_id)
		rpta = @db[:provincias].where(:departamento_id => departamento_id).to_a
		@db.disconnect
		rpta 
	end
end