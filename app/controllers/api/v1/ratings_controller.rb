class Api::V1::RatingsController < Api::V1::BaseController
  before_action :authenticate_user!


  def new
    project = Project.find(params[:project_id])
    authorize project
    rating = Rating.new().set_evaluation_form
    render json: rating
  end

  def create
    project = Project.find(params[:project_id])
    p "project ID is => #{project.id}"
    @rating = Rating.new(rating_params)
    @rating.project = project
    p "rating_params ID  is => #{@rating.obvious}"
    if @rating.save
    p "rating_params save is => #{@rating.valid?}"
      render json: project
    else
    p "rating_params NOT SAVE is => #{@rating.valid?}"
      render_error
    end
    authorize project
  end

  private

  def rating_params
    params.require(:rating).permit(:obvious, :useful, :reactivity, :recommend, :remark, :satisfy)
  end

  def render_error
    render json: { errors: @rating.errors.full_messages },
      status: :unprocessable_entity
  end
end











