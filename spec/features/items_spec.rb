require 'rails_helper'

RSpec.feature "Items", type: :feature do
  context 'create new item' do
    scenario 'should be successful' do
      visit new_item_path
      within('form') do
        fill_in 'item_name', with: 'ergodox ez'
        fill_in 'item_price', with: '325'
      end
      click_button 'Create Item'
      expect(page).to have_content('Item was successfully created.')
    end

    scenario 'should fail' do
      visit new_item_path
      within('form') do
        fill_in 'item_price', with: '325'
      end
      click_button 'Create Item'
      expect(page).to have_content('Name can\'t be blank')
    end
  end
end
