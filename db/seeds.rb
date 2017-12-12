# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'liangchaob@163.com',password: "000000",password_confirmation: "000000",admin: true)
User.create(email: 'a@dcits.com',password: "000000",password_confirmation: "000000")
User.create(email: 'b@dcits.com',password: "000000",password_confirmation: "000000")
User.create(email: 'c@dcits.com',password: "000000",password_confirmation: "000000")
User.create(email: 'd@dcits.com',password: "000000",password_confirmation: "000000")


User.find_each do |user|
  Weekly.create(year: 2017,week: 53,start_time: Time.local(2017,12,11),end_time: Time.local(2017,12,17),user_id: user.id )
  Weekly.create(year: 2017,week: 52,start_time: Time.local(2017,12,4),end_time: Time.local(2017,12,10),user_id: user.id )
  Weekly.create(year: 2017,week: 51,start_time: Time.local(2017,11,27),end_time: Time.local(2017,12,3),user_id: user.id )
end

Skill.create(name: '网络')
Skill.create(name: '服务器')
Skill.create(name: '安全')
Skill.create(name: '其他')


Company.create(name: '华为')
Company.create(name: '思科')
Company.create(name: 'IBM')
Company.create(name: '其他')