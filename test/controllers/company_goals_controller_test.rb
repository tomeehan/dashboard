require 'test_helper'

class CompanyGoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_goal = company_goals(:one)
  end

  test "should get index" do
    get company_goals_url
    assert_response :success
  end

  test "should get new" do
    get new_company_goal_url
    assert_response :success
  end

  test "should create company_goal" do
    assert_difference('CompanyGoal.count') do
      post company_goals_url, params: { company_goal: { complete: @company_goal.complete, deadline: @company_goal.deadline, key_results: @company_goal.key_results, objective: @company_goal.objective } }
    end

    assert_redirected_to company_goal_url(CompanyGoal.last)
  end

  test "should show company_goal" do
    get company_goal_url(@company_goal)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_goal_url(@company_goal)
    assert_response :success
  end

  test "should update company_goal" do
    patch company_goal_url(@company_goal), params: { company_goal: { complete: @company_goal.complete, deadline: @company_goal.deadline, key_results: @company_goal.key_results, objective: @company_goal.objective } }
    assert_redirected_to company_goal_url(@company_goal)
  end

  test "should destroy company_goal" do
    assert_difference('CompanyGoal.count', -1) do
      delete company_goal_url(@company_goal)
    end

    assert_redirected_to company_goals_url
  end
end
