# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature 'filter bookmark' do
  scenario 'filter tags'do
  visit ('/links/new')
  fill_in('title', :with => 'Google' )
  fill_in('url', :with => 'www.google.com' )
  fill_in('tag', :with => 'search engine')
  click_button('Submit')

  visit ('/links/new')
  fill_in('title', :with => 'Amy' )
  fill_in('url', :with => 'www.mongolianprincess.net' )
  fill_in('tag', :with => 'radioactive')
  click_button('Submit')

  visit ('/tags/radioactive')
  expect(page).to have_content('radioactive')
  expect(page).to_not have_content ('search engine')

  end
end
