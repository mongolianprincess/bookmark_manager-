feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: 'alice@example.com'
    fill_in :password, with: 'mattia!'
    fill_in :password_confirmation, with: 'mattia!'
    click_button 'Sign up'
    expect(User.count).to eq(1)
    p current_path
     expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'alice@example.com',
              password: 'mattia',
              password_confirmation: 'mattia')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
