require 'rails_helper'

RSpec.describe Friend, type: :model do
  # describe 'relationships' do
  #   it { should have_many :friendships }
  #   it { should have_many(:users).through(:friendships) }
  # end
  it 'exists' do
    user = create(:user)
    user_2 = create(:user)
    user.friends << user_2
    expect(user.friends).to eq([user_2])
  end
end