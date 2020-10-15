require 'rails_helper'

RSpec.describe ActiveFriendship, type: :model do
  let(:test_user) { User.create(name: 'Example User', email: 'abcefg@gmail.com', password: 'password') }
  let(:test_friend) { User.create(name: 'Example Friend', email: 'abcjkkj@gmail.com', password: 'password') }

  let(:subject) do
    described_class.new(
      user_id: test_user.id,
      friend_id: test_friend.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a user' do
      subject.user_id = ''
      expect(subject).not_to be_valid
    end

    it 'is not valid without a friend' do
      subject.friend_id = ''
      expect(subject).not_to be_valid
    end
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:friend) }
end