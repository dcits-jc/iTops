class AddOtherSkillAndOtherCompanyToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :other_skill, :string
    add_column :workflows, :other_company, :string
  end
end
