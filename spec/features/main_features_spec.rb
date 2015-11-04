feature "viewing saved links" do
  scenario "When I access the links page" do
    Link.create(:url => "www.facebook.com", :title => "Facebook")
    visit('/links/index')
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content('Facebook')
      expect(page).to have_content('www.facebook.com')
    end
  end
end
