class Comment < ActiveRecord::Base
	belongs_to :article
	belongs_to :user
	has_many :comment_likes, dependent: :destroy
end
