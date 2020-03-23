class CreatePopulations < ActiveRecord::Migration[6.0]
  def change
    create_table :populations do |t|
      t.string :country
      t.integer :total

      t.timestamps
    end
  end
end
