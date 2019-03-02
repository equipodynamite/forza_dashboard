FactoryBot.define do
  factory :role do
    name { FFaker::Internet.user_name }
  end
end
