require 'spec_helper'
require_relative 'web_helpers'

feature "Signing up a new user" do
  scenario "New user signing up should increment user count by 1 and display welcome message" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content("Welcome David Davidson")
  end

  scenario "When user has a mismatching password confirmation, no new users are created" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/sign_up'
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "User cannot sign in with a blank email field" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "User cannot sign in with an invalid email" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(page).to have_content("Email has an invalid format")
  end

  scenario "User email address must be unique" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end
end
