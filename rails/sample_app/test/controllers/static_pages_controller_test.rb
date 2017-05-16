require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup #Runs before every tests
    @base_title = "ROR Sample App"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get helf_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  test "should get sign up" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign up | #{@base_title}"
  end
  

end
