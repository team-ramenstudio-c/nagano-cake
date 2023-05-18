# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin User Data
Admin.create!(
   email: 'test@test.com',
   password: 'testtest'
)

# Customer Data
Customer.create!(
  email: 'test@test.com',
  last_name: '長野',
  first_name: '景気',
  furigana_last_name: 'ナガノ',
  furigana_first_name: 'ケイキ',
  address: 'レイル県レイルス市',
  post_code: '1111111',
  telephone_number: '00000000001',
  password: 'pppppp',
  is_deleted: false
)

# Genre Data
Genre.create!(name: 'ケーキ')
Genre.create!(name: 'プリン')
Genre.create!(name: '焼き菓子')
Genre.create!(name: 'キャンディ')

# item Data
genre = Genre.find_by(name: 'ケーキ')
Item.create!(
name: 'cake',
genre_id: genre.id,
description: 'Cake1',
price_without_tax: 1000,
is_on_sale: true)