describe User do

  let!(:user) do
    User.create(name: "David Davidson", email: "daviddavidson@david.com", password: "david", password_confirmation: "david")
  end

  it 'authenticates a user when a valid email and password are given' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given incorrect password' do
    expect(User.authenticate(user.email, 'hello_everyone')).to be_nil
  end

  it 'saves a password recovery token when we generate a token' do
    expect{user.generate_token}.to change{user.password_token}
  end

end
