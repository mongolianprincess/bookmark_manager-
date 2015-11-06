feature 'register new user' do
  scenario 'sign up user account'do
    visit ('/user/new')
    fill_in('name', :with => 'Amy')
    fill_in('e-mail', :with => 'example@example.com')
    click_button('Sign up')
    expect(page).to have_content('Welcome Amy')
  end
end
