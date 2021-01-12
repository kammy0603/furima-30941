FactoryBot.define do
  factory :user_order do
    postal_code { "999-1234" }
    prefecture { 2 }
    municipalities { '横浜市' }
    address { '青山' }
    building_number { '柳ビル' }
    phone_number { 98765432109 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
