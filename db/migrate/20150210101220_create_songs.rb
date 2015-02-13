class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.decimal :length
      t.string :url
      t.integer :user_id
      t.text :song_image
      t.text :sound_file
      t.timestamps null: false
    end
  end
end
