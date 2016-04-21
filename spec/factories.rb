FactoryGirl.define do
  factory :user do
    name     "Some User"
    email    "some@email.com"
    password "test123"
    password_confirmation "test123"
  end
end
