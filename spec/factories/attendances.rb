FactoryBot.define do
  factory :attendance do
    date { "2019-02-18 18:04:27" }
    association :user
  end
end
