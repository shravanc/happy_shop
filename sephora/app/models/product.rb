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

class Product < ApplicationRecord
include ErrorHandler

validates :name, presence: true
validates :category, presence: true
validates :price, presence: true

scope :unsold_products, -> { where( sold_out: false ) }




def create params

	attributes = get_attribuets params	

	@product = Product.create(attributes)
	unless @product.valid?
		return [false, parse_active_record_errors( @product.errors ) ]
	end

	return [true, response]

end






def index params

	data = {"products" => [{"id"=>1}, {"id"=>2}] }
	return [true, data]

	return [true, {"message" =>"created successfully"}]
end

def show params
	return [true, {"message" =>"created successfully"}]
end





private
def get_attribuets params
	product = params[:product]
	#puts '----------------'
	#p product[:name]
	data = {}
	data[:name] 				= product[:name]
	data[:category] 		= product[:category]
	data[:price]				= product[:price]
	data[:under_sale]		= product[:under_sale] || false
	data[:sale_price]		= product[:sale_price]
	
	return data
end

def response
	data = {}
	data[:id]	 							= @product.id
	data[:name] 						= @product.name
	data[:success_message] 	= "product created successfully"
	return data
end

end
