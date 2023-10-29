FactoryBot.define do
  factory :comment do
    association :story, factory: [:story]
  end
end
