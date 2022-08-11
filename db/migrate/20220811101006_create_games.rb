class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.boolean :status
      t.integer :row
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
