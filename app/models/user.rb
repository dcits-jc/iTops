class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:itcode]

  has_many :workflows
  has_many :weeklies


  has_many :user_company_relationships
  has_many :companies, through: :user_company_relationships, source: :company

  has_many :user_skill_relationships
  has_many :skills, through: :user_skill_relationships, source: :skill



  has_many :project_relationships
  has_many :projects, through: :project_relationships, source: :project


  has_many :project_manages
  has_many :manage_projects, through: :project_manages, source: :project



  # belongs_to :sbu

  def generate_itcode
   self.itcode = (self.email.split(/@/))[0]
  end



  def is_admin?
    admin
  end

  def create_currentweekly!
    current_weektemplate = WeeklyTemplate.last
    weekly = Weekly.new
    weekly.year = current_weektemplate.year
    weekly.month = current_weektemplate.month
    weekly.week = current_weektemplate.week
    weekly.start_time = current_weektemplate.start_time
    weekly.end_time = current_weektemplate.end_time
    weekly.user = self
    weekly.weekly_template = current_weektemplate
    weekly.save
  end



  # 关闭强制邮箱登录
  def email_required?
    false
  end

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#  itcode                 :string
#  code                   :string
#  name                   :string
#  sbu_id                 :integer
#  phone                  :string
#  title                  :string
#  level                  :string
#  cost                   :integer
#  sbu_name               :string
#  area                   :string
#  status                 :string
#  job_class              :string
#  pm                     :boolean          default(FALSE)
#  costcenter             :string
#  is_logined             :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#