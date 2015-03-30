require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    car = FactoryGirl.create(:car)
    visit "/"
    # save_and_open_page
    
    # click_link 'New Car'
    # 
    # fill_in 'Make', with: "#{car.make}"
    # fill_in 'Model', with: "#{car.model}"
    # fill_in 'Year', with: "#{car.year}"
    # fill_in 'Price', with: '2300'
    # # save_and_open_page
    # click_button 'Create Car'
    #save_and_open_page
    # expect(page).to have_content('1955', 'Chevrolet', 'Corvette')
    # expect(page).to have_content('$9.99')
    
    click_link 'New Car'
    
    fill_in 'Make', with: 'Lexus'
    fill_in 'Model', with: 'RX300'
    fill_in 'Year', with: '2001'
    fill_in 'Price', with: '3700'
    
    click_button 'Create Car'
    # save_and_open_page
    expect(page).to have_content("#{car.make}	#{car.model}	#{car.year}
$#{ActiveSupport::NumberHelper::number_to_currency(car.price,{precision: 2,unit: ''})}")
    expect(page).to have_content('2001 Lexus RX300 created')
    expect(page).to have_content('$3,700.00')
  end
end
