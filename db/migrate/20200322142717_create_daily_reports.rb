class CreateDailyReports < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_reports do |t|
      t.string :country
      t.date :day
      t.integer :confirmed
      t.integer :deaths
      t.integer :recovery

      t.timestamps
    end
  end
end
