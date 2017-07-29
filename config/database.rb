# config/database.rb
require 'sqlite3'
require 'sequel'

class Database
	def initialize
		begin
   @connection = Sequel.connect(:adapter=>'sqlite', :database=>File.expand_path('../../db/db_ubicaciones.db', __FILE__))
  rescue Sequel::DatabaseError => e#ZeroDivisionError#LoadError
   {:tipo_mensaje => 'error', :rpta_mensaje => "Error ocurrido en Sequel con la conección con la base de datos", :error => e}.to_json
  end
	end

	def connection
		@connection
	end
end