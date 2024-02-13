class CreateEntryTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :entry_types do |t|
      t.references :challenge, null: false, foreign_key: true
      t.string :name
      t.string :units
      t.float :weight

      t.timestamps
    end
  end
end
