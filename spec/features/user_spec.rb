feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: 'alice@example.com'
    fill_in :password, with: 'oranges!'
    click_button 'Sign up'
    expect(User.count).to eq(1)
    p current_path
     expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
end
