# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| email              | string | unique: true |
| encrypted_password | string | unique: true |
| nickname           | string | null: false  |
| first_name         | string | mull: false  |
| second_name        | string | null: false  |
| first_name_kana    | string | null: false  |
| second_name_kana   | string | null: false  |
| birthday           | date   | null: false  |

### Association

- has_many :items
- has_one  :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| charge_burden | string     | null: false                    |
| prefectures   | string     | null: false                    |
| price         | integer    | null: false                    |
| days          | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- has_one    :orders
- belongs_to :user

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

##  buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building name | string     |                                |
| phone number  | integer    | null: false                    |
| orders_id     | references | null: false, foreign_key: true |


### Association

- belongs_to :order