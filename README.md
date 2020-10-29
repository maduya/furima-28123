# テーブル設計

## users テーブル

| Column                          | Type       | Options     |
| ------------------------------- | ---------- | ----------- |
| nickname                        | string     | null: false |
| email                           | string     | null: false |
| encrypted_password              | string     | null: false |
| first_name_kanji                | string     | null: false |
| last_name_kanji                 | string     | null: false |
| first_name_kana                 | string     | null: false |
| last_name_kana                  | string     | null: false |
| birthday                        | date       | null: false |

### Association

- has_many :items
- has_many :pays

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| detail_id          | integer    | null: false                    |
| delivery_burden_id | integer    | null: false                    |
| shipper_id         | integer    | null: false                    |
| days_id            | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

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

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| house           | string     |                                |
| phone_number    | string     | null: false                    |
| pay             | references | null: false, foreign_key: true |


### Association

- belongs_to :pay