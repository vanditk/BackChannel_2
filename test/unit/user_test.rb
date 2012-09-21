require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end               :name, :password, :role, :username

  def setup

  @user1 = User.new(:name => "User 1", :username => "user1", :password => "user1", :role=> "User")
  @user2 = User.new(:name => "User 2", :username => "user2", :password => "user2", :role => "User")
  @user3 = User.new(:name => "User 3", :username => "user3")
  @user2NonUnique = User.new(:name => "UserTemp", :username => "MyString", :password => "usertemp", :role => "User")
  @user4 = User.new(:name => "User 4", :username => "user4", :password => "123456789012345678901234567890123456789012345678901234567890", :role => "User")

  @user5 = User.new(:name => "User 5", :username => "user5", :password => "123", :role => "User")

  end
  test "should require all required fields" do
    assert @user1.valid?
    assert @user2.valid?
    assert_false @user3.valid?
  end

  test "should be saved" do

    assert @user1.save
  end


  test "should not be saved" do

    assert !@user3.save
  end

  test "should have unique usernames" do

    assert_false @user2NonUnique.valid?
  end

   test "length of long password" do
    assert !@user4.save
  end

  test "length of short password" do
    assert !@user5.save

  end

end
