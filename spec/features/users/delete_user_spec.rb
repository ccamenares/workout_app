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

	click_button("Delete")

	expect(page).to have_content("Are you sure you want to delete yourself? This can not be undone.")
	click_button("Yes")

	flash_message = "You have deleted your profile."
	expect(page).to have_content(flash_message)
	expect(page).to have_link("Sign up")
	expect(page).to have_link("Sign in")



end

end