class CreateUserCompanyRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :user_company_relationships do |t|
      t.integer  :user_id
      t.integer  :company_id

      t.timestamps
    end
  end
end
