def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in 'first_name', with: 'Mike'
  fill_in 'last_name', with: 'Like'
  fill_in 'email', with: 'mike@gmail.com'
  fill_in 'password', with: 'qwerty'
  click_button('Sign up')
end
