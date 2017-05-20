# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :load_group, only: %i[show add_premission add_user]

  def index
    @groups = Group.all.includes(:permissions, :users, :subjects)
    render 'groups/index.json.jbuilder'
  end

  # def show
  #   render 'users/show.json.jbuilder'
  # end

  # def add_premission
  #   permission = Permission.find(params[:permission_id])
  #   result = AssignPermisionService.call(permission: permission, user: @user)
  #   return render json: { error: result.error, status: 404 } unless result.success?
  #   render 'users/add_premission.json.jbuilder'
  # end

  def add_user
    user = User.find(params[:user_id])
    result = AddUserToGroupService.call(user: user , group: @group)
    return render json: { error: result.error, status: 404 } unless result.success?
    render 'groups/add_user.json.jbuilder'
  end

  def load_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.permit(:name, :permission_id, :user_id)
  end
end
