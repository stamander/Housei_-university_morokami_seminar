class CreatePrivates < ActiveRecord::Migration[5.2]
  def change
    create_table :privates do |t|
      t.text :title,null: false
      t.text :content,null: false

      t.timestamps
    end
  end
end
