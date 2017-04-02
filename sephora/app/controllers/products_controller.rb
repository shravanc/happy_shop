class ProductsController < ApplicationController

before_action :load_object

def create
	status, data = @product.create params
  render_response({data: data, status: status ? :ok : :unprocessable_entity})
end

def index
  status, data = @product.index params
  render_response({data: data, status: status ? :ok : :unprocessable_entity})
end

def show
  status, data = @product.show params
  render_response({data: data, status: status ? :ok : :unprocessable_entity})
end

def update
  status, data = @product.update params
  render_response({data: data, status: status ? :ok : :unprocessable_entity})
end

def destroy
  status, data = @product.destroy_product params
  render_response({data: data, status: status ? :ok : :unprocessable_entity})
end

private

def load_object
	@product = Product.new
end

def render_response options
  render json: options[:data], status: options[:status]
end

end
