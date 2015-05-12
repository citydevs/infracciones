class AddColumnsCops < ActiveRecord::Migration
  def change
        add_column :cops, :articulo, :text
        add_column :cops, :fraccion, :text
        add_column :cops, :parrafo, :text
        add_column :cops, :inciso, :text
  end
end
