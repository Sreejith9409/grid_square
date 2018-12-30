require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'default user' do
    let(:user) { create :user }

    it 'should initialize user with name' do
      expect(user.name).to be_kind_of(String)
      expect(user.email).to be_kind_of(String)
      expect(user.user_name).to be_kind_of(String)
      expect(user).to be_valid
    end
  end

end
