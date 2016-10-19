require_relative 'web_helper'

feature 'User sign up' do

  scenario 'signing up as a new user' do    
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Mike')
    expect(User.first.email).to eq('mike@gmail.com')
  end
end
