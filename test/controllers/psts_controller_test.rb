require "test_helper"

class PstsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pst = psts(:one)
  end

  test "should get index" do
    get psts_url
    assert_response :success
  end

  test "should get new" do
    get new_pst_url
    assert_response :success
  end

  test "should create pst" do
    assert_difference("Pst.count") do
      post psts_url, params: { pst: { body: @pst.body, published: @pst.published, title: @pst.title } }
    end

    assert_redirected_to pst_url(Pst.last)
  end

  test "should show pst" do
    get pst_url(@pst)
    assert_response :success
  end

  test "should get edit" do
    get edit_pst_url(@pst)
    assert_response :success
  end

  test "should update pst" do
    patch pst_url(@pst), params: { pst: { body: @pst.body, published: @pst.published, title: @pst.title } }
    assert_redirected_to pst_url(@pst)
  end

  test "should destroy pst" do
    assert_difference("Pst.count", -1) do
      delete pst_url(@pst)
    end

    assert_redirected_to psts_url
  end
end
