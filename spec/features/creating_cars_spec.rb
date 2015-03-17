require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
    expect(page).to have_content('$2,300.00')
    # save_and_open_page

    click_link 'New Car'

    fill_in 'Make', with: 'Lexus'
    fill_in 'Model', with: 'RX300'
    fill_in 'Year', with: '2001'
    fill_in 'Price', with: '3700'

    click_button 'Create Car'
    # save_and_open_page
    expect(page).to have_content('Ford	Mustang	1967	$2,300.00')
    expect(page).to have_content('2001 Lexus RX300 created')
    expect(page).to have_content('$3,700.00')
  end

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
