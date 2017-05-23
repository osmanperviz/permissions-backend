class SubjectsController < ApplicationController

  before_action :load_resource, except: :index

  def index
    @subjects = Subject.all.includes(:permissions)
    render 'subjects/index.json.jbuilder'
  end

  def check_permissions
    @subject.permissions.include?(@permission)
  end

  def show_permissions
    load_permissions_for_subject
  end

  private

  def load_resource
    @subject = Subject.find(params[:id])
    @permission = Permission.find(params[:permission_id])
    @user = User.find(params[:user_id])
  end

  def load_permissions_for_subject
    Permission.where(user_id: @user.id, subject_id: @subject.id)
  end


  def subject_params
    params.permit(:id, :permission_id, :user_id)
  end

end
