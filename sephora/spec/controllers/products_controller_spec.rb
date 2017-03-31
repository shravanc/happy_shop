require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

	describe "GET 'index' " do
		let!( :new_product_1 ) { create(:product) }
		let!( :new_product_2 ) { create(:product) }

		it "returns a successful 200 response" do
			get :index, format: :json
			expect(response).to be_success
		end

		it "is not valid with two products"	do
			get :index, format: :json
			parsed_json = JSON.parse(response.body)
			expect( parsed_json["products"].length ).to eq(2)
		end

	end


	describe "POST create" do

		context "success case" do

			it "returns a successful 200 response" do
				post :create, params: { product: { name: "test", category:"cattegroy_test", price: 100 } }
				expect( response ).to be_success
			end

			it "reponse validation" do
				post :create, params: { product: { name: "test", category:"cattegroy_test", price: 100 } }
				pj = JSON.parse(response.body)

				expect( pj ).to include_json(
					name: "test",
					success_message: "product created successfully"
				)

			end

		end

		context "failure cases"do
 
			it "is not valid without name" do 
				post :create, params: { product: { category:"cattegroy_test", price: 100 } }
				expect( response ).to have_http_status(422)
      
				pj = JSON.parse(response.body)
				expect( pj["error"]["message"] ).to eq(["Name can't be blank"])
			end
      
			it "is not valid without price" do 
				post :create, params: { product: { name: "test", category:"cattegroy_test" } }
				expect( response ).to have_http_status(422)
      
				pj = JSON.parse(response.body)
				expect( pj["error"]["message"] ).to eq(["Price can't be blank"])
			end
      
			it "is not valid without category" do
				post :create, params: { product: { name: "test",  price: 100 } }
				expect( response ).to have_http_status(422)
      
				pj = JSON.parse(response.body)
				expect( pj["error"]["message"] ).to eq(["Category can't be blank"])
			end

		end



	end











=begin
  describe "POST #create" do

    context "with valid attributes" do
      it "create new contact" do
        post :create, product: attributes_for(:product)
        expect(Product.count).to eq(1)
      end
    end

  end
=end






end
