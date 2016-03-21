class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(:created_at)
  end
end
