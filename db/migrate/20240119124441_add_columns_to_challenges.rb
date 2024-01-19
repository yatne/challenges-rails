class AddColumnsToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :invite_token, :string
    add_column :challenges, :is_solo, :boolean
    add_column :challenges, :goal, :numeric
    add_index :challenges, :invite_token, unique: true
  end
end
