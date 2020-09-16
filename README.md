# README

# DB設計
---

## usersテーブル
---
|column|type|options|
|---|---|---|
|nickname|string|null:false|
|mail|string|null:false, unique:true|
|password|string|null:false|
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_hurigana|string|null:false|
|first_name_hurigana|string|null:false|
|birthday|date|null:false|

### Association
- has_many:items
- has_many:purchaces

## itemsテーブル
---
|column|type|options|
|---|---|---|
|item_name|string|null:false|
|item_explanation|text|null:false|
|item_status_id|integer|null:false|
|delivery_charge_id|integer|null:false|
|delivery_area_id|integer|null:false|
|delivery_days_id|integer|null:false|
|price|integer|null:false|
|user_id|integer|null:false, foreigh_key:true|

### Association
- belongs_to:user
- has_one:purchace

## purchaceテーブル
---
|column|type|options|
|---|---|---|
|postal_code|string|null:false|
|prefectures|string|null:false|
|citys|string|null:false|
|address|string|null:false|
|building_name|string||
|phone_number|string|null:false|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:ture|

### Association
- belongs_to:users
- belongs_to: items




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
