class TasksController < ApplicationController
  before_action :set_project, only: %i[ create, destroy ]
  before_action :set_task, only: %i[ destroy ]

  # POST /tasks or /tasks.json
  def create
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    redirect_to @project
  end

    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_project
        @project = Project.find(params[:project_id])
    end

    def set_task
        @task = @project.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:content)
    end
end
