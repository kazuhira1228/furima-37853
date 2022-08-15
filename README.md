# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :records
- has_many :items


## items テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| name          | string | null: false |
| content       | text   | null: false |
| category      | string | null: false |
| condition     | string | null: false |
| postage       | string | null: false |
| region        | string | null: false |
| shopping_date | string | null: false |
| price         | integer | null: false |

### Association

- belongs to :user
- belongs to :record


## records テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## destination テーブル
| Column         | Type       | Options                  |
| -------------- | ---------- | ------------------------ |
| post_code      | string     | null: false              |
| region         | string     | null: false              |
| municipality   | string     | null: false              |
| address        | string     | null: false              |
| building_name  | string     | null: false              |
| phone_number   | integer    | null: false              |

### Association

- belongs_to :record
