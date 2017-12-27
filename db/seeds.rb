# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sbu.create(name: "解决方案部")
Sbu.create(name: "金融事业部")
Sbu.create(name: "互联网事业部")

User.create(email: 'liangchaob@163.com',password: "000000",password_confirmation: "000000",admin: true,itcode: "liangchaob",code: "1001959",name: "梁超",sbu_id: 1,phone: '18600295379',title: '开发工程师',level: 5,cost: 9999)
User.create(email: 'a@dcits.com',password: "000000",password_confirmation: "000000",itcode: "a",code: "1001958",name: "张三",sbu_id: 2,phone: '1860747625',title: '网络工程师',level: 3,cost: 8888)
User.create(email: 'b@dcits.com',password: "000000",password_confirmation: "000000",itcode: "b",code: "1001957",name: "李四",sbu_id: 3,phone: '1860747655',title: '系统工程师',level: 4,cost: 7777)
User.create(email: 'c@dcits.com',password: "000000",password_confirmation: "000000",itcode: "c",code: "1001950",name: "王五",sbu_id: 1,phone: '1360347625',title: '项目经理',level: 2,cost: 6666)
User.create(email: 'd@dcits.com',password: "000000",password_confirmation: "000000",itcode: "d",code: "1001111",name: "王麻子",sbu_id: 1,phone: '1888888888',title: '大老板',level: 6,cost: 5555)



week = WeeklyTemplate.create(year: 2017,month:11,week: 51,start_time: Time.local(2017,11,27),end_time: Time.local(2017,12,3))
week.create_weeklies!
week = WeeklyTemplate.create(year: 2017,month:12,week: 52,start_time: Time.local(2017,12,4),end_time: Time.local(2017,12,10))
week.create_weeklies!
week = WeeklyTemplate.create(year: 2017,month:12,week: 53,start_time: Time.local(2017,12,11),end_time: Time.local(2017,12,17))
week.create_weeklies!
week = WeeklyTemplate.create(year: 2017,month:12,week: 54,start_time: Time.local(2017,12,18),end_time: Time.local(2017,12,24))
week.create_weeklies!
week = WeeklyTemplate.create(year: 2017,month:12,week: 55,start_time: Time.local(2017,12,25),end_time: Time.local(2017,12,31))
week.create_weeklies!

Project.create(code: '000001',name:'工商银行银信通项目',sales_name: '小六',sbu: '金融6部',description:"",project_type: 'C类',start_time: Time.local(2017,5,18),end_time: Time.local(2018,5,18))
Project.create(code: '000002',name:'支付宝网络升级改造',sales_name: '大西哥',sbu: '金融1部',description:"",project_type: 'A类',start_time: Time.local(2016,4,10),end_time: Time.local(2017,5,20),disable_workflow: true)
Project.create(code: '000003',name:'华夏银行应用虚拟化',sales_name: '刘洋',sbu: '金融4部',description:"",project_type: 'B类',start_time: Time.local(2014,6,1),end_time: Time.local(2018,6,1))
Project.create(code: '000004',name:'联通骨干网扩容',sales_name: '韩梅梅',sbu: '运营商1部',description:"",project_type: 'D类',start_time: Time.local(2017,1,10),end_time: Time.local(2020,5,18))


# Skill.create(name: '其他')
Skill.create(name: '云计算')
Skill.create(name: '大数据')
Skill.create(name: '物联网')
Skill.create(name: '移动互联网')
Skill.create(name: '网络')
Skill.create(name: '存储')
Skill.create(name: '服务器')
Skill.create(name: '虚拟化')
Skill.create(name: '小型机')
Skill.create(name: '容灾')
Skill.create(name: '机房')
Skill.create(name: '弱电')
Skill.create(name: '安防')
Skill.create(name: '视频语音')


# Company.create(name: '其他')
Company.create(name: '华为')
Company.create(name: '思科')
Company.create(name: 'IBM')
Company.create(name: 'H3C')
Company.create(name: 'EMC')
Company.create(name: '锐捷')
Company.create(name: 'Oracle')
Company.create(name: '浪潮')



WorkflowType.create(name: '售前(客户交流)')
WorkflowType.create(name: '售前(招标书编写)')
WorkflowType.create(name: '售前(投标书编写)')
WorkflowType.create(name: '售前(投标或讲标)')
WorkflowType.create(name: '售中')
WorkflowType.create(name: '售后')
WorkflowType.create(name: '供货')
WorkflowType.create(name: '单次服务')
WorkflowType.create(name: '集成')
WorkflowType.create(name: '认证考试')


