class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, null: false, foreign_key: true
      t.string :avatar_url

      t.timestamps
    end
  end
end
