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


#########WorkTrainingTypeテーブル#################
TrainingType.create!(name: "バーベルトレーニング")
TrainingType.create!(name: "ダンベルトレーニング")
TrainingType.create!(name: "自重トレーニング")
TrainingType.create!(name: "スミスマシン")
TrainingType.create!(name: "ケーブルマシン")



#########BodyPartテーブル#################
BodyPart.create!(name: "上腕二頭筋")
BodyPart.create!(name: "上腕三頭筋")
BodyPart.create!(name: "大胸筋")
BodyPart.create!(name: "三角筋")
BodyPart.create!(name: "広背筋")
BodyPart.create!(name: "僧帽筋")
BodyPart.create!(name: "大腿四頭筋")
BodyPart.create!(name: "脊柱起立筋")


#########WorkOutテーブル#################
WorkOut.create!(name: "スクワッド",
                 training_type_id: 1,
                 body_part_id: 7)

WorkOut.create!(name: "デッドリフト",
                 training_type_id: 1,
                 body_part_id: 8)

WorkOut.create!(name: "ベンチプレス",
                 training_type_id: 1,
                 body_part_id: 3)

WorkOut.create!(name: "オーバーヘッドプレス",
                 training_type_id: 1,
                 body_part_id: 4)

WorkOut.create!(name: "ベントオーバーロウ",
                 training_type_id: 1,
                 body_part_id: 5)

WorkOut.create!(name: "スカルクラッシャー",
                 training_type_id: 1,
                 body_part_id: 2)

WorkOut.create!(name: "ダンベルハンマーカール",
                 training_type_id: 2,
                 body_part_id: 1)

WorkOut.create!(name: "ダンベルショルダープレス",
                 training_type_id: 2,
                 body_part_id: 4)

WorkOut.create!(name: "ダンベルサイドレイズ",
                 training_type_id: 2,
                 body_part_id: 4)

WorkOut.create!(name: "プッシュアップ",
                 training_type_id: 4,
                 body_part_id: 2)

WorkOut.create!(name: "チンニング",
                 training_type_id: 4,
                 body_part_id: 5)

