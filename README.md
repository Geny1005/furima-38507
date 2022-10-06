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
* has_many :purchase

## items table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| price              | string              | null: false                   |
| user               | references          | null: false,foreign_key: true |
| category           | string              | null: false                   |
| condition          | string              | null: false                   |
| delivery charge    | string              | null: false                   |
| sender             | string              | null: false                   |
| schedule           | string              | null: false                   |

### Association

- belongs_to :user
- has_one : purchase

## purchase table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| card number        | string              | null: false                   |
| expiration         | string              | null: false                   |
| security code      | string              | null: false                   |
| post code          | string              | null: false                   |
| prefectures        | string              | null: false                   |
| municipalities     | string              | null: false                   |
| address            | string              | null: false                   |
| building name      | string              |                               |
| phone number       | string              | null: false                   |

### Association

- belongs_to :items
- belongs_to :user