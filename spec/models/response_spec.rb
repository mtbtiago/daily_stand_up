require 'rails_helper'

RSpec.describe Response, type: :model do
  describe 'Validations' do
    it 'Should have a slug' do
      response = build(:response, slug: '')
      expect(response.valid?).to be false
      expect(response.errors[:slug].present?).to be true
    end
  end
  context 'slug' do
    describe 'when created' do
      it 'should have an auto created slug' do
        response = build(:response)
        expect(response.valid?).to be true
        expect(response.slug.present?).to be true
      end
    end
    # TODO: test find_by_slug
  end
end
