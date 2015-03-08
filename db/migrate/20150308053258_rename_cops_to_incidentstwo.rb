class RenameCopsToIncidentstwo < ActiveRecord::Migration
  def self.up
    rename_table :infractions, :cops
  end 
  def self.down
    rename_table :cops, :infractions
  end
end
