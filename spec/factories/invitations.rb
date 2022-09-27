FactoryBot.define do
  factory :invitation do
    association :user
    friend_id { 2 }

    trait :current_user_invited do
      user_id { 2 }
      friend_id { 1 }
    end
  end
end
