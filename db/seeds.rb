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

40.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end


#########WorkMenuTypeテーブル#################
WorkMenuType.create!(work_type: "バーベルトレーニング")
WorkMenuType.create!(work_type: "ダンベルトレーニング")
WorkMenuType.create!(work_type: "自重トレーニング")
WorkMenuType.create!(work_type: "スミスマシン")
WorkMenuType.create!(work_type: "ケーブルマシン")



#########TrainingBodyPartテーブル#################
TrainingBodyPart.create!(name: "上腕二頭筋")
TrainingBodyPart.create!(name: "上腕三頭筋")
TrainingBodyPart.create!(name: "大胸筋")
TrainingBodyPart.create!(name: "三角筋")
TrainingBodyPart.create!(name: "広背筋")
TrainingBodyPart.create!(name: "僧帽筋")
TrainingBodyPart.create!(name: "大腿四頭筋")
TrainingBodyPart.create!(name: "脊柱起立筋")


#########WorkMenuテーブル#################
WorkMenu.create!(name: "スクワッド",
                 work_menu_type_id: 1,
                 training_body_part_id: 7)

WorkMenu.create!(name: "デッドリフト",
                 work_menu_type_id: 1,
                 training_body_part_id: 8)

WorkMenu.create!(name: "ベンチプレス",
                 work_menu_type_id: 1,
                 training_body_part_id: 3)

WorkMenu.create!(name: "オーバーヘッドプレス",
                 work_menu_type_id: 1,
                 training_body_part_id: 4)

WorkMenu.create!(name: "ベントオーバーロウ",
                 work_menu_type_id: 1,
                 training_body_part_id: 5)

WorkMenu.create!(name: "スカルクラッシャー",
                 work_menu_type_id: 1,
                 training_body_part_id: 2)

WorkMenu.create!(name: "ダンベルハンマーカール",
                 work_menu_type_id: 2,
                 training_body_part_id: 1)

WorkMenu.create!(name: "ダンベルショルダープレス",
                 work_menu_type_id: 2,
                 training_body_part_id: 4)

WorkMenu.create!(name: "ダンベルサイドレイズ",
                 work_menu_type_id: 2,
                 training_body_part_id: 4)

WorkMenu.create!(name: "プッシュアップ",
                 work_menu_type_id: 4,
                 training_body_part_id: 2)

WorkMenu.create!(name: "チンニング",
                 work_menu_type_id: 4,
                 training_body_part_id: 5)

