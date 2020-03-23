class ChangeIntegerLimitePopulations < ActiveRecord::Migration[6.0]
  def change
    change_column :populations, :total, :integer, limit: 8
  end
end
