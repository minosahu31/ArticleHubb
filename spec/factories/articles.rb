# faker gem for to randamly take the values
require 'faker'

FactoryGirl.define do
	
	factory :article do |f|
		f.title { Faker::title}
		f.descritpion { Faker::descritpion }
	end

	factory :invalid_article do |f|
		f.title nil
	end	
end