FactoryBot.define do
  factory :item do
    name                 { Faker::Name.last_name }
    introduction         { Faker::Lorem.sentence }
    region_id            { '5' }
    price                { '1000' }
    user_id              { '1' }
    genre_id             { '2' }
    status_id            { '2' }
    distribution_id      { '2' }
    term_id              { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
