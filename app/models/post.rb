class Post < ActiveRecord::Base
  attr_accessible :pcid, :post, :postid, :user_id, :weight, :category_id


  belongs_to :user

  has_many :votes ,  :dependent => :destroy
  belongs_to :category


  def find_parent_post()
      if(self.postid != nil or self.postid != "")
        return Post.find(self.postid)
      else
      return nil
    end
  end
end