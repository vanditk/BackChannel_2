require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
    def setup
  @category = Category.new
  @category.name = "test"
  @category.description ="testt1"
  @category.save

  @post1=Post.new(:post => "hello world test",:postid => 1,:category_id => @category.id, :user_id => 1, :weight =>0,:pcid => 1 )

  end

  test "should be saved" do

    assert @post1.save
  end
  test "should be deleted" do
    assert @post1.destroy
  end


  # end
end
