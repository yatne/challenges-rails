class AddCreatorIdToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_reference :challenges, :creator, foreign_key: { to_table: :users }
  end
end
