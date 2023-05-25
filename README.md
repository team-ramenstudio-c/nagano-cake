# ながのケーキ チーム-ラーメンスタジオ
<img width="1453" alt="スクリーンショット 2023-05-25 17 02 44" src="https://github.com/team-ramenstudio-c/nagano-cake/assets/86299044/381dfc6b-a8cf-4fc9-a918-4a864ef3387d">

<img width="1443" alt="スクリーンショット 2023-05-25 17 03 00" src="https://github.com/team-ramenstudio-c/nagano-cake/assets/86299044/01228bdc-b5df-46e3-83dd-2c212522a148">


## 概要
長野県にある洋菓子店「ながのCAKE」の商品の通販を想定した、ECサイトを開発。 <br>
このECサイトはDMM WEB CAMP生によるチーム開発課題です。<br>
Railsを使っての基本的なECサイトの作成を行いましたので、参考までにご覧ください。

## アプリの説明
テーマについては、下記のサイトから高級感のあるサイトを目指して配色を選びました。
https://colorhunt.co/palette/1a120b3c2a21d5cea3e5e5cb

### ◆案件の背景
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るよう
になった。<br>
InstagramのDMやメールで通販の注文を受けていたが、<br>
情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

## 言語とフレームワークのバージョン

- ruby 3.1.2p20
- Rails 6.1.7.3
- Bootstrap v5.2.3

## 環境構築に必要な手順

```
$ git clone git@github.com:team-ramenstudio-c/nagano-cake.git
$ cd Nagano-cake
$ rails db:migrate
$ rails db:seed
$ yarn install
$ bundle install
```
### 使用したGem

```
gem 'devise'
gem 'ransack'
gem 'kaminari','~> 1.2.1'
gem 'image_processing', '~>1.2'
gem 'enum_help'
gem 'pry-byebug'
gem 'rails-i18n'
gem 'jquery-rails'
```

## 実装した機能
- ### 顧客側
- 会員登録、ログイン・ログアウト、退会
- 会員情報の編集
- カートへの追加、商品購入
- 支払い方法、配送先の指定
- 注文履歴の閲覧

- ### 管理者側
- 商品の新規追加、編集、閲覧
- 商品情報の編集
- 会員登録されているユーザ情報の閲覧、編集、退会処理
- ユーザの注文履歴閲覧

- ### その他
- 商品検索機能
- 商品ジャンルごとの商品検索機能

## 設計書
- ER図
- テーブル定義書
- アプリケーション詳細設計書

## 使用方法
- 管理者ページのログイン
初期段階での管理者ページのログインに必要なメールアドレス及びパスワードは下記の通りです。

- メールアドレス：test@test.com
- パスワード:testtest

## 作成者アカウント
個人GitHubへのリンク
- [菅原](https://github.com/uknow1229)
- [吉見](https://github.com/yoshimitakuto)
- [永井](https://github.com/NGIKK)







