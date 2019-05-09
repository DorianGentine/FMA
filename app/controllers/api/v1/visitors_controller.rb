class Api::V1::VisitorsController < Api::V1::BaseController
  before_action :set_visitor, only: [:show]

  def index
    @visitors = policy_scope(Visitor)
  end

  def show
    formulary = @visitor.formulary.nil? ? Formulary.new : @visitor.formulary
    @formulary = FormularyToHash.new(formulary).form_json
    render json: @formulary
  end

  def update_formulary
    visitor = Visitor.find(params[:id].to_i)
    if visitor.formulary.nil?
      formulary = Formulary.new(form_api_call_params.permit!)
      formulary.visitor = visitor
      formulary.project = Project.create!
      formulary.save
    else
      formulary = visitor.formulary
      formulary.update(form_api_call_params.permit!)
    end
    render json: formulary
    authorize visitor
  end

  private

  def set_visitor
    @visitor = Visitor.find(params[:id])
    authorize @visitor  # For Pundit
  end

  def form_api_call_params
    pf = params[:params_value]
    test_upload_alowing_form(pf)
  end

  def test_upload_alowing_form(pf)
    visitor = Visitor.find(params[:id].to_i)
    f = visitor.formulary.nil? ? Formulary.new : visitor.formulary
    form = Formulary.column_names.reverse.drop(2).reverse
    index = form.index(pf.keys.first)
    form.drop(index).each_with_index do |column_name, form_index|
      allow = "allow_" + column_name + "?"
      if pf[column_name].present?
        pf[column_name] = f.send(allow) ? pf[column_name] : nil
      else
        pf[column_name] = nil
      end
    end
    return pf
  end

end
