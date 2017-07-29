# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

class Distrito < Model
	def listar(provincia_id)
		rpta = @db[:distritos].where(:provincia_id => provincia_id).to_a
		@db.disconnect
		rpta 
	end

	def buscar(nombre)
		rpta = @db[:vw_distrito_provincia_departamento].where(Sequel.like(:nombre, nombre + '%')).limit(10).to_a
      @db.disconnect
      rpta
	end

	def crear(nombre, provincia_id)
		rpta = @db[:distritos].insert(:nombre => nombre, :provincia_id => provincia_id)
		@db.disconnect
		rpta 
   end

   def editar(id, nombre)
      @db[:distritos].where('id', id).update(:nombre => nombre)
      @db.disconnect
   end

   def eliminar(id)
      @db[:distritos].where('id', id).delete
      @db.disconnect
   end
end