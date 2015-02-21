class CreateOwnedGames < ActiveRecord::Migration
  def change
    create_table :owned_games do |t|
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true
      t.integer :play_time, default: 0
      t.timestamps null: false
    end
    add_foreign_key :owned_games, :users
    add_foreign_key :owned_games, :games
  end
end
