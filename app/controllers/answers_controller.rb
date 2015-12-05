class AnswersController < ApplicationController

  before_action :set_answer

  def update
    @answer.update_attribute(:count, @answer.count + 1)
    redirect_to question_path(@answer.question.url),
      notice: "Thank you for your opinion!"
  end

  private

    def question_params
      params.require(:question).permit(:title)
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end
end
