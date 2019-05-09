class Api::V1::FormulariesController < Api::V1::BaseController

  def new
    @new_formulary = Formulary.new
    @formulary = FormularyToHash.new(@new_formulary).form_json
    render json: @formulary
    authorize @new_formulary
  end


end
