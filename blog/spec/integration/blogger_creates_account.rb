require 'rails_helper.rb'

feature "Blogger creates an account" do
    scenario "Blogger gives credentials for account" do
        visit signup_path
        expect(page).to have_content("New User")
        fill_in "Name", with: "user"
        fill_in "Email", with: "testemail@email.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Create User"
        expect(page).to have_content("user")
    end
    scenario "Blogger log's in using credentials" do
        visit login_path
        expect(page).to have_content("Login")
        fill_in "Email", with: "testemail@email.com"
        fill_in "Password", with: "password"
        click_button "Login"
    end
end