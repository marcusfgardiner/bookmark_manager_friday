feature 'adding links' do
  scenario 'User can add links' do
    visit '/'
    fill_in('url', with: 'http://www.twitter.com')
    fill_in('title', with: 'Twitter')
    click_button 'Add link'
    expect(page).to have_content 'Twitter'
  end
end
