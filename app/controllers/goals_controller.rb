# GOALS SCHEMA
    # t.string   "objecive"
    # t.text     "key_results"
    # t.date     "deadline"
    # t.datetime "created_at",  null: false
    # t.datetime "updated_at",  null: false
    # t.integer  "user_id"
    # t.boolean  "complete"

# This class is responsible for managing user goals (in the form of OKR's). 

class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]


  def index
    @goals = Goal.all.order("created_at DESC")
  end


  def show
  end

  
  def new
    @goal = current_user.goals.build
  end


  def edit
  end

  
  def create
    @goal = current_user.goals.build(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to user_path(@goal.user.id), notice: 'Goal was successfully created.' }
        format.json { render :@user.show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to user_path(@goal.user.id), notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(:objecive, :key_results, :deadline, :complete)
    end
end
