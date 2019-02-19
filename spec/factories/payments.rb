FactoryBot.define do
  factory :payment do
    date { "2019-02-18 17:52:28" }
    amount { 1.5 }
    status { 1 }
    belongs_to { "" }
  end
end
