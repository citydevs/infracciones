class RemoveColumnFromInfraction < ActiveRecord::Migration
  def change
    remove_column :infractions, :raking_honestidad
    remove_column :infractions, :raking_trato
    remove_column :infractions, :identificacion
    remove_column :infractions, :infraccion
    remove_column :infractions, :articulo
    remove_column :infractions, :sancion
    remove_column :infractions, :devolvio
    remove_column :infractions, :copia
    remove_column :infractions, :latitud
    remove_column :infractions, :longitud
  end
end
