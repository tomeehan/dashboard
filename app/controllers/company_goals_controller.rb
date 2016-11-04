class CompanyGoalsController < ApplicationController
  before_action :set_company_goal, only: [:show, :edit, :update, :destroy]

  # GET /company_goals
  # GET /company_goals.json
  def index
    @company_goals = CompanyGoal.all
  end

  # GET /company_goals/1
  # GET /company_goals/1.json
  def show
  end

  # GET /company_goals/new
  def new
    @company_goal = CompanyGoal.new
  end

  # GET /company_goals/1/edit
  def edit
  end

  # POST /company_goals
  # POST /company_goals.json
  def create
    @company_goal = CompanyGoal.new(company_goal_params)

    respond_to do |format|
      if @company_goal.save
        format.html { redirect_to company_goals_path, notice: 'Company goal was successfully created.' }
        format.json { render :show, status: :created, location: @company_goal }
      else
        format.html { render :new }
        format.json { render json: @company_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_goals/1
  # PATCH/PUT /company_goals/1.json
  def update
    respond_to do |format|
      if @company_goal.update(company_goal_params)
        format.html { redirect_to company_goals_path, notice: 'Company goal was successfully created.' }
        format.json { render :show, status: :ok, location: @company_goal }
      else
        format.html { render :edit }
        format.json { render json: @company_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_goals/1
  # DELETE /company_goals/1.json
  def destroy
    @company_goal.destroy
    respond_to do |format|
      format.html { redirect_to company_goals_url, notice: 'Company goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_goal
      @company_goal = CompanyGoal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_goal_params
      params.require(:company_goal).permit(:objective, :key_results, :deadline, :complete)
    end
end
