require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true

  post1=Post.new(:post => "hello world test",:postid => 1,:category => "question", :userid => "1", :weight =>0,:pcid => 1 )


  test "should be saved" do

    assert post1.save
  end

  # end
end
