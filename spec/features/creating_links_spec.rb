feature "creating links" do
  scenario "I want to create links" do
    visit '/links/new'
    click_button "Add Link"
    expect(page).to have_content "Link successfully created."
  end
end