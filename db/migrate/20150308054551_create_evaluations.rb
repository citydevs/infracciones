class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :identification
      t.integer :infraccion
      t.integer :articulo
      t.integer :coincidio
      t.integer :documents
      t.integer :copy
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
