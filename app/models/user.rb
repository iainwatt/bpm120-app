class User < ActiveRecord::Base
  has_many :comments
  has_many :songs
  has_many :user_followers
  has_many :followers, through: :user_followers
  has_many :favourites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
mount_uploader :avatar, AvatarUploader
mount_uploader :user_image, UserImageUploader

 def full_name
   first_name + " " + last_name
 end

 

  def gravitar_url
    stripped_email = email.strip
    downcase_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcase_email)

    "http://gravitar.com/avatar/#{hash}"
  end

 
end



