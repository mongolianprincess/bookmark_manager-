 feature 'adding a bookmark' do
  scenario 'when I want to add a link' do
    visit ('/links/new')
    fill_in('title', :with => 'Google' )
    fill_in('url', :with => 'www.google.com' )
    click_button('Submit')
    within 'ul#links' do
      expect(page).to have_content('Google')
      expect(page).to have_content('www.google.com')
    end
  end
end
