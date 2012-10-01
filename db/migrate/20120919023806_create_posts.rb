class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post
      t.integer :postid
      t.integer :category_id
      t.integer :user_id
      t.integer :weight
      t.integer :pcid

      t.timestamps
    end
  end
end
