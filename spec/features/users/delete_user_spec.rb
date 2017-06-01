require 'rails_helper'

RSpec.feature "A user tries to delete" do 

	before do 
		@john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
		@sarah = User.create!(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password")
	end

scenario "themself" do
	login_as(@john)
	visit "/"

	expect(page).to have_content(@john.full_name)
	expect(page).to have_link("Delete")

	click_link("Delete")

	flash_message = "You have deleted your profile."
	expect(page).to have_content(flash_message)
	expect(page).to have_link("Sign up")
	expect(page).to have_link("Sign in")

	end

end