class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @question = Question.new
  end

  def show
    @question = Question.includes(:answers).find_by(url: params[:id])
    @cookies = cookies[@question.url]
    respond_to do |format|
      format.html { redirect_to new_question_path unless @question }
      format.csv { send_data @question.to_csv }
    end
  end

  def create
    @question = current_user.questions.build(question_params)
    answers = params[:description].split("\n")
    answers.each do | answer |
      a = Answer.new(description: answer)
      @question.answers << a
    end
    respond_to do |format|
      if @question.save
        format.html { redirect_to question_path(@question.url),
          notice: "Poll was created."}
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    redirect_to current_user
  end

  private

    def question_params
      params.require(:question).permit(:title)
    end

    def correct_user
      @question = current_user.questions.find_by(id: params[:id])
      redirect_to root_url if @question.nil?
    end
end
