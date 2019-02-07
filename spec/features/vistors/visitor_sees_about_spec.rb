require 'rails_helper'

describe 'as a visitor' do
  it 'sees about page' do
    visit '/about'

    expect(page).to have_content('This application is designed to pull in youtube information')
  end
end