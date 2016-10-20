def sign_up
  visit "/sign_up"
  fill_in :name, with: "David Davidson"
  fill_in :email, with: "daviddavidson@david.com"
  fill_in :password, with: "david"
  click_button "Sign Up"
end
