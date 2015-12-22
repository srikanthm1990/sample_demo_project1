class CreateMultirowTexts < ActiveRecord::Migration
  def change
    create_table :multirow_texts do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
