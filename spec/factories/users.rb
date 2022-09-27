
FactoryBot.define do
  factory :user do
    id { 1 }
    full_name { "Dan Danielson"}
    email { "Dan@gmail.com" }
    password { "123456" }

    trait :user_2 do
      id { 2 }
      full_name { "Tyler Tylerson" }
      email { "Tyler@gmail.com" }
      password { "123456" }
    end
  end
end
