FactoryBot.define do
  sequence(:name) { |n| "#{n}" }

  factory :product do
    name
    description "This is a white cusion"
    colour "white"
    price 2.0
  end

end
