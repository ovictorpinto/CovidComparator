require 'test_helper'

class DailyReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_report = daily_reports(:one)
  end

  test "should get index" do
    get daily_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_report_url
    assert_response :success
  end

  test "should create daily_report" do
    assert_difference('DailyReport.count') do
      post daily_reports_url, params: { daily_report: { confirmed: @daily_report.confirmed, country: @daily_report.country, day: @daily_report.day, deaths: @daily_report.deaths, recovery: @daily_report.recovery } }
    end

    assert_redirected_to daily_report_url(DailyReport.last)
  end

  test "should show daily_report" do
    get daily_report_url(@daily_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_report_url(@daily_report)
    assert_response :success
  end

  test "should update daily_report" do
    patch daily_report_url(@daily_report), params: { daily_report: { confirmed: @daily_report.confirmed, country: @daily_report.country, day: @daily_report.day, deaths: @daily_report.deaths, recovery: @daily_report.recovery } }
    assert_redirected_to daily_report_url(@daily_report)
  end

  test "should destroy daily_report" do
    assert_difference('DailyReport.count', -1) do
      delete daily_report_url(@daily_report)
    end

    assert_redirected_to daily_reports_url
  end
end
