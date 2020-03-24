class ChangeIntegerLimitePopulations < ActiveRecord::Migration[6.0]

  # https://stackoverflow.com/questions/29538530/getting-error-indicating-number-is-out-of-range-for-activerecordtypeinteger
  def change
    change_column :populations, :total, :integer, limit: 8
  end
end
