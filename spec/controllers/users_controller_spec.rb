require 'rails_helper'
RSpec.describe UsersController, type: :controller do

	describe "GET users#index" do
		it "should give square board data" do
			square_board = FactoryBot.create(:square_board)
			expect(square_board).not_to be_nil
		end
	end

	describe "GET users#new" do
		it "should initialise new user" do
			user = User.new
			expect(user).not_to be_nil
			expect(user.email).to be_nil
			expect(user.name).to be_nil
			expect(user.user_name).to be_nil
		end
	end

	describe "POST users#create" do
	  it "should create a new user with valid attributes" do
	    post :create, :params => { :user => { :name => "test", :email => "test@gmail.com" } }
	  	expect(User.count).to eq(1)
	  	expect(response.content_type).to eq "text/html"
	  end

	  it "should create a new user with invalid attributes" do
	    post :create, :params => { :user => { :name => "test", :email => "testgmail.com" } }
	  	expect(User.count).to eq(0)
	  end
	end

	let(:new_user) { FactoryBot.create(:user) }
	describe "POST users#update" do
		it "it should update the user" do
	    post :update, :params => {:id => new_user.id, :user => {:email=>"abc@ad.oo", :name => "test"} }
	  	expect(response.content_type).to eq "text/html"
	    new_user.reload
	    new_user.email.should eq("abc@ad.oo")
	    new_user.name.should eq("test")
		end
	end	
end