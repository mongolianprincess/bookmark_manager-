feature 'tagging bookmark with multiple tags' do
  scenario 'add multiple tags to a link' do
    visit ('/links/new')
    fill_in('title', :with => 'Google' )
    fill_in('url', :with => 'www.google.com' )
    fill_in('tag', :with => 'search-engine')
    click_button('Submit')

    visit ('/links/new')
    fill_in('title', :with => 'Amy' )
    fill_in('url', :with => 'www.mongolianprincess.net' )
    fill_in('tag', :with => 'radioactive crazy awesome')
    click_button('Submit')

    visit ('/tags/crazy')
    expect(page).to have_content('crazy')
    expect(page).to_not have_content('search-engine')
  end
end
