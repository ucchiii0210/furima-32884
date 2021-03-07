
# テーブル設計

## users テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| email         | string     | null: false                   |
| password      | string     | null: false                   |
| nickname      | string     | null: false                   |
| firstname     | string     | null: false                   | 
| lastname      | string     | null: false                   |
| firstnamekana | string     | null: false                   |
| lastnamekana  | string     | null: false                   |
| birthday      | date       | null: false                   |
| user          | references | null: false, foreign_key:true |
| item          | references | null: false, foreign_key:true |

### Association

- has_many :items
- has_one  :order
- has_many :comments


### orders テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| postal     | string     | null:false                    |
| prefectuer | string     | null:false                    |
| city       | string     | null:false                    |
| appress    | string     | null:false                    |
| property   | string     | null:false                    |
| tell       | string     | null:false                    |
| card       | string     | null:false                    |
| user       | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_many :items


## items テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| itemename  | string     | null:false                    |
| text       | text       | null:false                    |
| category   | string     | null:false                    |
| sipping    | string     | null:false                    |
| status     | string     | null:false                    |
| eria       | string     | null:false                    |
| deys       | string     | null:false                    |
| user       | references | null: false, foreign_key:true |


### Association

- belongs_to :user
- belongs_to :order
- has_many   :comments

## comments テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| text      | text       | null:false                    |
| user      | references | null: false, foreign_key:true |
| item      | references | null: false, foreign_key:true |

### Association

- belongs_to :item
- belongs_to :user
