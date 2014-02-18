class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :goal

      t.timestamps
    end
  end
end
