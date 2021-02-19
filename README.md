# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| email            | string | null: false |
| password         | string | null: false |
| nickname         | string | null: false |
| first_name       | string | mull: false |
| second_name      | string | null: false |
| first_name_kana  | string | null: false |
| second_name_kana | string | null: false |
| birthday_year    | date   | null: false |
| birthday_month   | date   | null: false |
| birthday_day     | date   | null: false |

### Association

- has_many :items
- has_one  :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category            | string     | null: false                    |
| price               | integer    | null: false                    |
| image               |            |                                |
| user                | references | null: false, foreign_key: true |

### Association

- has_one    :orders
- belongs_to :users

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| charge_burden | string     | null: false                    |
| prefectures   | string     | null: false                    |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items