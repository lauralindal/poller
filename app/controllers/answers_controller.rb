class AnswersController < ApplicationController

  before_action :set_answer

  def update
    @answer.update_attribute(:count, @answer.count + 1)
  end

  private

    def question_params
      params.require(:question).permit(:title)
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end
end
