class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.string :content
      t.integer :user_id
      t.integer :micropost_id

      t.timestamps
    end
     add_index :retweet, [:micropost_id, :created_at]
  end
end