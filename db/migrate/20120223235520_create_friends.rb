class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :email
      t.integer :user_id
      t.string :twitter_username

      t.timestamps
    end
  end
end
