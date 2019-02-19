FactoryBot.define do
  factory :physical_test do
    date 							{ FFaker::Time.datetime }
    user_id						{ 2 }
    suggested_program { 1 }
  end
end
