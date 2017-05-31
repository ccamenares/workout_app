require 'rails_helper'

RSpec.feature "A user signs in" do 
	before do 
		@john = User.create(email: "john@example.com", password: "password")
	end

	scenario do 
		visit "/"
		click_link "Sign In"
		fill_in "Username" with: "john@example.com"
		fill_in "Password" with: "password"
		click_button "Sign In"

		expect(page).to have_content("You have succesfully signed in.")
		expect(page).to have_content("Signed in as #{@john.email}")
		expect(page).not_to have_link("Sign in")
		expect(page).not_to have_link("Sign up")

	end

end