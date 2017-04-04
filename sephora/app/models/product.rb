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
include SharedMethods

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

	@products = Product.all
	@products = @products.where(:category => params[:category]) if params[:category]
	@products = @products.where(:price => params[:price].to_i)  if params[:price]
	@products = @products.order(params[:sort].split(':').first => params[:sort].split(':').last ) if params[:sort] and ["desc","asc"].include?params[:sort].split(':').last
	@products = paginate @products, params[:page], params[:per_page]
	
	data = contruct_index_response

	response = {}
	response[:products] = { total: @products.count, lists: data }

	return [ true, response ]

end

def show params
	
	@product = Product.find_by_id(params[:id])
	if @product.nil?
		return [false, get_error_response("Invalid product id", [] ) ]
	end

	data = contruct_show_response

	resp = {}
	resp[:product] = data
	return [ true, resp ]
end

def update params

	attributes = get_attribuets params	
	@product = Product.find(params[:id])
	if @product.nil?
    return [false, get_error_response("Invalid product id", [] ) ]

 end

	@product.update_attributes(attributes)
	unless @product.valid?
		return [false, parse_active_record_errors( @product.errors ) ]
	end

#	puts "------update------"
#	p @product
	return [true, response]

end

def destroy_product params

	@product = Product.find_by_id(params[:id])
	if @product.nil?
		return [false, get_error_response("Invalid product id", [] ) ]
	end

	unless @product.destroy
		return [false, get_error_response("Failed to destroy", [] ) ]
	end

	resp = {}
	resp["message"] = "Product destroyed successfully"

	return [true, resp]
end




private

#helper methods

def get_attribuets params
	product = params[:product]
	data = {}
	data[:name] = product[:name] if product[:name]
	data[:category]	= product[:category] if product[:category]
	data[:price] = product[:price] if product[:price]
	data[:under_sale]	= product[:under_sale] if product[:under_sale]
	data[:sale_price]	= product[:sale_price] if product[:sale_price]
	
	return data
end

def response
	data = {}
	data[:id]	= @product.id
	data[:namei] = @product.name
	data[:success_message]	= "Product persisted successfully"
	return data
end

def contruct_index_response
	list = []

	interate_list( @products ) do |pr|
		d1 = {}
		d1[:id]	= pr.id
		d1[:name]	= pr.name
		d1[:category]	= pr.category
		d1[:price] = pr.price
		d1[:sale_price]	= pr.sale_price
		d1[:under_sale]	= pr.under_sale
		list << d1
	end

	return list

end

def contruct_show_response
	d1 = {}
	d1[:id]	= @product.id
	d1[:name]	= @product.name
	d1[:category]	= @product.category
	d1[:price] = @product.price
	d1[:sale_price]	= @product.sale_price
	d1[:under_sale]	= @product.under_sale
	return d1
end


end
