class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    set_collections_formulary
    @visitor = Visitor.find_by(user_ip: request.ip)
    if @visitor.nil?
      @formulary = Formulary.new
    else
      @formulary = @visitor.formulary
    end
  end

  private

  def set_collections_formulary
    @lessor_names = Formulary::LESSOR_NAMES
    @supplementary_names = Formulary::SUPPLEMENTARY_NAMES
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
end
