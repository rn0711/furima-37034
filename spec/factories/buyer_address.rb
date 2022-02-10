FactoryBot.define do
  factory :buyer_address do
    post_code {'123-4567'}
    delivery_area_id { 2 }
    city {'横浜市緑区'}
    street {'青山1-1-1'}
    building {'柳ビル103'}
    tel_number {'08012345678'}
    association :user
    association :item
    token {'tok_abcdefghijk00000000000000000'}
  end
end
