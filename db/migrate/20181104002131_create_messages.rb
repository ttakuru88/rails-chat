class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :room, index: true, foreign_key: true
      t.string :text, limit: 172
      t.string :user_name, limit: 32

      t.timestamps
    end
  end
end
