class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
      @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
      if @exercise.valid?
        @exercise.save
        redirect_to @exercise
      else
        render :new
      end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to @exercise
    else
      render :edit
    end
  end


  def destroy
    @exercise = Exercise.find(params[:id])
    redirect_to users_path
  end



def save_to_favs
  byebug
  @exercise = UserFavExercise.create
end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :description, :instructions, muscle_id: [])
  end










end
