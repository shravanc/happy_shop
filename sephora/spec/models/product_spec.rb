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

require 'rails_helper'
require 'pp'
RSpec.describe Product do

    context "Data Validations" do
	    subject { build(:product) }
 
	    it "has a valid factory" do
	      expect( subject ).to be_valid
	    end

		it "is not valid without name" do
			subject.name = ''
			expect( subject ).not_to be_valid
		end

		it "is not valid without category" do
			subject.category = ''
			expect( subject ).not_to be_valid
		end

		it "is not valid without price" do 
			subject.price = ''
			expect( subject ).not_to be_valid
		end


    end


	context "Callback Validations" do
        subject { build_stubbed(:product) }

		it { is_expected.to validate_presence_of(:name) }
		it { is_expected.to validate_presence_of(:category) }
		it { is_expected.to validate_presence_of(:price) }

	end

	context "Scope Validation" do 
		describe ".sold_out" do
			let!( :new_product_1 ) { create(:product) }
			let!( :new_product_2 ) { create(:product) }
			let!( :old_product ) { create(:sold_product) }
	
			it { expect( Product.unsold_products.size).to eq(2) }

		end
	end

end
