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
  visit ('/bookmarks')
  expect(page).to have_content "www.google.co.uk"
  expect(page).to have_content "www.bbc.co.uk"
  expect(page).to have_content "www.makersacademy.com"
  end
end
