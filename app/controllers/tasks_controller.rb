class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(user_params)
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path
  end

  def update
    @task.update(user_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def user_params
    params.require(:task).permit(:name, :description, :done)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  # afficher une case cochée
end

