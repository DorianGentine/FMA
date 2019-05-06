class Api::V1::FormulariesController < Api::V1::BaseController
  before_action :set_visitor, only: [:new, :edit]
  skip_after_action :verify_authorized, only: [:update, :create, :new, :show]
  skip_after_action :verify_policy_scoped, only: [:update, :create, :new]
  skip_before_action :authenticate_user!, only: [ :update, :create, :new]

  def show
    @formulary = Formulary.find(params[:id])
    @solutions = SetSolutions.new(@formulary).call
    authorize @formulary
  end

  def new
    formulary = Formulary.new
    @formulary = FormularyToHash.new(formulary).form_json
  end

  def create
    visitor = Visitor.find_or_create_by(user_ip: request.ip)
    p "params ===>  #{form_api_call_params.permit!}"
    formulary = Formulary.new(form_api_call_params.permit!)
    formulary.visitor = visitor
    formulary.project = Project.create!
    formulary.save
    render json: formulary
  end

  def update
    formulary = Formulary.find(params[:id].to_i)
    formulary.update(form_api_call_params.permit!)
    p "///// Après #{FormularyToHash.new(formulary).to_hash_forma}"
    render json: formulary
  end

  def edit
    formulary = @visitor.formulary
    @formulary = FormularyToHash.new(formulary).form_json
    authorize formulary
  end

  private

  def set_visitor
    @visitor = Visitor.find_by(user_ip: request.ip)
  end

  def form_api_call_params
    pf = params[:params_value]
    test_upload_alowing_form(pf)
  end

  def test_upload_alowing_form(pf)
    f = params[:id].nil? ? Formulary.new : Formulary.find(params[:id])
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
