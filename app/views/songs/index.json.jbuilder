json.array!(@songs) do |song|
  json.extract! song, :id, :title, :artist, :length, :url, :user_id
  json.url song_url(song, format: :json)
end
