require 'rails_helper'

RSpec.describe Response, type: :model do
  before do
    Timecop.freeze(frozen_datetime)
  end

  after do
    Timecop.return
  end

  let(:frozen_datetime) { DateTime.new(2017, 7, 20, 8, 0, 0) }

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
    it 'can be located by slug' do
      response = create(:response)
      slug = response.slug
      expect(Response.find_by(slug: slug).slug).to eq slug
    end
  end
end
