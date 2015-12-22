class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :cus_id

      t.timestamps
    end
  end
end
