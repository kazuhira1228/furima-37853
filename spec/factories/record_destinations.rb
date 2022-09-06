FactoryBot.define do
  factory :record_destination do
    post_code     {'123-4567'}
    region_id     {Faker::Number.between(from: 2, to: 48)}
    municipality  {'区市町村名'}
    address       {'1-1'}
    building_name {'アパート名'}
    phone_number  {"1234567890"}
  end
end