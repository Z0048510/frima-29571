# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## user(ユーザ情報)

|Column             |Type  |Options                  |
|-------------------|------|-------------------------|
|nickname           |string|null: false              |
|firstname          |string|null: false              |
|familyname         |string|null: false              |
|firstnameasc       |string|null: false              |
|familynameasc      |string|null: false              |
|email              |string|null: false, unique: true|
|encrypted_password |string|null: false              |
|birthday           |date  |null: false              |

### Association
has_many :products
has_many :purchases
has_many :comments

## product(商品情報)
|Column      |Type      |Options                       |
|------------|----------|------------------------------|
|productname |string    |null: false                   |
|amount      |integer   |null: false                   |
|desctiption |string    |null: false                   |
|category_id |integer   |null: false                   |
|status_id   |integer   |null: false                   |
|payment_id  |integer   |null: false                   |
|area_id     |integer   |null: false                   |
|day_id      |integer   |null: false                   |
|user        |references|null :false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase
has_many :comments


## purchase(購入情報)
|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|product |references|null: false, foreign_key: true|
|user    |references|null: false, foreign_key: true|

### Association
belongs_to :product
belongs_to :user
has_one :shopping

## comment(コメント情報)
|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|user    |references|null: false, foreign_key: true|
|product |references|null: false, foreign_key: true|
|comment |text      |null: false                   |

### Association
belongs_to :product
belongs_to :user


## shopping(発送情報)
|Column         |Type      |Options                       |
|---------------|----------|------------------------------|
|purchase       |references|null: false, foreign_key: true|
|postnumber     |string    |null: false                   |
|prefectures_id |integer   |null: false                   |
|municipality   |string    |null: false                   |
|address        |string    |null: false                   |
|buildingname   |string    |                              |
|phonenumber    |string    |null: false                   |
|address        |string    |null: false                   |

### Association
belongs_to :purchase


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
