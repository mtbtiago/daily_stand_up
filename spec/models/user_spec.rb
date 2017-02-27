require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Should not permit invalid email' do
      user = User.create(name: 'pepe', email: 'aaaa')
      expect(user.valid?).to be false
      expect(user.errors[:email].present?).to be true
    end
    it 'Should not permit invalid name' do
      user = User.create(name: 'aa', email: 'a@a.com')
      expect(user.valid?).to be false
      expect(user.errors[:name].present?).to be true
    end
  end
end
