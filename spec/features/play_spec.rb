feature 'play' do
  scenario 'want to see hit points of player 2' do
   sign_in_and_play
   expect(page).to have_content 'HP'
  end

  scenario 'P1 attack P2, and get a confirmation' do
    sign_in_and_play
    click_button(:Attack)
    expect(page).to have_content('Player 1 attacked Player 2')
  end

  scenario 'P1 attack P2, HP drops by 10' do
    sign_in_and_play
    click_button(:Attack)
    expect(page).to have_content('Player 2 HP: 190')
  end
end
