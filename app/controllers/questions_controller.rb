class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def show
    @question = Question.find_by(url: params[:id])
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to question_path(@question.url), notice: "Poll was created."}
      else
        format.html { render :new }
      end
    end
  end

  private

    def question_params
      params.require(:question).permit(:title)
    end
end
