class Rating < ApplicationRecord
  belongs_to :project

  after_create :send_evalution

  def set_evaluation_form
    return {
      1 => set_obvious,
      2 => set_useful,
      3 => set_reactivity,
      4 => set_satisfy,
      5 => set_recommend,
      6 => set_remark
    }
  end


  private

  def send_evalution
    UserMailer.with(user: self.project.his_client, project: self.project, rating: self).evalution_result.deliver_now
    UserMailer.with(user: self.project.is_his_advisor, project: self.project, rating: self).evalution_result.deliver_now
    UserMailer.with(user: User.where(admin: true).first, project: self.project, rating: self).evalution_result.deliver_now
  end

  def set_obvious
    {
      column: "obvious",
      question: "Les informations fournies à travers notre plateforme et votre espace personnel sont-elles suffisamment claires ?",
      type: "radio",
      choice: {
        1 => "Ce n’était pas clair du tout",
        2 => "J’ai rencontré quelques difficultés de compréhension",
        3 => "Clair dans l’ensemble",
        4 => "Parfaitement clair"
      }
    }
  end

  def set_useful
    {
      column: "useful",
      question: "Les informations fournies à travers notre plateforme et votre espace personnel sont-elles utiles pour vous ?",
      type: "radio",
      choice: {
        1 => "Pas du tout",
        2 => "Peu d’entre elles me sont utiles",
        3 => "La majorité d’entre elles me sont utiles",
        4 => "Elles me sont toutes utiles"
      }
    }
  end


  def set_reactivity
    {
      column: "reactivity",
      question: "Avons-nous été suffisamment rapide pour vous délivrer les informations et conseils ?",
      type: "radio",
      choice: {
        1 => "J’ai trouvé le service trop lent",
        2 => "Rapide vous pourriez mieux faire",
        3 => "C’est le plus rapide que je pourrais trouver"
      }
    }
  end

  def set_satisfy
    {
      column: "satisfy",
      question: "Êtes globalement satisfait de notre plateforme ?",
      type: "radio",
      choice: {
        1 => "Pas du tout",
        2 => "Je suis peu satisfait(e)",
        3 => "Je suis satisfait(e)",
        4 => "Je suis très satisfait(e)"
      }
    }
  end

  def set_recommend
    {
      column: "recommend",
      question: "Recommanderiez-vous l’utilisation de notre plateforme ?",
      type: "radio",
      choice: {
        1 => "Oui",
        2 => "Non"
      }
    }
  end

  def set_remark
    {
      column: "remark",
      question: "Laissez-nous vos remarques, commentaires ou suggestions, libres :",
      type: "text"
    }
  end
end

