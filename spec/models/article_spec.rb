# spec/models/contact.rb
require 'spec_helper'

describe Article do
	it "has a valid factory" do
		Factory.create(:article).should be_valid
	end
	
	it "is invalid without title" do 
		Factory.build(:article, title: nil).should_not be_valid
	end
	
	it "is invalid without description" do
		Factory.build(:article, description: nil).should_not be_valid
	end
	
	it "results an sorted array of this match" do
		Article.by_letter("a").should_not include 'gngel'
	end	

	it "is invalid without category_type"
end