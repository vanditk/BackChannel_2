class Post < ActiveRecord::Base
  attr_accessible :category, :pcid, :post, :postid, :userid, :weight

  belongs_to :user
  has_many :votes ,  :dependent => :destroy
end
