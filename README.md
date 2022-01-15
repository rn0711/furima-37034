# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| date_of_birth      | data   | null: false               |

### Association

- has_many: items
- has_many: buyers

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| itemname         | string     | null: false                    |
| introduction     | text       | null: false                    |
| category_id      | integer    | null: false                    | 
| condition_id     | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| delivery_area_id | integer    | null: false                    |
| delivery_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one: buyer

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: item
- has_one: delivery_address

## delivery_address テーブル

| Colum          | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| street         | string     | null: false                    |
| building       | string     |                                |
| tel_number     | string     | null: false                    |
| buyer          | references | null: false, foreign_key: true |

### Association

- belongs_to: buyer