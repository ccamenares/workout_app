require 'rails_helper'

RSpec.feature "Creating Exercise" do 

	before do 
		@john = User.create(email: "john@example.com", password: "password")
		login_as(@john)
	end

	scenario "with valid inputs" do 
		visit "/"

		click_link "My Lounge"
		click_link "New Workout"
		expect(page).to have_link("Back")

		fill_in "Duration", with: 70
		fill_in "Workout details", with: "Weight lifting"
		fill_in "Activity date", with: "2016-07-26"
		click_button "Create Exercise"

		expect(page).to have_content("Exercise has been created")

		exercise = Exercise.last 
		expect(current_path).to eq(user_exercise_path(@john, exercise))
		expect(exercise.user_id).to eq(@john.id)
	end

	scenario "with invalid inputs: Duration as String" do 
		visit "/"

		click_link "My Lounge"
		click_link "New Workout"
		expect(page).to have_link("Back")

		fill_in "Duration", with: "Seventy"
		fill_in "Workout details", with: "Weight lifting"
		fill_in "Activity date", with: "2016-07-26"
		click_button "Create Exercise"

		expect(page).to have_content("Exercise has not been created")
		expect(page).to have_content("Duration in min is not a number")
	end

	scenario "with invalid inputs: Workout details blank" do 
		visit "/"

		click_link "My Lounge"
		click_link "New Workout"
		expect(page).to have_link("Back")

		fill_in "Duration", with: 70
		fill_in "Workout details", with: ""
		fill_in "Activity date", with: "2016-07-26"
		click_button "Create Exercise"

		expect(page).to have_content("Workout details can't be blank")
		expect(page).to have_content("Exercise has not been created")
	end

	scenario "with invalid inputs: Activity date blank" do 
		visit "/"

		click_link "My Lounge"
		click_link "New Workout"
		expect(page).to have_link("Back")

		fill_in "Duration", with: 70
		fill_in "Workout details", with: "Weight lifting"
		fill_in "Activity date", with: ""
		click_button "Create Exercise"

		expect(page).to have_content("Activity date can't be blank")
		expect(page).to have_content("Exercise has not been created")
	end	

end