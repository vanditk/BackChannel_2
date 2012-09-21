class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post
      t.integer :postid
      t.string :category
      t.string :userid
      t.integer :weight
      t.integer :pcid

      t.timestamps
    end
  end
end
