require "test_helper"

class AttendeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendee = attendees(:one)
  end

  test "should get index" do
    get attendees_url, as: :json
    assert_response :success
  end

  test "should create attendee" do
    assert_difference('Attendee.count') do
      post attendees_url, params: { attendee: { event_id: @attendee.event_id, member_id: @attendee.member_id, temperature: @attendee.temperature } }, as: :json
    end

    assert_response 201
  end

  test "should show attendee" do
    get attendee_url(@attendee), as: :json
    assert_response :success
  end

  test "should update attendee" do
    patch attendee_url(@attendee), params: { attendee: { event_id: @attendee.event_id, member_id: @attendee.member_id, temperature: @attendee.temperature } }, as: :json
    assert_response 200
  end

  test "should destroy attendee" do
    assert_difference('Attendee.count', -1) do
      delete attendee_url(@attendee), as: :json
    end

    assert_response 204
  end
end
