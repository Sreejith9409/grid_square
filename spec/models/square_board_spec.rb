require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'default board' do
    let(:square_board) { create :square_board }

    it 'should initialize square board with name' do
      expect(square_board.board_name).to be_kind_of(String)
      expect(square_board.rows).to be_kind_of(Integer)
      expect(square_board.cols).to be_kind_of(Integer)
      expect(square_board).to be_valid
    end
  end

end
