feature 'Title has link in it that can be clicked' do
  scenario 'Viewing all titles on homepage' do
    visit '/'
    expect(page).to have_selector(:link, "Makers Academy")
  end

  scenario "Clicking on a title opens link in a new tab" do
    visit '/'
    click_link("Makers Academy")
    expect(page).to have_current_path("http://www.makersacademy.com")
  end

end



