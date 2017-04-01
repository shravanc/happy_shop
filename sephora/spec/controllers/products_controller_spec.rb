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
			expect( parsed_json["products"]["total"] ).to eq(2)
			expect( parsed_json["products"]["total"] ).to eq( parsed_json["products"]["lists"].length)
		end

		it "valid response data" do
			get :index, format: :json
			parsed_json = JSON.parse(response.body)

			expect( parsed_json["products"]["lists"].last ).to include_json(
				name: new_product_2.name,
				category: new_product_2.category,
				price: new_product_2.price
			)

		end
		
	end

	describe "GET Show" do
		let!( :new_product_1 ) { create(:product) }
		let!( :new_product_2 ) { create(:product) }

		it "returns a successful 200 response" do
			get :show, params: { id: new_product_1.id }
			expect(response).to be_success
		end

		it "is a valid response" do
			get :show, params: { id: new_product_1.id }
			pj = JSON.parse(response.body)
			expect( pj["product"] ).to include_json(
				name: new_product_1.name,
				category: new_product_1.category,
				price: new_product_1.price
			)
		end

		it "is not valid without proper id" do
			get :show, params: { id: 1 }
			expect(response).to have_http_status(422)

			pj = JSON.parse(response.body)
			expect( pj["message"] ).to eq("Invalid product id")
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
					success_message: "Product persisted successfully"
				)

			end

		end

		context "failure cases"do
 
			it "is not valid without name" do 
				post :create, params: { product: { category:"cattegroy_test", price: 100 } }
				expect( response ).to have_http_status(422)
      
				pj = JSON.parse(response.body)
				expect( pj["message"] ).to eq( "Validation Failed" )
			end
      
			it "is not valid without price" do 
				post :create, params: { product: { name: "test", category:"cattegroy_test" } }
				expect( response ).to have_http_status(422)
      
				pj = JSON.parse(response.body)
				expect( pj["message"] ).to eq( "Validation Failed" )
			end
      
			it "is not valid without category" do
				post :create, params: { product: { name: "test",  price: 100 } }
				expect( response ).to have_http_status(422)
      
				pj = JSON.parse(response.body)
				expect( pj["message"] ).to eq( "Validation Failed" )
			end

		end



	end


	describe "PUT #update" do
		let!( :product_1 ) { create(:product) }

    it "returns a successful 200 response" do
      put :update, params: { id:product_1.id,  product: { name: "update_test", category:"cattegroy_test", price: 100 } }
      expect( response ).to be_success
    end

		it "updated successfully" do
      put :update, params: { id:product_1.id,  product: { name: "update_test", category:"cattegroy_test", price: 100 } }

			get :show, params: { id:product_1.id }
			pj = JSON.parse( response.body )
			expect( pj["product"]["name"] ).to eq("update_test")
		end

	end


	describe "DELETE #destroy" do
		let!( :product_1 ) { create(:product) }
		let!( :product_2 ) { create(:product) }
		
		it "returns a successful 200 response" do
			delete :destroy, params: { id: 1 }
			expect( response ).to have_http_status(422)
		end

		it "Destroyed sucessfully" do
			delete :destroy, params: { id: product_1 }
			expect( Product.count ).to eq(1)
		end


	end










end
