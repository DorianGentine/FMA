class Api::V1::FormulariesController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_project, only: [:update, :create, :edit]

  def edit
    formulary = Formulary.find(params[:id])
    @formulary_setted = FormularyToHash.new(formulary).form_json_for_espace

    render json: @formulary_setted
  end

  def create
    # ADD params
    formulary = Formulary.new(params)
  end

  def update
    formulary = Formulary.find(params[:id])
    formulary.update(params_formulary)
    render json: formulary
  end

  def set_project
    @project = Project.find(params[:project_id])
    authorize @project
  end

  private

  def params_formulary
    formulary = {
      first_name: params[:first_name],
      zip_code: params[:zip_code],
      age: params[:age],
      is_working: params[:is_working],
      loss_of_autonomy_receipt: params[:loss_of_autonomy_receipt],
      occupation: params[:occupation],
      holder_occupation: params[:holder_occupation],
      lessor: params[:lessor],
      accommodation: params[:accommodation],
      floor: params[:floor],
      accessibility_with_step: params[:accessibility_with_step],
      type_of_pension: params[:type_of_pension],
      pension: params[:pension],
      supplementary: params[:supplementary],
      loss_of_autonomy: params[:loss_of_autonomy],
      occupant: params[:occupant],
      owner_is_include: params[:owner_is_include],
      has_partner: params[:has_partner],
      tax_revenue: params[:tax_revenue],
      gross_income: params[:gross_income],
      global_tax_revenue: params[:global_tax_revenue],
      household_income: params[:household_income],
      owner_tax_revenue: params[:owner_tax_revenue],
      assistant: params[:assistant]
    }
    return formulary
  end
end




