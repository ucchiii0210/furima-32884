
# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
|    | text   | null: false |
| | text   | null: false |
|   | text   | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column     | Type       | Options                      |
| ---------- | ----------  ------------------------------|
| itemename     | string     | null:false                   |
| text | text      | null:false                   |
|    |  string    | null:false                   |
| user | references | null: false,foreign_key:true |

### Association

- belongs_to :users
- has_many   :comments

## comments テーブル

| Column    | Type       |Options                       |
| --------- | ---------- |------------------------------|
| text      | text       | null:false                   |
| user      | references | null: false, foreign_key:true|
| item | references | null: false, foreign_key:true|

### Association

- belongs_to :item
- belongs_to :users
