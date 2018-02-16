feature 'Title has link in it that can be clicked' do
  scenario 'Viewing all titles on homepage' do
    visit '/'
    expect(page).to have_link 'http://www.makersacademy.com'
  end
end
