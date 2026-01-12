class TaskController < ApplicationController
  def create_api
    task = Task.new(task_params)
    task.user_id = current_user.user_id

    if task.save
      render json: { status: 'success', data: task }, status: :created
    else
      render json: { status: 'error', message: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :end_time, :description, :task_status_id)
  end

  def show
  end
end
