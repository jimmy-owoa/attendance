require "test_helper"

class ChurchAnnexesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @church_annex = church_annexes(:one)
  end

  test "should get index" do
    get church_annexes_url, as: :json
    assert_response :success
  end

  test "should create church_annex" do
    assert_difference('ChurchAnnex.count') do
      post church_annexes_url, params: { church_annex: { address: @church_annex.address, capacity: @church_annex.capacity, church_id: @church_annex.church_id, enabled: @church_annex.enabled, name: @church_annex.name } }, as: :json
    end

    assert_response 201
  end

  test "should show church_annex" do
    get church_annex_url(@church_annex), as: :json
    assert_response :success
  end

  test "should update church_annex" do
    patch church_annex_url(@church_annex), params: { church_annex: { address: @church_annex.address, capacity: @church_annex.capacity, church_id: @church_annex.church_id, enabled: @church_annex.enabled, name: @church_annex.name } }, as: :json
    assert_response 200
  end

  test "should destroy church_annex" do
    assert_difference('ChurchAnnex.count', -1) do
      delete church_annex_url(@church_annex), as: :json
    end

    assert_response 204
  end
end
