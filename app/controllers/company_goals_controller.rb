 #    COMPANY GOALS SCHEMA
 #    t.string   "objective"
 #    t.text     "key_results"
 #    t.date     "deadline"
 #    t.boolean  "complete"
 #    t.datetime "created_at",  null: false
 #    t.datetime "updated_at",  null: false

# This class is responsible for managing company goals (in the form of OKR's).

class CompanyGoalsController < ApplicationController
  before_action :set_company_goal, only: [:show, :edit, :update, :destroy]

  def index
    @company_goals = CompanyGoal.all
    @goals = Goal.all.order("created_at DESC")
    @users = User.all.order("created_at DESC")
  end

  def show
  end

  def new
    @company_goal = CompanyGoal.new
  end

  def edit
  end

  def create
    @company_goal = CompanyGoal.new(company_goal_params)

    respond_to do |format|
      if @company_goal.save
        format.html { redirect_to company_goals_path, notice: 'Company goal was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @company_goal.update(company_goal_params)
        format.html { redirect_to company_goals_path, notice: 'Company goal was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @company_goal.destroy
    respond_to do |format|
      format.html { redirect_to company_goals_url, notice: 'Company goal was successfully destroyed.' }
    end
  end

  private
    
    def set_company_goal
      @company_goal = CompanyGoal.find(params[:id])
    end

    
    def company_goal_params
      params.require(:company_goal).permit(:objective, :key_results, :deadline, :complete)
    end
end
