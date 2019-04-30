class Api::V1::FormulariesController < Api::V1::BaseController


  def show
    @formulary = Formulary.find(params[:id])
    solution_ids = SetSolutions.new(@formulary).call
    @solutions = []
    solution_ids.each do |id|
      @solutions << Solution.find(id)
    end
  end


  def edit
    @visitor = Visitor.find_by(user_ip: request.ip)
    if @visitor.nil? || @visitor.formulary.nil?
      @formulary = Formulary.new
    else
      @formulary = @visitor.formulary
    end
    @testing = FormularyToHash.new(@formulary).form_json
  end








end
