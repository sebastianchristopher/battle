feature 'homepage' do
 scenario 'see user names on-screen' do
   visit '/'
   fill_in('player_1', :with => 'Chris')
   fill_in('player_2', :with => 'Paris')
   click_button('submit')
   expect(page).to have_content 'Chris'
   expect(page).to have_content 'Paris'
 end

 scenario 'want to see hit points of player 2' do
  visit '/'
  fill_in('player_1', :with => 'Chris')
  fill_in('player_2', :with => 'Paris')
  click_button('submit')
  expect(page).to have_content 'HP'
 end
end
