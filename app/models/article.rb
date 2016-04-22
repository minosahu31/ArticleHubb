class Article < ActiveRecord::Base
		
	mount_uploader :post_image, ImageUploader # Tells rails to use this uploader for this model.  	

	belongs_to :category
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	# Sample exapmle for testing....
	  def self.by_letter(letter)
	  	where("title like ?", "#{letter}%").order(:title)
	  end	

end
