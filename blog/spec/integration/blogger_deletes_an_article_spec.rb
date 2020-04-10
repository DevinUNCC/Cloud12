require 'rails_helper.rb'

feature"Blogger deletes an article" do
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