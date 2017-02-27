FactoryGirl.define do
  factory :day do
    team { Team.first }
  end
end
