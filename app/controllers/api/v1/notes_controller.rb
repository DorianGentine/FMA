class Api::V1::NotesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  # before_action :authenticate_user!

  def update
    note = Note.find(params[:id])
    project = note.project
    if note.update(note_params)
      render json: project
    end
    authorize project
  end

  def create
    @project = Project.find(params[:project_id])
    @note = Note.new(note_params)
    @note.project = @project
    if @note.save
      render json: @project
    else
      render_error
    end
    authorize @project
  end

  def destroy
    note = Note.find(params[:id])
    @project = note.project
    note.destroy
    head :no_content
    authorize @project
  end

  private

  def note_params
    params.require(:note).permit(:title, :description)
  end

  def render_error
    render json: { errors: @note.errors.full_messages },
      status: :unprocessable_entity
  end
end




