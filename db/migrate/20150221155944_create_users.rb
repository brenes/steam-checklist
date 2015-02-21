class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.string :avatar_url
      t.string :profile_url
      t.string :steamid

      t.timestamps null: false
    end
  end
end
