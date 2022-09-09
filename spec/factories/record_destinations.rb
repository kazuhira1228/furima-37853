FactoryBot.define do
  factory :record_destination do
    post_code     {'123-4567'}
    region_id     {Faker::Number.between(from: 2, to: 48)}
    municipality  {'市区町村名'}
    address       {'1-1'}
    building_name {'アパート名'}
    phone_number  {12345678901}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end