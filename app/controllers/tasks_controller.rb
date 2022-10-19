class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params.require(:task).permit(:name, :detail, :due_date))
    if @task.save
      flash[:notice] = "Task was created successfully."
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:name, :detail, :due_date))
      flash[:notice] = "Task was updated successfully."
      redirect_to task_path(@task)
    else
      render :edit
    end
  end
end
