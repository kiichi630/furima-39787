## Usersテーブル

| Colum           | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birthday        | string | null: false               |

### Association

has_many: items
has_many: comments
has_one: address

## Itemsテーブル

| Colum         | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| product       | string     | null: false                    |
| text          | text       | null: false                    |
| condition     | string     | null: false                    |
| category      | string     | null: false                    |
| shipping_cost | string     | null: false                    |
| area          | string     | null: false                    |
| shipping_days | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

belongs_to: user
has_many: comments
has_one: purchase_record

## Commentsテーブル

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ | 
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

belongs_to: user
belongs_to: item

## Addressテーブル

| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone_number | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

belongs_to: user

## Purchase_records

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| item  | references | null: false, foreign_key: true |

### Association

belongs_to: item