require 'rails_helper'

describe 'as a visitor' do
  it 'cannot see admin api' do
    visit '/admin/api/v1/test'
    expect(current_path).to eq('/')
  end
end