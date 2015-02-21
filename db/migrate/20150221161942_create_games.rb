class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :appid
      t.string :name
      t.string :icon_url

      t.timestamps null: false
    end
  end
end
