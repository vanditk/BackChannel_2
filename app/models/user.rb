class User < ActiveRecord::Base
  attr_accessible :name, :password, :role, :username
  has_many :posts, :dependent => :destroy
  has_many :votes, :dependent => :destroy

  validates_uniqueness_of :username
  validates_confirmation_of :password, :on => :create
  validates_length_of :password, :within => 5..40
  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :name
end
