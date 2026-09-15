require 'test_helper'

class ProductImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_product_import_url
    assert_response :success
  end

  test "should get create" do
    post product_imports_url
    assert_response :redirect
  end
end

