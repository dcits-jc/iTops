class AddAasmToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :aasm_state, :string, default: "processing"
    add_index :workflows, :aasm_state
  end
end
