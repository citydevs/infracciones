class CreateInfractions < ActiveRecord::Migration
  def change
    create_table :infractions do |t|
      t.text :nombre
      t.text :placa
      t.integer :raking_honestidad
      t.integer :raking_trato

      t.timestamps null: false
    end
  end
end
