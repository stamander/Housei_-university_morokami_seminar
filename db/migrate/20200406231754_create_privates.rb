class CreatePrivates < ActiveRecord::Migration[5.2]
  def change
    create_table :privates do |t|

      t.timestamps
    end
  end
end
