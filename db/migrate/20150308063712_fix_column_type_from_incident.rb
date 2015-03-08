class FixColumnTypeFromIncident < ActiveRecord::Migration
def change
    rename_column :incidents, :type, :tipo
    rename_column :incidents, :date, :fecha
  end
end
