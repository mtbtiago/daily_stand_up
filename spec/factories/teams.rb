FactoryGirl.define do
  factory :team do
    name 'tmsa mobi'
    active true
    slug SecureRandom.uuid
    standup_start_hour 8
    standup_start_minute 0
    standup_end_hour 9
    standup_end_minute 30
    question_a 'What did you do yesterday?'
    question_b 'What will you do today?'
    question_c 'Are there any impediments in your way?'
  end
end
