FactoryBot.define do
  factory :question do
    discipline { nil }
    statement { "MyText" }
    text { "MyText" }
    answer { "MyString" }
    daily_access { 1 }
  end
end
