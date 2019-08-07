class Api::V1::VisitorsController < Api::V1::BaseController
  before_action :set_visitor, only: [:show, :update_formulary, :analyze]

  def show
    user = current_user.nil? ? @visitor : current_user
    if current_user.nil? || !current_user.client
      formulary = @visitor.formulary.nil? ? Formulary.new : @visitor.formulary
    else
      formulary = current_user.his_formulary
    end
    @formulary = FormularyToHash.new(formulary).form_json
    render json: @formulary
  end

  def analyze
    @formulary = @visitor.formulary
    @solutions = @formulary.solutions
  end

  def update_formulary
    if @visitor.formulary.nil?
      formulary = Formulary.new(form_params)
      formulary.visitor = @visitor
      # formulary.project = Project.create(step: "validation_data")
      formulary.save
    else
      formulary = @visitor.formulary
      formulary.update(form_params)
      # if !formulary.project.validation_data?
      #   formulary.project.validation_data!
      # end
    end
    render json: FormularyToHash.new(formulary).form_json
    authorize @visitor
  end

  private

  def set_visitor
    @visitor = Visitor.find(params[:id])
    authorize @visitor  # For Pundit
  end

  def form_params
    visitor = Visitor.find(params[:id].to_i)
    pf = { params[:name] => params[:value] }
    f = visitor.formulary.nil? ? Formulary.new : visitor.formulary
    form = Formulary.column_names.reverse.drop(2).reverse
    index = form.index(pf.keys.first)
    form.drop(index).each_with_index do |column_name, form_index|
      # binding.pry if column_name == "zip_code"
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
