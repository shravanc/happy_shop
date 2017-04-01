# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  sold_out   :boolean          default("false")
#  category   :string
#  under_sale :boolean
#  price      :integer
#  sale_price :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do

factory :product do

	transient do
		sold true
	end

	name 				Faker::Commerce.product_name
	sold_out 		false
	category 		Faker::Commerce.department		
	under_sale 	false
	price 			Faker::Commerce.price
	sale_price 	Faker::Commerce.price


#	after(:build) do |product, evaluator|
#		product.sold_out = true if evaluator.sold
#	end

	trait :sold do
		sold_out true
	end


	factory :sold_product, traits: [ :sold ]

end


factory :product_lists do
	name "test"
	category "cattegroy_test"
	price 100
end



end
