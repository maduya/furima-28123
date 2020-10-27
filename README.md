# テーブル設計

## users テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| nickname              | string     | null: false |
| email                 | string     | null: false |
| password              | string     | null: false |
| password_confirmation | string     | null: false |
| first_name_kanji      | string     | null: false |
| last_name_kanji       | string     | null: false |
| first_name_kana       | string     | null: false |
| last_name_kana        | string     | null: false |
| birthday              | date       | null: false |

### Association

- has_many :items
- has_many :pays

## items テーブル

| Column | Type  | Options     |
| ------ | ----- | ----------- |
| product_name   | string | null: false |
| product_text   | string | null: false |
| product_image  | string | null: false |
| detail         | string | null: false |
| delivery       | string | null: false |
| price          | string | null: false |
| category       | string | null: false |

### Association

- belongs_to :user
- has_one :pay

## pays テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address

## addresses テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| credit          | string | null: false |
| expiration_date | string | null: false |
| security_code   | string | null: false |
| postal_code     | string | null: false |
| prefectures     | string | null: false |
| city            | string | null: false |
| house_number    | string | null: false |
| phone_number    | string | null: false |


### Association

- belongs_to :pay