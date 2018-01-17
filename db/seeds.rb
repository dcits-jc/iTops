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

User.create(email: 'liangchaob@163.com',password: "000000",password_confirmation: "000000",admin: true,itcode: "liangchaob",code: "1001959",name: "梁超",sbu_id: 1,phone: '18600295379',title: '开发工程师',costcenter: '31T80001',level: 5,cost: 2000)
User.create(email: 'a@dcits.com',password: "000000",password_confirmation: "000000",itcode: "a",code: "1001958",name: "张三",sbu_id: 2,phone: '1860747625',title: '网络工程师',costcenter: '31T80062',level: 3,cost: 1000)
User.create(email: 'b@dcits.com',password: "000000",password_confirmation: "000000",itcode: "b",code: "1001957",name: "李四",sbu_id: 3,phone: '1860747655',title: '系统工程师',costcenter: '31T80053',level: 4,cost: 1000)
User.create(email: 'c@dcits.com',password: "000000",password_confirmation: "000000",itcode: "c",code: "1001950",name: "王五",sbu_id: 1,phone: '1360347625',title: '项目经理',costcenter: '31T80001',level: 2,cost: 1000)
User.create(email: 'd@dcits.com',password: "000000",password_confirmation: "000000",itcode: "d",code: "1001111",name: "王麻子",sbu_id: 1,phone: '1888888888',title: '大老板',costcenter: '31T80001',level: 6,cost: 1000)



week = WeeklyTemplate.create(year: 2017,month:11,week: 51,start_time: Time.local(2017,11,27),end_time: Time.local(2017,11,27)+7.days-1.seconds)
week.create_weeklies!
week = WeeklyTemplate.create(year: 2017,month:12,week: 52,start_time: Time.local(2017,12,4),end_time: Time.local(2017,12,4)+7.days-1.seconds)
week.create_weeklies!
week = WeeklyTemplate.create(year: 2017,month:12,week: 53,start_time: Time.local(2017,12,11),end_time: Time.local(2017,12,11)+7.days-1.seconds)
week.create_weeklies!
week = WeeklyTemplate.create(year: 2017,month:12,week: 54,start_time: Time.local(2017,12,18),end_time: Time.local(2017,12,18)+7.days-1.seconds)
week.create_weeklies!
week = WeeklyTemplate.create(year: 2017,month:12,week: 55,start_time: Time.local(2017,12,25),end_time: Time.local(2017,12,25)+7.days-1.seconds)
week.create_weeklies!


Project.create(code: '000000',name:'#认证考试#',cost_plan: 100000)
Project.create(code: '000001',name:'#技术提升#',cost_plan: 100000)
Project.create(code: '000002',name:'#部门工作#',cost_plan: 100000)
Project.create(code: '000003',name:'#售前(临时)#',cost_plan: 100000)
Project.create(code: '000004',name:'#售前(厂商交流)#',cost_plan: 100000)


Project.create(code: '000006',name:'工商银行银信通项目',sales_name: '小六',sbu: '金融6部',description:"",project_type: 'C类',start_time: Time.local(2017,5,18),end_time: Time.local(2018,5,18),cost_plan: 50000)
Project.create(code: '000007',name:'支付宝网络升级改造',sales_name: '大西哥',sbu: '金融1部',description:"",project_type: 'A类',start_time: Time.local(2016,4,10),end_time: Time.local(2017,5,20),disable_workflow: true,cost_plan: 100000)
Project.create(code: '000008',name:'华夏银行应用虚拟化',sales_name: '刘洋',sbu: '金融4部',description:"",project_type: 'B类',start_time: Time.local(2014,6,1),end_time: Time.local(2018,6,1),cost_plan: 100000)
Project.create(code: '000009',name:'联通骨干网扩容',sales_name: '韩梅梅',sbu: '运营商1部',description:"",project_type: 'D类',start_time: Time.local(2017,1,10),end_time: Time.local(2020,5,18),cost_plan: 100000)


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


# 1
WorkflowType.create(name: '售前(客户交流)')
# 2
WorkflowType.create(name: '售前(招标书编写)')
# 3
WorkflowType.create(name: '售前(投标书编写)')
# 4
WorkflowType.create(name: '售前(解决方案编写)')
# 5
WorkflowType.create(name: '售前(投标或讲标)')
# 6
WorkflowType.create(name: '售中')
# 7
WorkflowType.create(name: '售后')
# 8
WorkflowType.create(name: '供货')
# 9
WorkflowType.create(name: '单次服务')
# 10
WorkflowType.create(name: '集成')
# 11
WorkflowType.create(name: '认证考试')
# 12
WorkflowType.create(name: '技术提升')
# 13
WorkflowType.create(name: '售前(临时)')
# 14
WorkflowType.create(name: '售前(厂商交流)')
# 15
WorkflowType.create(name: '售前(临时)')






