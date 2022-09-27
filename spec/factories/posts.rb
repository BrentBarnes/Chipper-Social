FactoryBot.define do
  factory :post do
    id { 1 }
    user_id { 1 }
    post_content { "Test post" }
  end
end