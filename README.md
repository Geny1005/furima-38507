# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| birthday           | string              | null: false               |

### Association

* has_many :items
* has_many :histories

## items table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| name               | string              | null: false                   |
| information        | text                | null: false                   |
| category_id        | integer             | null: false                   |
| condition_id       | integer             | null: false                   |
| delivery burden_id | integer             | null: false                   |
| sender area_id     | integer             | null: false                   |
| schedule_id        | integer             | null: false                   |
| price              | integer             | null: false                   |

### Association

- belongs_to :user
- has_one : history

## address table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| post code          | integer             | null: false                   |
| prefectures_id     | integer              | null: false                   |
| municipalities     | string              | null: false                   |
| address            | string              | null: false                   |
| building name      | string              |                               |
| phone number       | string              | null: false                   |

### Association

- belongs_to :histories

## history table

### Association
- belongs_to :user
- has_one :address