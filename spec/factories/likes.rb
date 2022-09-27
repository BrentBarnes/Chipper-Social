FactoryBot.define do
  factory :like do
    for_post

    trait :for_post do
      association :user
      association :likeable, factory: :post
    end

    trait :for_comment do
      association :user
      association :likeable, factory: :comment
    end
  end
end
