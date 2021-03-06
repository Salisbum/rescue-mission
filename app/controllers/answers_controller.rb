
class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answers = @question.answers.order(created_at: :asc)
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = 'Answer successfully submitted!'
      redirect_to question_path(@question)
    else
      flash[:alert] = "Answer was not saved! #{@answer.errors.full_messages.join ","}."
      render :'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(
      :description
      )
    end

end
