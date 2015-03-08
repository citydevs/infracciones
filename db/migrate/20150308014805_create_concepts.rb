class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.text :infraccion
      t.text :monto
      t.text :corralon

      t.timestamps null: false
    end
  end
end
