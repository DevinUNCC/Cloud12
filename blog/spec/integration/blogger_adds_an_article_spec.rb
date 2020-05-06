require 'rails_helper.rb'

feature"Blogger adds an article" do
    scenario "Blogger successfully creates a user account" do
        visit signup_path
        expect(page).to have_content("New User")
        fill_in "Name", with: "user"
        fill_in "Email", with: "testemail@email.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Create User"
        expect(page).to have_content("user")
    end
    scenario "Blogger successfully navigates to the new articles page from the listing articles page" do
        visit articles_path
        expect(page).to have_content("Listing articles")
        click_link "New article"
        expect(page).to have_content("New Article")
        expect(page).to have_field("Title")
        expect(page).to have_field("Text")
    end
    scenario "Blogger successfully creates a new article" do
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
    end
    scenario "Blogger successfully creates and destroys new article" do
        visit new_article_path
        expect(page).to have_content("New Article")
        expect(page).not_to have_content("title1")
        fill_in "Title", with: "title1"
        fill_in "Text", with: "title1 content"
        click_button "Create Article"
        visit articles_path ## Or you can click the link
        expect(page).to have_content("title1")
        click_link "Destroy"
        expect(page).to have_no_content('title1')
        # page.should have_no_content('title1') ##expect(page).to have_no_content('title1')
    end
end