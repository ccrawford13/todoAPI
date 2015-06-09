FactoryGirl.define do
  factory :user do
    first_name 'bill'
    last_name 'williams'
    email "bill@example.com"
    password "helloworld"
    password_confirmation "helloworld"
  end

end
