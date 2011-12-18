class TasksController < ApplicationController

  before_filter :authenticate_user!,
    :only => [:new, :create, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @tasks = current_user.tasks.all
    else
      @tasks = []
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      redirect_to root_path, :flash => { :success => "Task created!" }
    else
      render 'new'
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to root_path, :flash => { :success => "Task updated!" }
    else
      render 'edit'
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
  end

end
