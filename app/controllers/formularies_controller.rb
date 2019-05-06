class FormulariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :update, :show, :sort]
  # skip_before_action :verify_authenticity_token, only: [:sort, :update, :create]



  def create
    # @visitor = Visitor.find_by(user_ip: request.ip)
    # if @visitor.nil?
    #   @new_visitor = Visitor.create!(user_ip: request.ip)
    #   @formulary = Formulary.new(form_params)
    #   @formulary.visitor = @new_visitor
    #   @formulary.project = Project.create!
    # else
    #   if @visitor.formulary.nil?
    #     @formulary = Formulary.new(form_params)
    #     @formulary.visitor = @visitor
    #     @formulary.project = Project.create!
    #   else
    #     @formulary = @visitor.formulary
    #   end
    # end
    # respond_to do |format|
    #   if @formulary.save
    #     format.html { redirect_to home_path }
    #     format.js
    #   else
    #     format.html { render '/home' }
    #     format.js
    #   end
    # end
    # authorize @formulary
  end

  def update
    @formulary = Formulary.find(params[:id])
    @choices = FormularyChoice.new.set_collections_formulary
    respond_to do |format|
      if @formulary.update(form_params)
        format.html { redirect_to home_path }
        format.js
      else
        format.html { render '/home' }
        format.js
      end
    end
    authorize @formulary
  end


  def show
    session[:formulary_id] = params[:id]
    @formulary = Formulary.find(params[:id])
    @project = @formulary.project
    @solutions = SetSolutions.new(@formulary).call
    @choices = FormularyChoice.new.set_collections_formulary

    @testing_solutions = Solution.all.map { |x| [x.id, TestSolution.new(x).test_solution_form] }.to_h.sort.to_h
    authorize @formulary
  end

  private

  def form_params
    pf = params.require(:formulary).permit(:last_name, :first_name, :zip_code, :age,
      :is_working, :loss_of_autonomy_receipt, :occupation, :holder_occupation, :lessor, :accommodation, :floor,
      :accessibility_with_step, :type_of_pension, :pension, :supplementary, :loss_of_autonomy, :occupant,
      :owner_is_include, :has_partner, :tax_revenue, :gross_income, :global_tax_revenue, :household_income,
      :owner_tax_revenue, :assistant
    )
    return upload_alowing_form(pf)
  end

  # pour un seul params exemple floor mais pas pour tout les models
  def upload_alowing_form(pf)
    f = params[:id].nil? ? Formulary.new : Formulary.find(params[:id])
    form = Formulary.column_names.reverse.drop(2).reverse
    index = form.index(params[:formulary].keys.first)
    form.drop(index).each_with_index do |column_name, form_index|
      allow = "allow_" + column_name + "?"
      if params[:formulary][column_name].present?
        pf[column_name] = f.send(allow) ? params[:formulary][column_name] : nil
      else
        pf[column_name] = nil
      end
    end
    return pf
  end


  # def reset_params
  #   pf = {
  #     age: nil,
  #     is_working: nil,
  #     loss_of_autonomy_receipt: nil,
  #     occupation: nil,
  #     holder_occupation: nil,
  #     lessor: nil,
  #     accommodation: nil,
  #     floor: nil,
  #     accessibility_with_step: nil,
  #     type_of_pension: nil,
  #     pension: nil,
  #     supplementary: nil,
  #     loss_of_autonomy: nil,
  #     occupant: nil,
  #     owner_is_include: nil,
  #     has_partner: nil,
  #     tax_revenue: nil,
  #     gross_income: nil,
  #     global_tax_revenue: nil,
  #     household_income: nil,
  #     owner_tax_revenue: nil,
  #     assistant: nil
  #   }
  #   return pf
  # end

end
