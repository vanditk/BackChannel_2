class Vote < ActiveRecord::Base
  attr_accessible :postid, :userid
  belongs_to :user
  belongs_to :post

  validates_presence_of :userid
  validates_presence_of :postid
  validates_uniqueness_of :userid, :scope => [:postid]

end
