# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :load_user, only: %i[show add_premission]

  def index
    @users = User.all.includes(:permissions, :groups, :subjects)
    render 'users/index.json.jbuilder'
  end

  def show
    render 'users/show.json.jbuilder'
  end

  def add_premission
    permission = Permission.find(params[:permission_id])
    result = AssignPermisionToUserService.call(permission: permission, user: @user)
    return render json: { error: result.error, status: 404 } unless result.success?
    render 'users/add_premission.json.jbuilder'
  end

  def load_user
    @user = User.find(params[:id])
  end

  def users_params
    params.permit(:name, :permission_id)
  end
end
