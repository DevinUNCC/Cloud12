require 'rails_helper.rb'

feature"Blogger adds comment to an article" do
    scenario "Blogger successfully navigates to listing articles page from welcome page" do
        visit welcome_index_path
        expect(page).to have_link("My Blog")
        click_link "My Blog"
        expect(page).to have_content("Listing articles")
    end
    
    scenario "Blogger successfully adds comment to an article" do
        visit new_article_path
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        expect(page).to have_content("Add a comment:")
        expect(page).to have_field("Commenter")
        expect(page).to have_field("Body")
        expect(page).to have_button("Create Comment")
        fill_in "Commenter", with: "New Capybara Commenter"
        fill_in "Body", with: "New Capybara Comment"
        click_button "Create Comment"
        expect(page).to have_content("New Capybara Commenter")
        expect(page).to have_content("New Capybara Comment")
    end
end