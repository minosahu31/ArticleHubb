class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.       

  has_many :articles, dependent: :destroy       
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comment_likes, dependent: :destroy

end
