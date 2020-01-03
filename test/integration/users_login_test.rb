require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:exuser)
  end

  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { username: '', password: '' } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get login_path
    assert flash.empty?
  end

  test 'login with valid information' do
    get login_path
    post login_path, params: { session: { username: @user.username,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', user_path(@user)
  end

  test 'login with valid information with logout' do
    get login_path
    post login_path, params: { session: { username: @user.username,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', user_path(@user)
    assert_select 'a[href=?]', logout_path
    delete logout_path
    assert_not logged_in?
  end
end
