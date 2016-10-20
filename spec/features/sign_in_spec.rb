require 'spec_helper'
require_relative 'web_helpers'

feature "Signing in a new user" do
  scenario "New user signing up should increment user count by 1 and display welcome message" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content("Welcome David Davidson")
  end
end
