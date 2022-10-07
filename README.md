# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name         | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_date         | date                | null: false               |

### Association

* has_many :items
* has_many :histories

## items table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| name               | string              | null: false                    |
| information        | text                | null: false                    |
| category_id        | integer             | null: false                    |
| condition_id       | integer             | null: false                    |
| delivery_burden_id | integer             | null: false                    |
| sender_area_id     | integer             | null: false                    |
| schedule_id        | integer             | null: false                    |
| price              | integer             | null: false                    |
| user               | references          | null: false, foreign_key: true |
 
### Association

- belongs_to :user
- has_one : history

## addresses table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| post_code          | string              | null: false                   |
| sender_area_id     | integer             | null: false                   |
| municipalities     | string              | null: false                   |
| address            | string              | null: false                   |
| building_name      | string              |                               |
| phone_number       | string              | null: false                   |
| history            | references          | null: false, foreign_key: true |

### Association

- belongs_to :history
 
## histories table
| user               | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- belongs_to :item
