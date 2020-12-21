## users テーブル

| Column            | Type    | Options     |
| --------          | ------  | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
| family_name_kanji | string  | null: false |
| first_name_kanji  | string  | null: false |
| family_name_kana  | string  | null: false |
| first_name_kana   | string  | null: false |
| birthday          | integer | null: false |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column               | Type          | Options     |
| ------               | ------        | ----------- |
| image                | ActiveStorage | ----------- |
| product_name         | text          | null: false |
| product_introduction | text          | null: false |
| category             | string        | null: false |
| product_status       | string        | null: false |
| distribution_fee     | integer       | null: false |
| region               | string        | null: false |
| distribution_term    | string        | null: false |
| price                | integer       | null: false |
| user_id              | integer       | foreign_key: true |

### Association

- has_one    :purchases
- belongs_to :users

## purchases テーブル

| Column          | Type    | Option            |
| ------          | ------- | -----------       |
| card_number     | integer | null: false       |
| invalid_limit   | integer | null: false       |
| security_code   | integer | null: false       |
| postal_code     | integer | null: false       |
| prefecture      | string  | null: false       |
| municipalities  | string  | null: false       |
| address         | strings | null: false       |
| building_number | string  |                   |
| phone_number    | integer | null: false       |
| user_id         | integer | foreign_key: true |
| products        | integer | foreign_key: true |


### Association

- belongs_to :products
- belongs_to :users
