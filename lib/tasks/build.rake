namespace :build do

  desc "auto build weekly"
  task :weekly => :environment do
    # 获取最后一个 template 的表数据
    last_week = WeeklyTemplate.last

    # 获取本周起始时间
    new_start_time = last_week.start_time+7.days

    new_end_time = new_start_time + 7.days - 1.seconds

    # 本周起始时间年
    current_year = new_start_time.strftime("%Y").to_i

    # 本周起始月份
    current_month = new_start_time.strftime("%m").to_i
    

    # 如果和上周的起始时间在是同一年
    if last_week.start_time.strftime("%Y") == new_start_time.strftime("%Y")
      # week 直接+1
      current_week = last_week.week+1
    else
      # week 归零
      current_week = 1
    end

    week = WeeklyTemplate.create(year: current_year,month: current_month,week: current_week,start_time: new_start_time,end_time: new_end_time)
    week.create_weeklies!


  end


end
