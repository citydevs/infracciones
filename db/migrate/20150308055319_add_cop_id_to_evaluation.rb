class AddCopIdToEvaluation < ActiveRecord::Migration
  def change
    add_column :evaluations, :cop_id, :integer
  end
end
