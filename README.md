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


## users テーブル　出品者情報を保存するデータ

| Column               | Type   | Options     |
| -----------------    | ------ | ----------- |
| first-name           | string | null: false |
| family-name          | string | null: false |
| first-name-phonetic  | string | null: false |
| family-name-phonetic | string | null: false |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| born                 | string | null: false |

### Association
- has_many :item

## items テーブル 商品の情報を保存するデータ

| Column           | Type    | Options     |
| ---------------  | ------- | ----------- |
| item             | string  | null: false |
| price            | string  | null: false |
| photo            | string  | null: false |
| status           | integer | null: false |
| category         | integer | null: false |
| delivery-fee     | integer | null: false |
| shipping-origin  | integer | null: false |
| days             | integer | null: false |


### Association
- has_many :user
- has_many :adress


### items_users

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user


## adress テーブル　購入者情報を保存するデータ

| Column      | Type    | Options                        |
| ----------  | ------  | ------------------------------ |
| prefecture  | string  | null: false                    |
| city        | string  | null: false                    |
| postal-code | string  | null: false                    |
| building    | string  | null: false                    |
| adress      | string  | null: false                    |
| phon-number | string  | null: false                    |
| items_users | integer | null: false, foreign_key: true |


### Association
- has_many : item