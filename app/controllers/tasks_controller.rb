class TasksController < ApplicationController
  before_action :require_user
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:notice] = "Task was created successfully."
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task was updated successfully."
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def today
    @tasks = current_user.tasks.where('due_date = ?', Date.current)
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id]) 
  rescue ActiveRecord::RecordNotFound
    redirect_to tasks_path, notice: "No such task associated to the current user."
  end

  def task_params
    params.require(:task).permit(:name, :detail, :due_date, :category_id, :completed)
  end

end
