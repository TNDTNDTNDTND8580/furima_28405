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

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| first-name | string | null: false |
| family-name| string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association
- has_many :item
- has_many :adress

## items テーブル 商品の情報を保存するデータ

| Column   | Type   | Options     |
| ------   | ------ | ----------- |
| item     | string | null: false |
| price    | string | null: false |
| photo    | string | null: false |
| commennt | string | null: false |
| fovorite | string | null: false |

### Association
- has_many :user
- has_many :adress

## adress テーブル　購入者情報を保存するデータ

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| first-name | string | null: false |
| family-name| string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| country    | string | null: false |
| prefecture | string | null: false |
| city       | string | null: false |

### Association
- has_many : user
- has_many : item