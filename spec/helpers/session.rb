module SessionHelpers

  def sign_in(email:, password:)
    visit '/sessions/sign_in'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up(name: "David Davidson",
              email: "daviddavidson@david.com",
              password: "david",
              password_confirmation: "david")
    visit "/users/sign_up"
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Submit"
  end
end
