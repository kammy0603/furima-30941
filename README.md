## users テーブル

| Column             | Type    | Options      |
| --------           | ------  | -----------  |
| nickname           | string  | null: false  |
| email              | string  | unique: true null:false|
| encrypted_password | string  | null: false  |
| family_name_kanji  | string  | null: false  |
| first_name_kanji   | string  | null: false  |
| family_name_kana   | string  | null: false  |
| first_name_kana    | string  | null: false  |
| birthday           | date    | null: false  |

### Association

- has_many :users_products
- has_many :products

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
| user                 | references    | foreign_key: true |

### Association

- has_many :user_product
- has_one  :purchase
- belong_to :user

## purchases テーブル

| Column          | Type       | Option            |
| ------          | -------    | -----------       |
| postal_code     | string     | null: false       |
| region_id       | integer    | null: false       |
| municipalities  | string     | null: false       |
| address         | string     | null: false       |
| building_number | string     |                   |
| phone_number    | string     | null: false       |
| user_product    | references | foreign_key: true |


### Association

- belong_to :product
- belong_to :user_product


## Users_Products テーブル
| Column       | Type       | Option            |
| ------       | -------    | -----------       |
| user         | references | foreign_key: true |
| product      | references | foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
- has_one :purchase