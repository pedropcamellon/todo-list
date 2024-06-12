class TasksController < ApplicationController
  before_action :set_project, only: [ :create, :destroy ]
  before_action :set_task, only: %i[ destroy ]

  # POST /tasks or /tasks.json
  def create
    @task = @project.tasks.create(task_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_url(@project), notice: "Task was successfully created." }
      else
        # Log error
        puts @task.errors.full_messages.join(', ')

        format.html { redirect_to project_url(@project), notice: "There was an error creating the task." }
      end
    end
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
