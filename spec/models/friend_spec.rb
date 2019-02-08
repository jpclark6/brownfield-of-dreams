require 'rails_helper'

RSpec.describe Friend, type: :model do
  it 'exists' do
    user = create(:user)
    user_2 = create(:user)
    user.friends << user_2
    expect(user.friends).to eq([user_2])
  end
end