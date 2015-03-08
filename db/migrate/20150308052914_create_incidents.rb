class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.text :type
      t.text :address
      t.text :date
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
