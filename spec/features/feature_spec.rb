require "rails_helper"

RSpec.feature "Feature", :type => :feature do
	let(:email) { Faker::Internet.email }
	let(:user_name) { Faker::Name.name }

	# Below case is to create new user with unique email and name
	scenario "Create new user" do
		visit "/signup"

		fill_in "user_name", :with => user_name
		fill_in "user_email", :with => email
		click_button "Create User"
		expect(page).to have_text("User was successfully created")
	end

	let(:user) { FactoryBot.create(:user) }
	# Below case is to Login with new user
	scenario "Login" do
		visit "/"
		fill_in "name", :with => email
		click_button "Login"
		expect(page).to have_text("Successfully Logged in!")
	end

	# Below case is to Signout the user
	scenario "Signout" do
		visit "/"
		fill_in "name", :with => email
		click_button "Login"
		click_link "Sign Out"
		expect(page).to have_text("Logged out Successfully!")
	end 

end