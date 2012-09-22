class Post < ActiveRecord::Base
  attr_accessible :category, :pcid, :post, :postid, :userid, :weight

  belongs_to :user
  has_many :votes ,  :dependent => :destroy


  def find_parent_post()
      if(self.postid != nil or self.postid != "")
        return Post.find(self.postid)
      else
      return nil
    end
  end
end