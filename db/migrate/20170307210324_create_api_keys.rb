class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :mail
      t.string :api_key
      t.integer :times_used

      t.timestamps null: false
    end
  end
end
