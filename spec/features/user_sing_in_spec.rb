feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: 'mattia@example.com'
    fill_in :password, with: 'cool!'
    click_button 'Sign up'

    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, mattia@example.com')
    expect(User.first.email).to eq('mattia@example.com')
  end
end
