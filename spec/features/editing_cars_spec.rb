require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can edit a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'
    
    click_link 'Edit'

    fill_in 'Model', with: 'Explorer'
    fill_in 'Year', with: '2012'
    fill_in 'Price', with: '21200'
    click_button 'Update Car'

    expect(page).to have_content('2012 Ford Explorer updated')
    # save_and_open_page
    expect(page).to have_content('$21,200.00')
  end
end
