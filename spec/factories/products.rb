FactoryBot.define do
  factory :product do
    name { "Test Product" }
    description { "This is a test description for the product." }
    price { 9.99 }
  end
end