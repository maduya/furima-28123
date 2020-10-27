# テーブル設計

## users テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| nickname              | string     | null: false |
| email                 | string     | null: false |
| password              | string     | null: false |
| password_confirmation | string     | null: false |
| name_kanji            | string     | null: false |
| name_kana             | string     | null: false |
| birthday              | string     | null: false |

### Association

- has_many :items
- has_many :pay

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| product_name   | string | null: false |
| product_text   | string | null: false |
| detail         | string | null: false |
| delivery       | string | null: false |
| price          | string | null: false |

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

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| buyer_address | string     | null: false |
| credit        | string     | null: false |


### Association

- belongs_to :pay