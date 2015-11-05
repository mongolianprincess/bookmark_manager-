feature 'tagging a bookmark' do
  scenario 'adding a tag to a link'do
  visit ('/links/new')
  fill_in('title', :with => 'Google' )
  fill_in('url', :with => 'www.google.com' )
  fill_in('tag', :with => 'search engine')
  click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name).join(" ")).to include('search engine')
  end
end
