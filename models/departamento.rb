# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

class Departamento < Model
	def listar
		rpta = @db[:departamentos].to_a
		@db.disconnect
		rpta 
	end

	def crear(nombre)
		rpta = @db[:departamentos].insert(:nombre => nombre)
		@db.disconnect
		rpta
   end

   def editar(id, nombre)
      @db[:departamentos].where('id', id).update(:nombre => nombre)
      @db.disconnect
   end

   def eliminar(id)
      @db[:departamentos].where('id', id).delete
      @db.disconnect
   end
end