require 'faker'

FactoryGirl.define do
  factory :user do
    first_name             { Faker::Name.first_name }
    last_name              { Faker::Name.last_name }
    user_name              { Faker::Internet.user_name }
    email                  { Faker::Internet.email }
    password               "helloworld"
    password_confirmation  "helloworld"
  end
end
