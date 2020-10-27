# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :pay

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | string | null: false |
| image  | string | null: false |

### Association

- belongs_to :user
- has_one :pay

## pays テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user

## address テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| buyer_address | string     | null: false |


### Association

- belongs_to :pay