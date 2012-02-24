class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.integer :friend_id
      t.decimal :amount
      t.string :status

      t.timestamps
    end
  end
end
