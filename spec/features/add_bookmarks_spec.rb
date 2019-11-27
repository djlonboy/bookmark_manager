
feature 'Add bookmarks' do
  scenario 'saves a bookmark' do
    setup_table
    visit ('/add-bookmark')
    fill_in "url", with: "www.myspace.com"
    click_button("Submit")
    visit ('/bookmarks')
    expect(page).to have_content "www.myspace.com"
  end
end
