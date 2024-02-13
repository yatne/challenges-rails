class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.references :entry_type, null: false, foreign_key: true
      t.float :value
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
