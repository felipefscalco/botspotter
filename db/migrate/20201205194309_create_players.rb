class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :vocation
      t.integer :level
      t.datetime :last_online
      t.boolean :online
      t.integer :up_time, default: 0

      t.timestamps
    end
  end
end
