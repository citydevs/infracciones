class AddColumnsCops < ActiveRecord::Migration
  def change
        add_column :concepts, :articulo, :text
        add_column :concepts, :fraccion, :text
        add_column :concepts, :parrafo, :text
        add_column :concepts, :inciso, :text
        add_column :concepts, :puntos, :text
  end
end
