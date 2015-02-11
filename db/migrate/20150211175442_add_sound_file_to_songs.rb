class AddSoundFileToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :sound_file, :string
  end
end
