FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'secret'
    password_confirmation 'secret'
  end
end