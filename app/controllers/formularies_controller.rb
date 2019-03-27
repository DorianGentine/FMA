class FormulariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :update]
  def create
    @visitor = Visitor.find_by(user_ip: request.ip)
    if @visitor.nil?
      @new_visitor = Visitor.create!(user_ip: request.ip)
      @formulary = Formulary.new(form_params)
      @formulary.visitor = @new_visitor
      @formulary.project = Project.create!
    else
      @formulary = @visitor.formulary
    end
    if @formulary.save
      redirect_to root_path
    else
      :new
    end
  end

  def update
    @formulary = Formulary.find(params[:id])
    if @formulary.update(form_params)
    # raise
      redirect_to root_path
    else
      :edit
    end
  end

private


  def form_params
    pf = params.require(:formulary).permit(:last_name, :first_name, :zip_code, :age,
      :is_working, :loss_of_autonomy_receipt, :occupation, :holder_occupation, :lessor, :accommodation, :floor,
      :accessibility_with_step, :type_of_pension, :pension, :supplementary, :loss_of_autonomy, :occupant,
      :owner_is_include, :has_partner, :tax_revenue, :gross_income, :global_tax_revenue, :household_income,
      :owner_tax_revenue, :assistant
    )

    # id: params[:id],
    # last_name: params[:formulary][:last_name],
    # first_name: params[:formulary][:first_name],
    # pf[:occupation] = params[:formulary][:occupation].to_i
    return pf
  end
end
