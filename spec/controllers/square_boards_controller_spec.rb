require 'rails_helper'
RSpec.describe SquareBoardsController, type: :controller do
	let(:square_board) { FactoryBot.create(:square_board) }
	let(:user) { FactoryBot.create(:user) }
	describe "POST square_boards#update_square_board" do
		it "it should update the square_board" do
			data_hash = square_board.cols_data_hash.dup
			request.session[:user_id] = user.id
			post :update_square_board, :params => {:square_board_id => square_board.id, :key => 1, :color => "#a03434"}
			expect(response.content_type).to eq "application/json"
			square_board.reload
			square_board.cols_data_hash[1][0].should eq(user.user_name)
			square_board.cols_data_hash[1][1].should eq("#a03434")
			expect(flash[:notice]).to be_nil
		end
	end

end