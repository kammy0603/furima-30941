FactoryBot.define do
  factory :item do
    name                 { Faker::Name.last_name }
    introduction         { Faker::Lorem.sentence }
    #category_id          { '2' }
    #item_status_id       { '3' }
    #distribution_fee_id  { '4' }
    region_id            { '5' }
    #distribution_term_id { '6' }
    price                { '1000' }
    user_id              { '1' }
    genre_id             { '2' }
    status_id            { '2' }
    distribution_id      { '2' }
    #region_genre_id      { '2' }
    term_id              { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
