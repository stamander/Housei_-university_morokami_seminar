class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :image,null:false
      t.string :name,null: false
      t.string :kana,null: false
      t.string :number,null: false
      t.string :undergraduate,null: false
      t.string :subject,null: false
      t.float :gpa,null: false
      t.text :motivation,null: false
      t.text :pr,null: false
      t.text :life,null: false
      t.text :time,null: false
      t.string :task,null: false

      t.timestamps
    end
  end
end
