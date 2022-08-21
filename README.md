# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association

- has_many :records
- has_many :items


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| content            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| postage_id         | integer    | null: false                    |
| region_id          | integer    | null: false                    |
| shopping_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |

### Association

- belongs to :user
- has_one :record


## records テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination


## destinations テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| record             | references | null: false, foreign_key: true |
| post_code          | string     | null: false                    |
| region_id          | integer    | null: false                    |
| municipality       | string     | null: false                    | 
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |

### Association

- belongs_to :record
