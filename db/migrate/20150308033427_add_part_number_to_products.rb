class AddPartNumberToProducts < ActiveRecord::Migration
 def up

  add_column :infractions,:identificacion, :text
  add_column :infractions, :infraccion, :text
  add_column :infractions, :articulo, :text
  add_column :infractions, :sancion, :text
  add_column :infractions, :devolvio, :text
  add_column :infractions, :copia, :text
  add_column :infractions, :latitud, :float
  add_column :infractions, :longitud, :float

  
end

def down
  remove_column :infractions, :raking_honestidad, :text
  remove_column :infractions, :raking_trato, :text
end

end
