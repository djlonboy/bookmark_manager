# feature 'Bookmarks' do
#   scenario 'returns the list of bookmarks' do
#   visit ('/')
#   click_on 'Show all Bookmarks'
#   expect(page).to have_content "www.google.co.uk"
#   expect(page).to have_content "www.bbc.co.uk"
#   expect(page).to have_content "www.makersacademy.com"
#   end
# end

feature 'View bookmarks' do
  scenario 'returns the list of bookmarks' do
    setup_table
    visit ('/bookmarks')
    expect(page).to have_link "Google"
    expect(page).to have_link "BBC"
    expect(page).to have_link "Makers Academy"
  end

  scenario '- bookmark names are links' do
    setup_table
    visit ('/bookmarks')
    click_link "BBC"
    expect(page).to have_current_path("https://www.bbc.co.uk/", url: true)
  end
end
