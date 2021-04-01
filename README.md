
# テーブル設計

## users テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| email              | string     | null: false,unique: true      |
| encrypted_password | string     | null: false                   |
| nickname           | string     | null: false                   |
| first_name         | string     | null: false                   | 
| last_name          | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| last_name_kana     | string     | null: false                   |
| birthday           | date       | null: false                   |

### Association

- has_many :items
- has_many :purchases


### purchases テーブル
| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| user       | references | null:false, foreign_key: true |
| item       | references | null:false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :order


### orders テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| postal     | string     | null:false                    |
| area_id    | integer    | null:false                    |
| city       | string     | null:false                    |
| address    | string     | null:false                    |
| property   | string     |                               |
| tell       | string     | null:false                    |
| purchase   | references | null:false, foreign_key: true |

### Association
- belongs_to :purchase


## items テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| product     | string     | null:false                    |
| text        | text       | null:false                    |
| category_id | integer    | null:false                    |
| sipping_id  | integer    | null:false                    |
| status_id   | integer    | null:false                    |
| area_id     | integer    | null:false                    |
| day_id      | integer    | null:false                    |
| price       | integer    | null:false                    |
| user        | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase
