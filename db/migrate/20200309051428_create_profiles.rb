class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name,null: false
      t.string :kana,null: false
      t.string :phone_number,null: false
      t.string :mail,null: false
      t.string :number,null: false
      t.string :undergraduate,null: false
      t.string :subject,null: false
      t.float :gpa,null: false
      t.text :motivation,null: false
      t.text :pr,null: false
      t.text :life,null: false
      t.text :time,null: false
      t.text :task,null: false
      t.text :time1,null: false

      t.timestamps
    end
  end
end
