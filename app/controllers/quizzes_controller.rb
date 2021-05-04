class QuizzesController < ApplicationController
  def index
  end

  def new
    @quiz = Quiz.new
    @quiz.questions.build.answers.build
  end

  def create
    Quiz.create(quiz_params)

    flash[:notice] = 'New Quiz has been created'
    redirect_to root_path
  end

  private

  def quiz_params
    params.require(:quiz).permit(
      :name, :description, :user_id,
      questions_attributes: [:text, answers_attributes: [:text, :is_true]]
    )
  end
end
