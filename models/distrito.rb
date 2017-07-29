# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

class Distrito < Model
	def listar(provincia_id)
		rpta = @db[:distritos].where(:provincia_id => provincia_id).to_a
		@db.disconnect
		rpta 
	end
end