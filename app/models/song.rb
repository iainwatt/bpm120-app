class Song < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :favourites

  mount_uploader :sound_file, SoundFileUploader
  mount_uploader :song_image, SongImageUploader
end
