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


## users テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| log      | string | null: false |
| adress   | string | null: false |
| born     | string | null: false |

### Association
- has_many :item_users
- has_many :item, through: item_users

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item   | string | null: false |
| price  | string | null: false |
| photo  | string | null: false |

### Association
- has_many :item_users
- has_many :user, through: item_users

## item_users テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item