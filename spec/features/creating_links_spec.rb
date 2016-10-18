feature "creating links" do
  scenario "I want to create links" do
    visit '/links/new'
    fill_in "title", :with => "Ruby Gems"
    fill_in "url", :with => "https://rubygems.org"
    click_button "Add Link"

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Ruby Gems')
    end
  end
end
