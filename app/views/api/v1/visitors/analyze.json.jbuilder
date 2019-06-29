json.formulary(@formulary, :id, :first_name, :zip_code, :age,
      :is_working, :loss_of_autonomy_receipt, :occupation, :holder_occupation, :lessor, :accommodation, :floor,
      :accessibility_with_step, :type_of_pension, :pension, :supplementary, :loss_of_autonomy, :occupant,
      :owner_is_include, :has_partner, :tax_revenue, :gross_income, :global_tax_revenue, :household_income,
      :owner_tax_revenue, :assistant)


json.solutions @solutions do |solution|
  json.financer solution.financer, :id, :name, :unmatched, :web, :phone, :logo, :description, :answer

  if solution.financer.web.nil?
    if solution.financer.name == "CAISSE DE RETRAITE PRINCIPALE"
      json.web Acteur.where(name: @formulary.pension.upcase).first.web
    elsif solution.financer.name == "CAISSE DE RETRAITE COMPLÉMENTAIRE"
      json.web Acteur.where(name: @formulary.supplementary.upcase).first.web
    elsif solution.financer.name == "BAILLEUR"
  # rajouter les urls pour les bailleurs
      json.web Acteur.where(name: @formulary.lessor).first.web
    end
  end

  # rajouter avec qui il ne vont pas

  json.extract! solution, :id, :background, :category, :group, :name, :financer_id
  json.answers solution.answers do |answer|
    json.extract! answer, :content
  end
end
