feature 'homepage' do
 scenario 'see user names on-screen' do
   sign_in_and_play
   expect(page).to have_content 'Chris'
   expect(page).to have_content 'Paris'
 end

 scenario 'want to see hit points of player 2' do
  sign_in_and_play
  expect(page).to have_content 'HP'
 end
end
