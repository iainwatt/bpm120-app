class User < ActiveRecord::Base
  has_many :comments
  has_many :songs
  has_many :followers
  has_many :favourites
  has_many :friends, through: :followers,
  					# conditions: { follower: {state: 'accepted'}}

  # has_many :pending_followers/or friends?? , class_name: 'Follower',
  																						foreign_key: :user_id,
  																						conditions: { state: 'pending'}
  has_many :pending_friends, through: :pending_followers, source: :friend																						
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
 mount_uploader :user_image, UserImageUploader

 def full_name
   first_name + " " + last_name
 end
end

  # def gravitar_url
  #   stripped_email = email.strip
  #   downcase_email = stripped_email.downcase
  #   hash = Digest::MD5.hexdigest(downcase_email)
  #   "http://gravitar.com/avatar/#{hash}"
  # end


