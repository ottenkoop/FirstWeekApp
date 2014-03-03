class AddFieldsToSprint < ActiveRecord::Migration
  def change
    add_column :sprints, :user_id, :integer
  end
end
