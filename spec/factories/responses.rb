FactoryGirl.define do
  factory :response do
    team { Team.first }
    day { create(:day) }
    user { Team.first.team_users.first.user }
    response_a 'response given by user a'
    response_b 'response given by user b'
    response_c 'response given by user c'
  end
end
