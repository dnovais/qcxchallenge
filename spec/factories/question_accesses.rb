FactoryBot.define do
  factory :question_access do
    question
    date { Faker::Date.between(from: 60.days.ago, to: Date.today) }
    times_accessed { Faker::Number.number(digits: 5) }

    trait :this_week do
      date { Faker::Date.between(from: DateTime.now.beginning_of_week, to: Date.today) }  
    end

    trait :this_month do
      date { Faker::Date.between(from: DateTime.now.beginning_of_month, to: Date.today) }  
    end

    trait :this_year do
      date { Faker::Date.between(from: DateTime.now.beginning_of_year, to: Date.today) }  
    end
  end
end
