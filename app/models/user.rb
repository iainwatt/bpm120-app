class User < ActiveRecord::Base
  has_many :comments
  has_many :songs
  has_many :followers
  has_many :friends, through: :followers
  has_many :favourites
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


