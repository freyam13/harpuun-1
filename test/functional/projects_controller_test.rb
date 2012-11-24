require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { contractor_id: @project.contractor_id, deadline: @project.deadline, description: @project.description, name: @project.name, reward: @project.reward, skill_id1: @project.skill_id1, skill_id2: @project.skill_id2, skill_id3: @project.skill_id3, url: @project.url }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    put :update, id: @project, project: { contractor_id: @project.contractor_id, deadline: @project.deadline, description: @project.description, name: @project.name, reward: @project.reward, skill_id1: @project.skill_id1, skill_id2: @project.skill_id2, skill_id3: @project.skill_id3, url: @project.url }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end