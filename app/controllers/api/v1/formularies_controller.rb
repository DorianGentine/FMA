class Api::V1::FormulariesController < Api::V1::BaseController


  def show
    @formulary = Formulary.find(params[:id])
    solution_ids = SetSolutions.new(@formulary).call
    @solutions = []
    solution_ids.each do |id|
      @solutions << Solution.find(id)
    end
  end
end
