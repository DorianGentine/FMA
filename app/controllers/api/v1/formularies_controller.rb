class Api::V1::FormulariesController < Api::V1::BaseController
  before_action :set_visitor, only: [:new, :edit]

  def show
    @formulary = Formulary.find(params[:id])
    @solutions = SetSolutions.new(@formulary).call
    authorize @formulary
  end

  def new
    formulary = Formulary.new
    @formulary = FormularyToHash.new(formulary).form_json
    authorize formulary
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
end
