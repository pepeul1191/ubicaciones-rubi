# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

class Provincia < Model
	def listar(departamento_id)
		rpta = @db[:provincias].where(:departamento_id => departamento_id).to_a
		@db.disconnect
		rpta 
	end

	def crear(nombre, departamento_id)
		rpta = @db[:provincias].insert(:nombre => nombre, :departamento_id => departamento_id)
		@db.disconnect
		rpta 
   end

   def editar(id, nombre)
      @db[:provincias].where('id', id).update(:nombre => nombre)
      @db.disconnect
   end

   def eliminar(id)
      @db[:provincias].where('id', id).delete
      @db.disconnect
   end
end