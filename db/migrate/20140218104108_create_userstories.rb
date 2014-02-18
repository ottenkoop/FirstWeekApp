class CreateUserstories < ActiveRecord::Migration
  def change
    create_table :userstories do |t|
      t.text :content
      t.integer :rating
      t.integer :sprint_id

      t.timestamps
    end
  end
end
