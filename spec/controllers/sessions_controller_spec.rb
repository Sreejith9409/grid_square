require 'rails_helper'
RSpec.describe SessionsController, type: :controller do
	describe 'POST #create' do
	  context 'when username is valid' do
	    it 'sets the user in the session' do
	      user = create(:user)
	      post :create, session: { name: user.user_name, user_id: user.id}
	      expect(controller.session["user_id"] ).to eq user.id
	    end
	  end

	  context 'when username is invalid' do
	    it 'sets the user in the session' do
	      user = create(:user)
	      post :create, session: { name: user.user_name, user_id: 123}
	      session["user_id"] = controller.session["user_id"]
	      expect(controller.session["user_id"] ).not_to eq user.id
	    end
	  end
	end

end