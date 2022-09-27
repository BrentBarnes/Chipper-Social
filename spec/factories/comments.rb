FactoryBot.define do
  factory :comment do
    association :post
    user_id { 1 }
    comment_content { 'Test comment' }
  end
end
