# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :record_users
- has_many :records, through: :record_users
- has_many :items

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    | string | null: false |
| name     | string | null: false |
| content  | text   | null: false |
| category | string | null: false |

### Association

- belongs to :users
- belongs to :records

## record_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| record | references | null: false, foreign_key: true |

### Association

- belongs_to :record
- belongs_to :user

## record テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buyer   | string     | null: false                    |
| item    | references | null: false, foreign_key: true |

### Association

- has_many :record_users
- has_many :users, through: :record_users
- belongs_to :items

## destination テーブル
| Column         | Type       | Options                  |
| -------------- | ---------- | ------------------------ |
| post_code      | string     | null: false              |
| prefecture     | string     | null: false              |
| municipality   | string     | null: false              |
| address        | string     | null: false              |
| building_name  | string     | null: false              |
| phone_number   | integer    | null: false              |

### Association

- belongs_to :records
