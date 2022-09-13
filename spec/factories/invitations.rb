FactoryBot.define do
  factory :invitation do
    user { nil }
    friend_id { 1 }
    confirmed { false }
  end
end
