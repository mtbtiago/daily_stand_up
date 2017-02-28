require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'Validations' do
    it 'Should not permit invalid name' do
      team = build(:team, name: ' ')
      expect(team.valid?).to be false
      expect(team.errors[:name].present?).to be true
    end
    it 'Should have a slug' do
      team = build(:team, slug: '')
      expect(team.valid?).to be false
      expect(team.errors[:slug].present?).to be true
    end
  end
  context 'slug' do
    describe 'when created' do
      it 'should have an auto created slug' do
        team = Team.create(name: 'a project')
        expect(team.valid?).to be true
        expect(team.slug.present?).to be true
      end
    end
    it 'can be located by slug' do
      team = Team.first
      slug = team.slug
      expect(Team.find_by_slug(slug).slug).to eq slug
    end
  end
end
