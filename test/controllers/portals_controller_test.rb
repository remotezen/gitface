require 'test_helper'
=begin
sign_in users(:bob)
sign_in users(:bob), scope: :admin
sign_out :user
=end

class PortalsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:fred)
  end
  test "should not get home" do
    get portals_home_url
    assert_redirected_to user_session_path
  end

  test "should  get home" do
    sign_in users(:fred)
    get portals_home_url
    assert :success
  end

  test "admin user should have role admin" do
    assert @user.has_role?('admin')
  end

  test "first user should have role admin"  do
    assert User.first.has_role?('admin')
  end

end
