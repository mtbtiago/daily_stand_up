require 'rails_helper'

RSpec.describe Day, type: :model do
  context 'day' do
    describe 'when created' do
      it "should have today's date" do
        day = create(:day)
        expect(day.today).to eq Time.zone.today
      end
    end
  end
end
