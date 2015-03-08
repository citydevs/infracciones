class RenameIncidentsToCops < ActiveRecord::Migration
  def self.up
    rename_table :incidents, :cops
  end 
  def self.down
    rename_table :cops, :incidents
  end
end
