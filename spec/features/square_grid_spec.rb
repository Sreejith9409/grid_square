require "rails_helper"
require 'database_cleaner'

RSpec.feature "Signin", type: :feature, javascript: true do
	
	describe 'Complete Feature', feature: true do	
		let(:email) { Faker::Internet.email }
		let(:user_name) { Faker::Name.name }

		
		it "Creates new user"  do
			visit "signup"
			fill_in "user_name", :with => user_name
	    fill_in "user_email", :with => email
	    click_button "Create User"
	    page.should have_text('User was successfully created')
		end

		it "Successfully Update Color" do 
			visit "signup"
			fill_in "user_name", :with => user_name
	    fill_in "user_email", :with => email
	    click_button "Create User"
			visit "/"
			fill_in "name", :with => email
  		click_button "Login"
			page.should have_text('Successfully Logged in!')
  		page.execute_script("$('#color_chooser').val('#762271')")
  		page.find("#grid_21").click
  		text = page.driver.browser.switch_to.alert.text
			expect(text).to eq 'Are you sure you want to update selected color to column 21 ?'  		
  		page.accept_alert
  		page.accept_alert
  		color = page.find("#grid_21").native.css_value('background-color')
   		expect(color).to eq('rgba(118, 34, 113, 1)')
		end

		it "UnSuccessful Update of Color" do 
			visit "signup"
			fill_in "user_name", :with => user_name
	    fill_in "user_email", :with => email
	    click_button "Create User"
			visit "/"
			fill_in "name", :with => email
  		click_button "Login"
			page.should have_text('Successfully Logged in!')
  		page.find("#grid_21").click
  		text = page.driver.browser.switch_to.alert.text
			expect(text).to eq 'Please Select a valid color to continue'  		
  		page.accept_alert
		end
	end

end