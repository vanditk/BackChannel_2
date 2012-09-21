require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  @vote1 = Vote.new(:post_id => 5, :user_id => 4)
  @vote2 = Vote.new(:post_id => 2, :user_id => 2)
  @vote3 = Vote.new(:post_id => 1, :user_id => 2)
  @vote4 = Vote.new(:post_id => 2, :user_id => 1)
  end
  def test_truth
    assert true
  end

  test "should require all fields" do
    assert @vote1.valid?
    assert @vote3.valid?
    assert @vote4.valid?

  end

  test "unique vote on a post id by every userid" do
    assert_false @vote2.valid?
  end

end
