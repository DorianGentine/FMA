class FormulariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :update, :show]
  def create
    @visitor = Visitor.find_by(user_ip: request.ip)
    if @visitor.nil?
      @new_visitor = Visitor.create!(user_ip: request.ip)
      @formulary = Formulary.new(form_params)
      @formulary.visitor = @new_visitor
      @formulary.project = Project.create!
    else
      if @visitor.formulary.nil?
        @formulary = Formulary.new(form_params)
        @formulary.visitor = @visitor
        @formulary.project = Project.create!
      else
        @formulary = @visitor.formulary
      end
    end

    if @formulary.save
      respond_to do |format|
        format.html { redirect_to home_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render '/home' }
        format.js
      end
    end
  end

  def update
    @formulary = Formulary.find(params[:id])
    # raise
    set_collections_formulary
    if @formulary.update(form_params)
      respond_to do |format|
        format.html { redirect_to home_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render '/home' }
        format.js
      end
    end
  end

  def show
    @formulary = Formulary.find(params[:id])
    @project = @formulary.project
  end

  private

  def set_collections_formulary
    @lessor_names = Formulary::LESSOR_NAMES
    @supplementary_names = Formulary::SUPPLEMENTARY_NAMES
    @pension_names = Formulary::PENSION_NAMES
    @yes_no = Formulary::YES_NO.map { |choice, index| [index, choice]  }
    @age_choices = Formulary::AGE.map { |choice, index| [index, choice]  }
    @occupation_choises = Formulary::OCCUPATION_CHOICES.map { |choice, index| [index, choice]  }
    @holder_occupation_choises = Formulary::HOLDER_OCCUPATION_CHOICES.map { |choice, index| [index, choice]  }
    @accommodation = Formulary::ACCOMMODATION.map { |choice, index| [index, choice]  }
    @floor_choices = Formulary::FLOOR.map { |choice, index| [index, choice]  }
    @type_of_pension = Formulary::TYPE_OF_PENSION.map { |choice, index| [index, choice]  }
    @loss_of_autonomy = Formulary::LOSS_OF_AUTONOMY.map { |choice, index| [index, choice]  }
    @occupant = Formulary::OCCUPANT.map { |choice, index| [index, choice]  }
    @tax_revenue = Formulary::TAXE_REVENUE.map { |choice, index| [index, choice]  }
    @gross_income = Formulary::GROSS_INCOME.map { |choice, index| [index, choice]  }
    @global_tax_revenue = Formulary::GLOBAL_TAXE_REVENUE.map { |choice, index| [index, choice]  }
    @household_income = Formulary::HOUSEHOLD_INCOME.map { |choice, index| [index, choice]  }
    @owner_tax_revenue = Formulary::OWNER_TAXE_REVENUE.map { |choice, index| [index, choice]  }
    @assistant = Formulary::ASSISTANT.map { |choice, index| [index, choice]  }
  end

  def reset_params
    pf = {
      age: nil,
      is_working: nil,
      loss_of_autonomy_receipt: nil,
      occupation: nil,
      holder_occupation: nil,
      lessor: nil,
      accommodation: nil,
      floor: nil,
      accessibility_with_step: nil,
      type_of_pension: nil,
      pension: nil,
      supplementary: nil,
      loss_of_autonomy: nil,
      occupant: nil,
      owner_is_include: nil,
      has_partner: nil,
      tax_revenue: nil,
      gross_income: nil,
      global_tax_revenue: nil,
      household_income: nil,
      owner_tax_revenue: nil,
      assistant: nil
    }
    return pf
  end

  def form_params
    pf = params.require(:formulary).permit(:last_name, :first_name, :zip_code, :age,
      :is_working, :loss_of_autonomy_receipt, :occupation, :holder_occupation, :lessor, :accommodation, :floor,
      :accessibility_with_step, :type_of_pension, :pension, :supplementary, :loss_of_autonomy, :occupant,
      :owner_is_include, :has_partner, :tax_revenue, :gross_income, :global_tax_revenue, :household_income,
      :owner_tax_revenue, :assistant
    )
    f = Formulary.new(pf)
    pf[:is_working] = f.allow_is_working? ? params[:formulary][:is_working] : nil
    pf[:loss_of_autonomy_receipt] = f.allow_loss_of_autonomy_receipt? ? params[:formulary][:loss_of_autonomy_receipt] : nil
    pf[:holder_occupation] = f.allow_holder_occupation? ? params[:formulary][:holder_occupation] : nil
    pf[:lessor] = f.allow_lessor? ? params[:formulary][:lessor] : nil
    pf[:accommodation] = f.allow_accommodation? ? params[:formulary][:accommodation] : nil
    pf[:floor] = f.allow_floor? ? params[:formulary][:floor] : nil
    pf[:accessibility_with_step] = f.allow_accessibility_with_step? ? params[:formulary][:accessibility_with_step] : nil
    pf[:type_of_pension] = f.allow_type_of_pension? ? params[:formulary][:type_of_pension] : nil
    pf[:pension] = f.allow_pension? ? params[:formulary][:pension] : nil
    pf[:supplementary] = f.allow_supplementary? ? params[:formulary][:supplementary] : nil
    pf[:loss_of_autonomy] = f.allow_loss_of_autonomy? ? params[:formulary][:loss_of_autonomy] : nil
    pf[:occupant] = f.allow_occupant? ? params[:formulary][:occupant] : nil
    pf[:owner_is_include] = f.allow_owner_is_include? ? params[:formulary][:owner_is_include] : nil
    pf[:has_partner] = f.allow_has_partner? ? params[:formulary][:has_partner] : nil
    pf[:tax_revenue] = f.allow_tax_revenue? ? params[:formulary][:tax_revenue] : nil
    pf[:gross_income] = f.allow_gross_income? ? params[:formulary][:gross_income] : nil
    pf[:global_tax_revenue] = f.allow_global_tax_revenue? ? params[:formulary][:global_tax_revenue] : nil
    pf[:household_income] = f.allow_household_income? ? params[:formulary][:household_income] : nil
    pf[:owner_tax_revenue] = f.allow_owner_tax_revenue? ? params[:formulary][:owner_tax_revenue] : nil

    return pf
  end













end
