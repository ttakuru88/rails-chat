class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name, index: true, limit: 128

      t.timestamps
    end
  end
end
