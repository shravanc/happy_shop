class ProductsController < ApplicationController

before_action :load_object

def create
  status, data = @product.create params
  if status
    render json: data, status: :ok
  else
    render json: data, status: :unprocessable_entity
  end
end

def index
  status, data = @product.index params
  if status
    render json: data, status: :ok
  else
    render json: data, status: :unprocessable_entity
  end
end

def show
  status, data = @product.show params
  if status
    render json: data, status: :ok
  else
    render json: data, status: :unprocessable_entity
  end
end

def update
  status, data = @product.update params
  if status
    render json: data, status: :ok
  else
    render json: data, status: :unprocessable_entity
  end
end

def destroy
  status, data = @product.destroy_product params
  if status
    render json: data, status: :ok
  else
    render json: data, status: :unprocessable_entity
  end
end

private

def load_object
	@product = Product.new
end


end
