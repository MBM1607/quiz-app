class QuizzesController < ApplicationController
  before_action :authenticate_user!,
                only: [:create, :edit]

  def index
    @quizzes = Quiz.all
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

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def show_answer
    @question = Question.find(params[:question_id])

    respond_to do |format|
      format.js
    end
  end

  def choose_random
    redirect_to quiz_path(Quiz.order('RANDOM()').first.id)
  end

  private

  def quiz_params
    params.require(:quiz).permit(
      :name, :description, :user_id,
      questions_attributes: [:text, answers_attributes: [:text, :is_true]]
    )
  end

end
