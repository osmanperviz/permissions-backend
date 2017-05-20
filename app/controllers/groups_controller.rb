# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :load_group, only: %i[show add_premission add_user add_permission]

  def index
    @groups = Group.all.includes(:permissions, :users, :subjects)
    render 'groups/index.json.jbuilder'
  end

  # def show
  #   render 'users/show.json.jbuilder'
  # end

  def add_permission
    permission = Permission.find(params[:permission_id])
    subject = Subject.find(params[:subject_id])
    result = AssignPermissionToGroupService.call(permission: permission, group: @group, subject: subject)
    return render json: { error: result.error, status: 404 } unless result.success?
    render 'groups/add_permission.json.jbuilder'
  end

  def add_user
    user = User.find(params[:user_id])
    result = AddUserToGroupService.call(user: user , group: @group)
    return render json: { error: result.error, status: 404 } unless result.success?
    render 'groups/add_user.json.jbuilder'
  end

  def remove

  end

  def load_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.permit(:id, :name, :permission_id, :user_id, :subject_id)
  end
end
