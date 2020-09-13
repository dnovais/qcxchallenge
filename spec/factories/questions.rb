FactoryBot.define do
  factory :question do
    discipline
    statement { Faker::Lorem.sentences(number: 1) }
    text { Faker::Lorem.paragraphs }
    answer { ('A'..'E').to_a.sample }
    daily_access { Faker::Number.number(digits: 2) }
  end
end
