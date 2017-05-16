require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    #Going to root Page
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", helf_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", contact_path

    #Going Contact Page
    get contact_path
    assert_select "title", full_title('Contact')

    #Going Signup Page
    get signup_path
    assert_select "title", full_title('Sign up')
  end
end