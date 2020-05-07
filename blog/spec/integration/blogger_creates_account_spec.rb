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
        click_link "My Blog"
        expect(page).to have_content("Listing articles")
    end
end
feature "Blogger adds an Article" do
    scenario "Blogger successfully navigates to the new articles page from the listing articles page" do
        visit new_article_path
        #expect(page).to have_content("Listing articles")
        #click_link "New article"
        expect(page).to have_content("New Article")
        expect(page).to have_field("Title")
        expect(page).to have_field("Text")
    end
    scenario "Blogger successfully creates a new article" do
        visit signup_path
        fill_in "Name", with: "user"
        fill_in "Email", with: "testemail@email.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Create User"
        visit login_path
        fill_in "Email", with: "testemail@email.com"
        fill_in "Password", with: "password"
#        expect(page).to have_content("Hello, Blog App User!")
        click_button "Login"
        visit new_article_path
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        expect(page).to have_content("New Capybara Article")
        #expect(page).to have_content("This is a new Capybara article")
    end
end
feature "Blogger deletes an Article" do
    scenario "Blogger successfully deletes an Article" do
        
    end
end