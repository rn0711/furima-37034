FactoryBot.define do
  factory :item do
    itemname {Faker::Name.name}
    introduction {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    postage_id {2}
    delivery_area_id {2}
    delivery_date_id {2}
    price {Faker::Number.within(range: 300..9_999_999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
