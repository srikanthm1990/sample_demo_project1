class CreateBoys < ActiveRecord::Migration
  def change
    create_table :boys do |t|
      t.string :name
      t.integer :user_id
      t.integer :age
      t.integer :height
      t.integer :weight
      t.integer :class

      t.timestamps
    end
  end
end
