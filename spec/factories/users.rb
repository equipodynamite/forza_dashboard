FactoryBot.define do
  factory :user do
  	email 				{ FFaker::Internet.email }
  	username 			{ FFaker::Internet.user_name }
  	password 			{ FFaker::Internet.password }
  	phone_number	{ FFaker::PhoneNumber.short_phone_number }
  	status 				{ 2 }
  	program 			{ 3 }
  	membership_id { 4 }
  end
end
