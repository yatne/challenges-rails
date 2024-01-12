class CreateChallenges < ActiveRecord::Migration[7.1]
  def change
    create_table :challenges do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
