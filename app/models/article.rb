class Article < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
end
