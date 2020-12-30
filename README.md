# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## user(ユーザ情報)

|Column   |Type|Options      |
|---------|------|-----------|
|username |string|null: false|
|email    |string|null: false|
|password |string|null: false|

### Association

has_many :products
has_many :purchases
has_many :comments

## product(商品情報)
|Column      |Type      |Options                       |
|------------|----------|------------------------------|
|productname |string    |null: false                   |
|amount      |integer   |null: false                   |
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
|address |string    |null: false                   |

### Association
has_one :product
belongs_to :user

## comment(コメント情報)
|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|user    |references|null: false, foreign_key: true|
|product |references|null: false, foreign_key: true|
|comment |text      |null: false                   |

### Association
belongs_to :product
belongs_to :user

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
