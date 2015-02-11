class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.belongs_to :user, index: true
      t.belongs_to :song, index: true

      t.timestamps null: false
    end
    add_foreign_key :favourites, :users
    add_foreign_key :favourites, :songs
  end
end
