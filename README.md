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

- has_many :purchases
- has_many :items

## items テーブル

| Column               | Type          | Options     |
| ------               | ------        | ----------- |
| name                 | string        | null: false |
| introduction         | text          | null: false |
| category_id          | integer       | null: false |
| item_status_id       | integer       | null: false |
| distribution_fee_id  | integer       | null: false |
| region_id            | integer       | null: false |
| distribution_term_id | integer       | null: false |
| price                | integer       | null: false |
| user                 | references    | foreign_key: true |

### Association

- has_one  :purchase
- belong_to :user

## Orders テーブル

| Column          | Type       | Option            |
| ------          | -------    | -----------       |
| postal_code     | string     | null: false       |
| region_id       | integer    | null: false       |
| municipalities  | string     | null: false       |
| address         | string     | null: false       |
| building_number | string     |                   |
| phone_number    | string     | null: false       |
| user_item       | references | foreign_key: true |


### Association

- belong_to :purchase


## Purchases テーブル
| Column       | Type       | Option            |
| ------       | -------    | -----------       |
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :order