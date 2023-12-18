## Usersテーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

has_many: items
has_many: comments
has_many: purchase_records

## Itemsテーブル

| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product          | string     | null: false                    |
| description      | text       | null: false                    |
| condition_id     | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

belongs_to: user
has_many: comments
has_one: purchase_record

## Commentsテーブル

| Colum       | Type       | Options                        |
| ----------- | ---------- | ------------------------------ | 
| description | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

belongs_to: user
belongs_to: item

## Addressesテーブル

| Colum            | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| post_code        | string      | null: false                    |
| area_id          | integer     | null: false                    |
| municipalities   | string      | null: false                    |
| street_address   | string      | null: false                    |
| building_name    | string      |                                |
| telephone_number | string      | null: false                    |
| purchase_record  | references  | null: false, foreign_key: true |

### Association

belongs_to: purchase_record

## Purchase_records

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| item  | references | null: false, foreign_key: true |
| user  | references | null: false, foreign_key: true |

### Association

belongs_to: item
belongs_to: user
has_one: address