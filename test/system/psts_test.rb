require "application_system_test_case"

class PstsTest < ApplicationSystemTestCase
  setup do
    @pst = psts(:one)
  end

  test "visiting the index" do
    visit psts_url
    assert_selector "h1", text: "Psts"
  end

  test "should create pst" do
    visit psts_url
    click_on "New pst"

    fill_in "Body", with: @pst.body
    check "Published" if @pst.published
    fill_in "Title", with: @pst.title
    click_on "Create Pst"

    assert_text "Pst was successfully created"
    click_on "Back"
  end

  test "should update Pst" do
    visit pst_url(@pst)
    click_on "Edit this pst", match: :first

    fill_in "Body", with: @pst.body
    check "Published" if @pst.published
    fill_in "Title", with: @pst.title
    click_on "Update Pst"

    assert_text "Pst was successfully updated"
    click_on "Back"
  end

  test "should destroy Pst" do
    visit pst_url(@pst)
    click_on "Destroy this pst", match: :first

    assert_text "Pst was successfully destroyed"
  end
end
