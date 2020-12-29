FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name_kanji     { '神谷' }
    first_name_kanji      { '崇' }
    family_name_kana      { 'カミヤ' }
    first_name_kana       { 'タカシ' }
    birthday              { '19900603' }
  end
end
