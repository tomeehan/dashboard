#  SNIPPITS SCHEMA:
    # t.text     "summary"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    # t.integer  "user_id"

class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]


  def index
    @snippets = Snippet.all.order("created_at DESC")
  end


  def show
  end

  def new
    @snippet = current_user.snippets.build
  end

  def edit
  end

  def create
    @snippet = current_user.snippets.build(snippet_params)

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to user_path(@current_user), notice: 'Snippet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to @snippet, notice: 'Snippet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @snippet.destroy
    respond_to do |format|
      format.html { redirect_to snippets_url, notice: 'Snippet was successfully destroyed.' }
    end
  end

  private

    def set_snippet
      @snippet = Snippet.find(params[:id])
    end


    def snippet_params
      params.require(:snippet).permit(:summary)
    end
end
