class CreateAccountHistories < ActiveRecord::Migration
  def change
    create_table :account_histories do |t|
      t.integer :account_id
      t.integer :credit_rating
    end
  end
end
