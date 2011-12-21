class GoalsController < ApplicationController

  before_filter :authenticate_user!,
    :only => [:new, :create, :edit, :update, :destroy]

  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = current_user.goals.new
  end

  def create
    @goal = current_user.goals.new(params[:goal])
    if @goal.save
      redirect_to goals_path, :flash => { :success => "Goal created!" }
    else
      render 'new'
    end
  end

  def edit
    @goal = current_user.goals.new
  end

  def update
    @goal = current_user.goals.new
    if @goal.update_attributes(params[:goal])
      redirect_to goals_path, :flash => { :success => "Goal updated!" }
    else
      render 'edit'
    end
  end

  def destroy
    @goal = current_user.goals.find(params[:id])
    @goal.destroy
  end

end
