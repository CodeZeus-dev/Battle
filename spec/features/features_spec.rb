require_relative '../../app'

describe Battle, type: :feature do
  it "displays 'Welcome to the Eternal Battle Game!'" do
    visit '/'
    expect(page).to have_content 'Welcome to the Eternal Battle Game!'
  end

  it "expects players to fill in their names in a form, submit the form and see the names on screen" do
    signup_and_play
    expect(page).to have_content('John')
    expect(page).to have_content('Mary')
  end

  context 'attacking the opponent' do
    it "attacks the opponent" do
      signup_and_play
      click_button("Attack")
      expect(page).to have_content('John')
      expect(page).to have_content('Mary')
    end

    it 'subtracts 10 points from the opponent\'s HP' do
      signup_and_play
      click_button("Attack")
      expect(page).to have_content(90)
    end
  end
end
