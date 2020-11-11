require_relative '../../app'

describe Battle, type: :feature do
  it "displays 'Welcome to the Eternal Battle Game!'" do
    visit '/'
    expect(page).to have_content 'Welcome to the Eternal Battle Game!'
  end

  it "expects players to fill in their names in a form, submit the form and see the names on screen" do
    visit '/'
    fill_in('name1', with: 'John')
    fill_in('name2', with: 'Mary')
    click_button("Submit")
    expect(page).to have_content('John')
    expect(page).to have_content('Mary')
  end
end
