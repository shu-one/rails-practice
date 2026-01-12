class TaskStatusController < ApplicationController
  def index_api
    task_status = Task::TaskStatus.all
    render json: { task_status: task_status }
  end
end
