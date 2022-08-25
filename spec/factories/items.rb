FactoryBot.define do
  factory :item do
    association :user
    item_name        {'aaa'}
    content          {'aaaaa'}
    category_id      {Faker::Number.between(from: 2, to: 11)}
    condition_id     {Faker::Number.between(from: 2, to: 7)}
    postage_id       {Faker::Number.between(from: 2, to: 3)}
    region_id        {Faker::Number.between(from: 2, to: 48)}
    shopping_date_id {Faker::Number.between(from: 2, to: 4)}
    price            {Faker::Number.between(from: 300, to: 9999999)}
  end
end
