class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.string :name,null: false
      t.datetime :start_time,null: false

      t.timestamps
    end
  end
end
