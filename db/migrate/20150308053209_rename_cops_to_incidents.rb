class RenameCopsToIncidents < ActiveRecord::Migration
  def self.up
    rename_table :cops, :incidents
  end 
  def self.down
    rename_table :incidents, :cops
  end
end
