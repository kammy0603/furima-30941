## users テーブル

| Column             | Type    | Options     |
| --------           | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name_kanji  | string  | null: false |
| first_name_kanji   | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :users_products
- has_many :purchases

## products テーブル

| Column               | Type          | Options     |
| ------               | ------        | ----------- |
| name                 | string        | null: false |
| introduction         | text          | null: false |
| category_id          | integer       | null: false |
| product_status_id    | integer       | null: false |
| distribution_fee_id  | integer       | null: false |
| region_id            | integer       | null: false |
| distribution_term_id | integer       | null: false |
| price                | integer       | null: false |
| user_id              | integer       | foreign_key: true |

### Association

- has_one  :purchase
- has_many :users_products

## purchases テーブル

| Column          | Type    | Option            |
| ------          | ------- | -----------       |
| postal_code     | string  | null: false       |
| region_id       | integer | null: false       |
| municipalities  | string  | null: false       |
| address         | string  | null: false       |
| building_number | string  |                   |
| phone_number    | integer | null: false       |
| user_id         | integer | foreign_key: true |


### Association

- belongs_to :product
- belongs_to :user


## Users_Products テーブル
| Column          | Type    | Option            |
| ------          | ------- | -----------       |
| user_id         | integer | foreign_key: true |
| product_id      | integer | foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user