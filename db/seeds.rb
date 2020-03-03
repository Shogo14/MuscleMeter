# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#########Userテーブル#################
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Kinjo Shogo",
             email: "shogo14kinjo@gmail.com",
             password:              "fallout14",
             password_confirmation: "fallout14",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# 40.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end


#########WorkTrainingTypeテーブル#################
TrainingType.create!(name: "バーベルトレーニング")
TrainingType.create!(name: "ダンベルトレーニング")
TrainingType.create!(name: "自重トレーニング")
TrainingType.create!(name: "スミスマシン")
TrainingType.create!(name: "ケーブルマシン")
TrainingType.create!(name: "マシン")



#########BodyPartテーブル#################
BodyPart.create!(name: "上腕二頭筋")
BodyPart.create!(name: "上腕三頭筋")
BodyPart.create!(name: "大胸筋")
BodyPart.create!(name: "三角筋")
BodyPart.create!(name: "広背筋")
BodyPart.create!(name: "僧帽筋")
BodyPart.create!(name: "大腿四頭筋")
BodyPart.create!(name: "脊柱起立筋")
BodyPart.create!(name: "腹筋")


#########TrainingMenuテーブル#################
TrainingMenu.create!(name: "スクワッド",training_type_id: 1,body_part_id: 7)
TrainingMenu.create!(name: "デッドリフト",training_type_id: 1,body_part_id: 8)
TrainingMenu.create!(name: "ベンチプレス",training_type_id: 1,body_part_id: 3)
TrainingMenu.create!(name: "オーバーヘッドプレス",training_type_id: 1,body_part_id: 4)
TrainingMenu.create!(name: "ベントオーバーロウ",training_type_id: 1,body_part_id: 5)
TrainingMenu.create!(name: "スカルクラッシャー",training_type_id: 1,body_part_id: 2)
TrainingMenu.create!(name: "ダンベルハンマーカール",training_type_id: 2,body_part_id: 1)
TrainingMenu.create!(name: "ダンベルショルダープレス",training_type_id: 2,body_part_id: 4)
TrainingMenu.create!(name: "ダンベルサイドレイズ",training_type_id: 2,body_part_id: 4)
TrainingMenu.create!(name: "プッシュアップ",training_type_id: 4,body_part_id: 2)
TrainingMenu.create!(name: "チンニング",training_type_id: 4,body_part_id: 5)
TrainingMenu.create!(name: "アブドミナルクランチ",training_type_id: 6,body_part_id: 9)
      

#########WorkOutテーブル#################
WorkOut.create!(training_date: '2020-02-23',rep: 5,set: 5,weight: 65,user_id: 2,training_menu_id: 3)
WorkOut.create!(training_date: '2020-02-23',rep: 5,set: 5,weight: 80,user_id: 2,training_menu_id: 1)
WorkOut.create!(training_date: '2020-02-23',rep: 5,set: 5,weight: 50,user_id: 2,training_menu_id: 5)
WorkOut.create!(training_date: '2020-02-23',rep: 15,set: 3,weight: 14,user_id: 2,training_menu_id: 8)
WorkOut.create!(training_date: '2020-02-22',rep: 5,set: 5,weight: 90,user_id: 2,training_menu_id: 2)
WorkOut.create!(training_date: '2020-02-22',rep: 5,set: 5,weight: 40,user_id: 2,training_menu_id: 4)
WorkOut.create!(training_date: '2020-02-22',rep: 15,set: 3,weight: 9,user_id: 2,training_menu_id: 7)
WorkOut.create!(training_date: '2020-02-22',rep: 15,set: 5,weight: 5,user_id: 2,training_menu_id: 9)

WorkOut.create!(training_date: '2020-02-24',rep: 5,set: 5,weight: 92.5,user_id: 2,training_menu_id: 2)
WorkOut.create!(training_date: '2020-02-24',rep: 5,set: 5,weight: 40,user_id: 2,training_menu_id: 4)
WorkOut.create!(training_date: '2020-02-24',rep: 15,set: 3,weight: 9,user_id: 2,training_menu_id: 7)
WorkOut.create!(training_date: '2020-02-24',rep: 15,set: 5,weight: 5,user_id: 2,training_menu_id: 9)

WorkOut.create!(training_date: '2020-02-26',rep: 5,set: 5,weight: 65,user_id: 2,training_menu_id: 3)
WorkOut.create!(training_date: '2020-02-26',rep: 5,set: 5,weight: 82.5,user_id: 2,training_menu_id: 1)
WorkOut.create!(training_date: '2020-02-26',rep: 5,set: 5,weight: 52.5,user_id: 2,training_menu_id: 5)

WorkOut.create!(training_date: '2020-02-29',rep: 5,set: 5,weight: 95,user_id: 2,training_menu_id: 2)
WorkOut.create!(training_date: '2020-02-29',rep: 5,set: 5,weight: 42.5,user_id: 2,training_menu_id: 4)
WorkOut.create!(training_date: '2020-02-29',rep: 15,set: 3,weight: 9,user_id: 2,training_menu_id: 7)
WorkOut.create!(training_date: '2020-02-29',rep: 15,set: 5,weight: 5,user_id: 2,training_menu_id: 9)

WorkOut.create!(training_date: '2020-03-01',rep: 5,set: 5,weight: 62.5,user_id: 2,training_menu_id: 3)
WorkOut.create!(training_date: '2020-03-01',rep: 5,set: 5,weight: 85,user_id: 2,training_menu_id: 1)
WorkOut.create!(training_date: '2020-03-01',rep: 5,set: 5,weight: 55,user_id: 2,training_menu_id: 5)
WorkOut.create!(training_date: '2020-03-01',rep: 30,set: 3,weight: 27,user_id: 2,training_menu_id: 12)

