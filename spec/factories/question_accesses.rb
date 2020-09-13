FactoryBot.define do
  factory :question_access do
    question
    date { Faker::Date.between(from: 10.days.ago, to: Date.today) }
    times_accessed { Faker::Number.number(digits: 5) }
  end
end
