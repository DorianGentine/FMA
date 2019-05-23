class FormulariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]


  def show
    session[:formulary_id] = params[:id]
    @formulary = Formulary.find(params[:id])
    @visitor = @formulary.visitor
    @testing_solutions = Solution.all.map { |x| [x.id, TestSolution.new(x).test_solution_form] }.to_h.sort.to_h
    authorize @formulary
  end

end
