p "Destroy all financers"

Financer.delete_all
p "Create Financers"

  anah = Financer.create(name: "anah", photo: nil, description: "L’Agence Nationale pour l’Amélioration de l’habitat (ANAH) est un établissement public français existant depuis près de 50 ans. Son but est de favoriser la remise en bon état d’habitation le parc privé de logements pour lutter contre les fractures sociales et territoriales.
  L’établissement soutient les travaux de rénovation et réhabilitation des logements en accordant des aides financières. Les actions de l’ANAH se dirigent notamment vers les problématiques de mal-logement : l’insalubrité, la précarité énergétique ou encore l’inadaptation des logements à la perte d’autonomie ou au handicap.")
  cnav = Financer.create(name: "cnav", photo: nil, description: "La Caisse Nationale d'Assurance Vieillesse constitue la caisse de retraite principale des salariés du régime général.
  Elle délivre des actions social en faveur du bien viellir, notamment en ce qui concerne l'adaptation du logement. L'enjeu pour elle est de favoriser respect du maintien à domicile dans de bonnes conditions des retraités.")
  caisse = Financer.create(name: "caisse de retraite principale", photo: nil, description: "")
  bailleur = Financer.create(name: "bailleur", photo: nil, description: "")
  mutuel = Financer.create(name: "mutuel", photo: nil, description: "")
  caisse_sup = Financer.create(name: "caisse de retraite complémentaire", photo: nil, description: "")
  apa = Financer.create(name: "apa", photo: nil, description: "Le Conseil départemental du Val de Marne met en place des services adaptés pour l'accompagnement, notamment à domicile, des personnes âgées de plus de 60 ans.
  C'est notamment via le service de l'Allocation Personnalisée d'Autonomie (APA) que ces services se déploient. L'APA constitue une aide sociale permettant de financer partiellement ou totalement les dépenses permettant notamment le maintien à domicile.")
  pch = Financer.create(name: "pch", photo: nil, description: "Le Conseil départemental du Val de Marne met en place des services adaptés pour l'accompagnement, notamment à domicile, des personnes présentant une situation de handicap.
  C'est notamment via la Maison Départementale des Personnes Handicapapées qui distribue la Prestation de Compensation du handicap. Cete dernière permet de couvrir certaines dépenses relatives à la compensation de la perte d'autonomie, dont celles ayant attrait à l'adaptation du logement.")
  credit = Financer.create(name: "crédit d'impôt", photo: nil, description: "Vous pourriez bénéficier du crédit d'impot 'Aide aux personnes'. Il soutient les travaux d'adaptation du logement et peut couvrir les dépenses relatives à des équipements de types sanitaire, de sécurité ou d'accessibilité. Ouvert à tous, il vise les personnes imposables ou non. Le crédit d'impot en excédent éventuel est restitué au-delà de 8 euros. Si la mise en équipement concernant 1 personne, le montant du crédit d'impot est plafonné à 5000 euros et 10 000 lorsqu'il s'agit de 2 personnes. Une majoration de 400 euros est appliquée par personne à charge supplémentaire.")

p "Created"

p "Create Solutions"

  Solution.new(
    name: "Propriétaire occupant éligible",
    group: "Personne vivant seul",
    description: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
                  Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.

                  Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.

                  Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.

                  Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.",
                  financer: anah)
  Solution.new(
    name: "Locataire du parc privé éligible",
    group: "Personne vivant seul",
    description: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
                  Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.

                  Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.

                  Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.

                  Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.",
    financer: anah)


  Solution.new(
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible",
    group: "Personne vivant seul",
    description: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
                  Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.

                  Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le annuel revenu fiscal de référence doit être ainsi compris entre XXX et XXX euros. Le revenu annuel fiscal de référence du propriétaire du logement a été vérifié indépendamment, comme cela devrait se dérouler.

                  Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.

                  Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.",
    financer: anah
  )

  Solution.new(
    name: "Propriétaire occupant éligible",
    group: "Personne vivant seul",
    description: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
                Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.

                Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.

                Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.

                Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.",
    financer: anah
  )

  Solution.new(
    name: "Locataire du parc privé éligible",
    group: "Personne vivant seul",
    description: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
                  Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.

                  Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.

                  Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.

                  Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.",
    financer: anah
  )


  Solution.new(
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible",
    group: "Personne vivant seul",
    description: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
                  Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.

                  Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros. Le revenu annuel fiscal de référence du propriétraire a été vérifié indépendamment, comme cela devrait se dérouler.

                  Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.

                  Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.",
    financer: anah
  )

  # Solution.new(
  #   name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible",
  #   group: "Personne vivant seul",
  #   description: "",
  #   financer: anah
  # )

  # Solution.new(
  #   name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible",
  #   group: "Personne vivant seul",
  #   description: "",
  #   financer: anah
  # )

  # Solution.new(
  #   name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible",
  #   group: "Personne vivant seul",
  #   description: "",
  #   financer: anah
  # )











Solution.new(name: "Propriétaire occupant éligible", group: nil, description: nil, financer: anah)







# Solution.new(name: "Propriétaire occupant éligible", group: nil, description: nil, financer: anah)
