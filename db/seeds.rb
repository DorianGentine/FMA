p "Destroy all financers"

Financer.destroy_all

p "Create Advisor"

User.create(last_name: "Dupont", first_name: "Luc", phone: "998877866", avatar: "https://res.cloudinary.com/financermonautonomie/image/upload/v1556856590/portrait_avem_proche_b7j24g.jpg", advisor: true, client: false, admin: false, email: "advisor@mail.com", password:"password")

p "Create Advisor"

User.create(last_name: "Admin", first_name: "Adrien", phone: "998877866", avatar: nil, advisor: false, client: false, admin: true, email: "admin@mail.com", password:"password")

p "Create Financers"

  anah = Financer.create(name: "anah", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557905174/financers/anah_yw818q.png", description: "L’Agence Nationale pour l’Amélioration de l’habitat (ANAH) est un établissement public français existant depuis près de 50 ans. Son but est de favoriser la remise en bon état d’habitation le parc privé de logements pour lutter contre les fractures sociales et territoriales.
  L’établissement soutient les travaux de rénovation et réhabilitation des logements en accordant des aides financières. Les actions de l’ANAH se dirigent notamment vers les problématiques de mal-logement : l’insalubrité, la précarité énergétique ou encore l’inadaptation des logements à la perte d’autonomie ou au handicap.")
  cnav = Financer.create(name: "cnav", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557905174/financers/cnav_bdaqnx.png", description: "La Caisse Nationale d'Assurance Vieillesse constitue la caisse de retraite principale des salariés du régime général.
  Elle délivre des actions social en faveur du bien viellir, notamment en ce qui concerne l'adaptation du logement. L'enjeu pour elle est de favoriser respect du maintien à domicile dans de bonnes conditions des retraités.")
  caisse = Financer.create(name: "caisse de retraite principale", logo: nil, description: nil)
  bailleur = Financer.create(name: "bailleur", logo: nil, description: nil, answer: "Nous vous invitons à prendre contact avec votre bailleur social afin de vérifier avec lui les conditions d'une éventuelle aide")
  mutuel = Financer.create(name: "mutuel", logo: nil, description: nil, answer: "Nous conseillons de vérifier aurès des organismes de mutuelles auprès desquels vous détenez un contrat. Il est probable que ce dernier couvre le risque de la perte d'autonomie à domicile.")
  caisse_sup = Financer.create(name: "caisse de retraite complémentaire", logo: nil, description: nil)
  apa = Financer.create(name: "apa", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557905259/financers/apa_h51rcq.png", description: "Le Conseil départemental du Val de Marne met en place des services adaptés pour l'accompagnement, notamment à domicile, des personnes âgées de plus de 60 ans.
  C'est notamment via le service de l'Allocation Personnalisée d'Autonomie (APA) que ces services se déploient. L'APA constitue une aide sociale permettant de financer partiellement ou totalement les dépenses permettant notamment le maintien à domicile.")
  pch = Financer.create(name: "pch", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557905259/financers/apa_h51rcq.png", description: "Le Conseil départemental du Val de Marne met en place des services adaptés pour l'accompagnement, notamment à domicile, des personnes présentant une situation de handicap.
  C'est notamment via la Maison Départementale des Personnes Handicapapées qui distribue la Prestation de Compensation du handicap. Cete dernière permet de couvrir certaines dépenses relatives à la compensation de la perte d'autonomie, dont celles ayant attrait à l'adaptation du logement.")
  credit = Financer.create(name: "crédit d'impôt", logo: nil, description: "Vous pourriez bénéficier du crédit d'impot 'Aide aux personnes'. Il soutient les travaux d'adaptation du logement et peut couvrir les dépenses relatives à des équipements de types sanitaire, de sécurité ou d'accessibilité. Ouvert à tous, il vise les personnes imposables ou non. Le crédit d'impot en excédent éventuel est restitué au-delà de 8 euros. Si la mise en équipement concernant 1 personne, le montant du crédit d'impot est plafonné à 5000 euros et 10 000 lorsqu'il s'agit de 2 personnes. Une majoration de 400 euros est appliquée par personne à charge supplémentaire.")


p "Create Acteurs"

  Acteur.create(financer: bailleur, name: "BATIGERE", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "CDC HABITAT", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "COOPERER POUR HABITER", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "CRETEIL HABITAT", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "DOMNIS", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "FRANCE HABITATION", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "FOYER SOLEIL", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "I3F", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "ICADE IPM", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "IN'LI QWACIO", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "KREMLIN BICETRE HABITAT", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "LA SEMISE", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "LOGIAS", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "LOGIAL OPH", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "MAISONS ALFORT HABITAT", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "NOVIGERE", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPALY", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPH GENTILLY", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPH L'HAY LES ROSES", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPH VILLEJUIF", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPH VITRY", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPH IVRY", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OSICA", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "RATP HABITAT", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "RESIDENCE LE LOGEMENT DES FONCTIONNAIRES", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "SIEMP", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "VALOPHIS", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")

  Acteur.create(financer: caisse_sup, name: "Aucune")
  Acteur.create(financer: caisse_sup, name: "AG2R", web: "https://www.ag2rlamondiale.fr/", logo:"https://res.cloudinary.com/financermonautonomie/image/upload/v1557909722/financers/AG2R_zpsdqe.png")
  Acteur.create(financer: caisse_sup, name: "B2V", web: "https://www.b2v.fr/", logo:"https://res.cloudinary.com/financermonautonomie/image/upload/v1557909829/financers/B2V_em2htq.jpg")
  Acteur.create(financer: caisse_sup, name: "HUMANIS", web: "https://humanis.com/", logo:"https://res.cloudinary.com/financermonautonomie/image/upload/v1557909826/financers/HUMANIS_h0ithz.png")
  Acteur.create(financer: caisse_sup, name: "IRCANTEC", web: "https://www.ircantec.retraites.fr/", logo:"https://res.cloudinary.com/financermonautonomie/image/upload/v1557909818/financers/IRCANTEC_jyahmx.png")
  Acteur.create(financer: caisse_sup, name: "KLESIA", web: "https://www.klesia.fr/", logo:"")
  Acteur.create(financer: caisse_sup, name: "MALAKOFFF MEDERIC", web: "http://www.malakoffmederic.com/", logo:"")
  Acteur.create(financer: caisse_sup, name: "PROBTP", web: "https://www.probtp.com/", logo:"")
  Acteur.create(financer: caisse_sup, name: "AUDIENS", web: "https://www.audiens.org/accueil.html", logo:"")
  Acteur.create(financer: caisse_sup, name: "IRP AUTO", web: "https://www.irp-auto.com/", logo:"")
  Acteur.create(financer: caisse_sup, name: "LOURMEL", web: "https://www.lourmel.com/", logo:"")

  Acteur.create(financer: caisse, name: "CAMIEG", web:"https://www.camieg.fr/", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557909353/financers/CAMIEG_wtypcj.png")
  Acteur.create(financer: caisse, name: "CNRACL", web:"https://www.cnracl.retraites.fr/", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557909347/financers/CNRACL_torcxo.jpg")
  Acteur.create(financer: caisse, name: "RSI", web:"https://www.secu-independants.fr/", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557909283/financers/RSI_xkgrmq.jpg")
  Acteur.create(financer: caisse, name: "CARCDSF", web:"http://www.carcdsf.fr/", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557909278/financers/CARCDSF_jicb86.png")

p "Created"

  @assistants = FormularyChoice.new.set_collections_formulary[:assistant]

p "Create Solutions"
  p "ANAH"

  solution_1 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne vivant seul",
    group: "Revenu très modeste",
    name: "Propriétaire occupant éligible",
    conditions: "7:0&17:0&20:0&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_1, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700")
  Answer.create(solution: solution_1, content: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.")


  solution_2 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne vivant seul",
    group: "Revenu très modeste",
    name: "Locataire du parc privé éligible",
    conditions: "7:3&17:0&20:0&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_2, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
   Answer.create(solution: solution_2, content: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.")


  solution_3 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne vivant seul",
    group: "Revenu très modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible",
    conditions: "7:1&8:0&17:0&20:0&24:0&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_3, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
   Answer.create(solution: solution_3, content: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le annuel revenu fiscal de référence doit être ainsi compris entre XXX et XXX euros. Le revenu annuel fiscal de référence du propriétaire du logement a été vérifié indépendamment, comme cela devrait se dérouler.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.")


  solution_4 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne vivant seul",
    group: "Revenu modeste",
    name: "Propriétaire occupant éligible",
    conditions: "7:0&17:0&20:1&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_4, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_4, content: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.")


  solution_5 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne vivant seul",
    group: "Revenu modeste",
    name: "Locataire du parc privé éligible",
    conditions: "7:3&17:0&20:1&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_5, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_5, content: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.")


  solution_6 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne vivant seul",
    group: "Revenu modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible",
    conditions: "7:1&8:0&17:0&20:1&24:1&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_6, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_6, content: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros. Le revenu annuel fiscal de référence du propriétraire a été vérifié indépendamment, comme cela devrait se dérouler.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_7 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne ne vivant pas seule",
    group: "Revenu très modeste",
    name: "Propriétaire occupant éligible",
    conditions: "7:0&17:1&22:0&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_7, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_7, content: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.")


  solution_8 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne ne vivant pas seule",
    group: "Revenu très modeste",
    name: "Locataire du parc privé éligible",
    conditions: "7:3&17:1&22:0&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]")
  Answer.create(solution: solution_8, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_8, content: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.")


  solution_9 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne ne vivant pas seule",
    group: "Revenu très modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible et vivrait dans le même logement",
    conditions: "7:1&8:0&17:1&18:0&22:0&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_9, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_9, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'très modestes' par l'ANAH. Nous avons intégré le fait que le propriétaire du logement vit avec vous. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.")


  solution_10 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne ne vivant pas seule",
    group: "Revenu très modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible et ne vivrait pas dans le même logement",
    conditions: "7:1&8:0&17:1&18:1&22:0&24:0&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_10, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_10, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros. Le revenu annuel fiscal de référence du propriétraire a été vérifié indépendamment, comme cela devrait se dérouler.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.")


  solution_11 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne ne vivant pas seule",
    group: "Revenu modeste",
    name: "Propriétaire occupant éligible",
    conditions: "7:0&17:1&22:1&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_11, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_11, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_12 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne ne vivant pas seule",
    group: "Revenu modeste",
    name: "Locataire du parc privé éligible",
    conditions: "7:3&17:1&22:1&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_12, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_12, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_13 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne ne vivant pas seule",
    group: "Revenu modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible et vivrait dans le même logement",
    conditions: "7:1&8:0&17:1&18:0&22:1&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_13, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_13, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'modestes' par l'ANAH. Nous avons intégré le fait que le propriétaire du logement vit avec vous. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_14 = Solution.create(
    financer: anah,
    background: "Absence d'aide",
    category: "Personne ne vivant pas seule",
    group: "Revenu modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible et ne vivrait pas dans le même logement",
    conditions: "7:1&8:0&17:1&18:1&22:1&24:1&25:[" + @assistants[1]+","+@assistants[2]+","+@assistants[3]+","+@assistants[5]+ "]"
  )
  Answer.create(solution: solution_14, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_14, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros. Le revenu annuel fiscal de référence du propriétraire a été vérifié indépendamment, comme cela devrait se dérouler.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_15 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne vivant seul",
    group: "Revenu très modeste",
    name: "Propriétaire occupant éligible",
    conditions: "7:0&17:0&20:0&25:"+@assistants[4]
  )
  Answer.create(solution: solution_15, content: "Pour plus d'informations, vous pourriez :
        Vous rendre sur le site internet de l'ANAH : www.anah.fr
        Contacter téléphoniquement l'ANAH au 0808 800 700 " )
  Answer.create(solution: solution_15, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_16 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne vivant seul",
    group: "Revenu très modeste",
    name: "Locataire du parc privé éligible",
    conditions: "7:3&17:0&20:0&25:"+@assistants[4]
  )
  Answer.create(solution: solution_16, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_16, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_17 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne vivant seul",
    group: "Revenu très modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible",
    conditions: "7:1&8:0&17:0&20:0&24:0&25:"+@assistants[4]
  )
  Answer.create(solution: solution_17, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_17, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le annuel revenu fiscal de référence doit être ainsi compris entre XXX et XXX euros. Le revenu annuel fiscal de référence du propriétaire du logement a été vérifié indépendamment, comme cela devrait se dérouler.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_18 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne vivant seul",
    group: "Revenu modeste",
    name: "Propriétaire occupant éligible",
    conditions: "7:0&17:0&20:1&25:"+@assistants[4]
  )
  Answer.create(solution: solution_18, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_18, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_19 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne vivant seul",
    group: "Revenu modeste",
    name: "Locataire du parc privé éligible",
    conditions: "7:3&17:0&20:1&25:"+@assistants[4]
  )
  Answer.create(solution: solution_19, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_19, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_20 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne vivant seul",
    group: "Revenu modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible",
    conditions: "7:1&8:0&17:0&20:1&24:1&25:"+@assistants[4]
  )
  Answer.create(solution: solution_20, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_20, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Votre revenu annuel fiscal de référence fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le fait que vous viviez seul(e), le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros. Le revenu annuel fiscal de référence du propriétraire a été vérifié indépendamment, comme cela devrait se dérouler.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_21 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne ne vivant pas seule",
    group: "Revenu très modeste",
    name: "Propriétaire occupant éligible",
    conditions: "7:0&17:1&22:0&25:"+@assistants[4]
  )
  Answer.create(solution: solution_21, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_21, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_22 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne ne vivant pas seule",
    group: "Revenu très modeste",
    name: "Locataire du parc privé éligible",
    conditions: "7:3&17:1&22:0&25:"+@assistants[4]
  )

  Answer.create(solution: solution_22, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_22, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_23 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne ne vivant pas seule",
    group: "Revenu très modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible et vivrait dans le même logement",
    conditions: "7:1&8:0&17:1&18:0&22:0&25:"+@assistants[4]
  )
  Answer.create(solution: solution_23, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_23, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'très modestes' par l'ANAH. Nous avons intégré le fait que le propriétaire du logement vit avec vous. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_24 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne ne vivant pas seule",
    group: "Revenu très modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible et ne vivrait pas dans le même logement",
    conditions: "7:1&8:0&17:1&18:1&22:0&24:0&25:"+@assistants[4]
  )
  Answer.create(solution: solution_24, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_24, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 50 % du montant des devis relatifs, dans le limite de 10 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'très modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros. Le revenu annuel fiscal de référence du propriétraire a été vérifié indépendamment, comme cela devrait se dérouler.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 500 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 10 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_25 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne ne vivant pas seule",
    group: "Revenu modeste",
    name: "Propriétaire occupant éligible",
    conditions: "7:0&17:1&22:1&25:"+@assistants[4]
  )
  Answer.create(solution: solution_25, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_25, content: "Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_26 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne ne vivant pas seule",
    group: "Revenu modeste",
    name: "Locataire du parc privé éligible",
    conditions: "7:3&17:1&22:1&25:"+@assistants[4]
  )
  Answer.create(solution: solution_26, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_26, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_27 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne ne vivant pas seule",
    group: "Revenu modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible et vivrait dans le même logement",
    conditions: "7:1&8:0&17:1&18:0&22:1&25:"+@assistants[4]
  )
  Answer.create(solution: solution_27, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_27, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'modestes' par l'ANAH. Nous avons intégré le fait que le propriétaire du logement vit avec vous. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans.")

  solution_28 = Solution.create(
    financer: anah,
    background: "Antécédent d'aide de l'ANAH",
    category: "Personne ne vivant pas seule",
    group: "Revenu modeste",
    name: "Occupant à titre gratuit dont le titulaire du logement serait propriétaire  éligible et ne vivrait pas dans le même logement",
    conditions: "7:1&8:0&17:1&18:1&22:1&24:1&25:"+@assistants[4]
  )
  Answer.create(solution: solution_28, content: "Pour plus d'informations, vous pourriez :
            Vous rendre sur le site internet de l'ANAH : www.anah.fr
            Contacter téléphoniquement l'ANAH au 0808 800 700" )
  Answer.create(solution: solution_28, content:"Vous pourriez bénéficier d'une subvention de l'Agence Nationale de l'Habitat (ANAH).
              Elle pourrait correspondre à 35 % du montant des devis relatifs, dans le limite de 7 000 euros.
              Le revenu annuel fiscal de réfécence de votre foyer fait parti des revenus considérés comme 'modestes' par l'ANAH. En prenant en compte le nombre de personnes résidant dans votre foyer, le revenu annuel fiscal de référence doit être ainsi compris entre XXX et XXX euros. Le revenu annuel fiscal de référence du propriétraire a été vérifié indépendamment, comme cela devrait se dérouler.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 350 euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de l'ANAH pourrait atteindre 7 000 euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une subvention de l'ANAH au cours des 5 dernières années. Sachez que vous ne pouvez obtenira, auprès d'elle, plus de 20 000 euros hors TVA sur une période de 5 ans. ")


  p "CNAV"
  solution_29 = Solution.create(
    financer: cnav,
    background: "Absence d'aide sociale de la CNAV",
    category: "Personne vivant seule",
    group: "GIR > 4",
    name: nil,
    conditions: "4:[1,2,3]&13:0&17:0&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_29, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV).
              Elle pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              En prenant en compte le fait que vous viviez seul(e), votre revenu brut global est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_30 = Solution.create(
    financer: cnav,
    background: "Absence d'aide sociale de la CNAV",
    category: "Personne vivant seule",
    group: "GIR inconnu",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:2&17:0&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_30, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV). Cela peut toutefois dépendre du Groupe Iso-Ressource auquel vous appartenez. Nous vous invitons à le rechercher pour vérifier que votre GIR est bien supérieur à 4.
              Si tel est le cas, la subvention pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              En prenant en compte le fait que vous viviez seul(e), votre revenu brut global est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_31 = Solution.create(
    financer: cnav,
    background: "Absence d'aide sociale de la CNAV",
    category: "Personne vivant seule",
    group: "GIR non évalué",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:3&17:0&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_31, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV). Cela va toutefois dépendre de l'évaluation qu'un agent mandaté de la CNAV fera de votre Groupe Iso-Ressource (GIR).
              Si votre GIR est supérieur à 4, la subvention pourrait effectivement correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              En prenant en compte le fait que vous viviez seul(e), votre revenu brut global est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_32 = Solution.create(
    financer: cnav,
    background: "Absence d'aide sociale de la CNAV",
    category: "Personne vivant avec un conjoint, concubin ou partenaire de PACS",
    group: "GIR > 4",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:0&17:1&19:0&23:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_32, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV).
              Elle pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              Le revenu brut global de votre foyer est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_33 = Solution.create(
    financer: cnav,
    background: "Absence d'aide sociale de la CNAV",
    category: "Personne vivant avec un conjoint, concubin ou partenaire de PACS",
    group: "GIR inconnu",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:2&17:1&19:0&23:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_33, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV). Cela peut toutefois dépendre du Groupe Iso-Ressource auquel vous appartenez. Nous vous invitons à le rechercher pour vérifier que votre GIR est bien supérieur à 4.
              Si tel est le cas, la subvention pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              Le revenu brut global de votre foyer est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_34 = Solution.create(
    financer: cnav,
    background: "Absence d'aide sociale de la CNAV",
    category: "Personne vivant avec un conjoint, concubin ou partenaire de PACS",
    group: "GIR non évalué",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:3&17:1&19:0&23:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_34, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV). Cela va toutefois dépendre de l'évaluation qu'un agent mandaté de la CNAV fera de votre Groupe Iso-Ressource (GIR).
              Si votre GIR est supérieur à 4, la subvention pourrait effectivement correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              Le revenu brut global de votre foyer est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_35 = Solution.create(
    financer: cnav,
    background: "Absence d'aide sociale de la CNAV",
    category: "Personne ne vivant pas seul mais sans conjoint, concubin ou partenaire de PACS",
    group: "GIR > 4",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:0&17:1&19:1&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_35, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV).
              Elle pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              En prenant en compte le fait que vous ne vivez pas avec un conjoint, concubin ou partenaire de PACS, votre revenu brut global est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_36 = Solution.create(
    financer: cnav,
    background: "Absence d'aide sociale de la CNAV",
    category: "Personne ne vivant pas seul mais sans conjoint, concubin ou partenaire de PACS",
    group: "GIR inconnu",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:2&17:1&19:1&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_36, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV). Cela peut toutefois dépendre du Groupe Iso-Ressource auquel vous appartenez. Nous vous invitons à le rechercher pour vérifier que votre GIR est bien supérieur à 4.
              Si tel est le cas, la subvention pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              En prenant en compte le fait que vous ne vivez pas avec un conjoint, concubin ou partenaire de PACS, votre revenu brut global est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_37 = Solution.create(
    financer: cnav,
    background: "Absence d'aide sociale de la CNAV",
    category: "Personne ne vivant pas seul mais sans conjoint, concubin ou partenaire de PACS",
    group: "GIR non évalué",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:3&17:1&19:1&21:0&23:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_37, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV). Cela va toutefois dépendre de l'évaluation qu'un agent mandaté de la CNAV fera de votre Groupe Iso-Ressource (GIR).
              Si votre GIR est supérieur à 4, la subvention pourrait effectivement correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              En prenant en compte le fait que vous ne vivez pas avec un conjoint, concubin ou partenaire de PACS, votre revenu brut global est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.")

  solution_38 = Solution.create(
    financer: cnav,
    background: "Antécédent d'aide sociale de la CNAV",
    category: "Personne vivant seule",
    group: "GIR > 4",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:0&17:0&21:0&25:"+@assistants[3]
  )
  Answer.create(solution: solution_38, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV).
                Elle pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
                En prenant en compte le fait que vous viviez seul(e), votre revenu brut global est effectivement compris entre XXX et XXX euros.
                Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
                Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.
                Il apparait que vous avez déjà perçu une aide sociale de la CNAV. Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.")

  solution_39 = Solution.create(
    financer: cnav,
    background: "Antécédent d'aide sociale de la CNAV",
    category: "Personne vivant seule",
    group: "GIR inconnu",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:2&17:0&21:0&25:"+@assistants[3]
  )
  Answer.create(solution: solution_39, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV). Cela peut toutefois dépendre du Groupe Iso-Ressource auquel vous appartenez. Nous vous invitons à le rechercher pour vérifier que votre GIR est bien supérieur à 4.
              Si tel est le cas, la subvention pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              En prenant en compte le fait que vous viviez seul(e), votre revenu brut global est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une aide sociale de la CNAV. Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.")

  solution_40 = Solution.create(
    financer: cnav,
    background: "Antécédent d'aide sociale de la CNAV",
    category: "Personne vivant avec un conjoint, concubin ou partenaire de PACS",
    group: "GIR > 4",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:0&17:1&19:0&23:0&25:"+@assistants[3]
  )
  Answer.create(solution: solution_40, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV).
              Elle pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              Le revenu brut global de votre foyer est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une aide sociale de la CNAV. Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.")

  solution_41 = Solution.create(
    financer: cnav,
    background: "Antécédent d'aide sociale de la CNAV",
    category: "Personne vivant avec un conjoint, concubin ou partenaire de PACS",
    group: "GIR inconnu",
    name: nil,
    conditions: "4:1&13:0&16:2&17:1&19:0&23:0&25:"+@assistants[3]
  )
  Answer.create(solution: solution_41, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV). Cela peut toutefois dépendre du Groupe Iso-Ressource auquel vous appartenez. Nous vous invitons à le rechercher pour vérifier que votre GIR est bien supérieur à 4.
              Si tel est le cas, la subvention pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              Le revenu brut global de votre foyer est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une aide sociale de la CNAV. Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.")

  solution_42 = Solution.create(
    financer: cnav,
    background: "Antécédent d'aide sociale de la CNAV",
    category: "Personne ne vivant pas seul mais sans conjoint, concubin ou partenaire de PACS",
    group: "GIR > 4",
    name: nil,
    conditions: "4:1&13:0&16:0&17:1&19:1&21:0&25:"+@assistants[3]
  )
  Answer.create(solution: solution_42, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV).
              Elle pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              En prenant en compte le fait que vous ne vivez pas avec un conjoint, concubin ou partenaire de PACS, votre revenu brut global est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une aide sociale de la CNAV. Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.")

  solution_43 = Solution.create(
    financer: cnav,
    background: "Antécédent d'aide sociale de la CNAV",
    category: "Personne ne vivant pas seul mais sans conjoint, concubin ou partenaire de PACS",
    group: "GIR inconnu",
    name: nil,
    conditions: "4:1&13:0&16:2&17:1&19:1&21:0&25:"+@assistants[3]
  )
  Answer.create(solution: solution_43, content:"Vous pourriez bénéficier d'une subvention d'aide à l'habitat de la Caisse Nationale d'Assurance Vieillesse (CNAV). Cela peut toutefois dépendre du Groupe Iso-Ressource auquel vous appartenez. Nous vous invitons à le rechercher pour vérifier que votre GIR est bien supérieur à 4.
              Si tel est le cas, la subvention pourrait correspondre à XXX % du montant des devis relatifs, dans le limite de XXX euros.
              En prenant en compte le fait que vous ne vivez pas avec un conjoint, concubin ou partenaire de PACS, votre revenu brut global est effectivement compris entre XXX et XXX euros.
              Exemple 1 : vos devis relatifs au projet s'élèvent à 1000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros.
              Exemple 2 : vos devis relatifs au projet s'élèvent à 30 000 euros. En cas d'éligibilité avérée, la subvention de la CNAV pourrait atteindre XXX euros, respectant ainsi notamment la limite d'aide attribuable.
              Il apparait que vous avez déjà perçu une aide sociale de la CNAV. Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.")


  p "CAISSE DE retraite"
  solution_44 = Solution.create(
    financer: caisse,
    background: "Absence d'aide sociale de la caisse de retraite principale",
    category: nil,
    group: "GIR > 4",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:0&17:0&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_44, content:"Vous pourriez peut-être bénéficier d'une subvention d'aide à l'habitat de votre caisse de retraite principale, XXX.")

  solution_45 = Solution.create(
    financer: caisse,
    background: "Absence d'aide sociale de la caisse de retraite principale",
    category: nil,
    group: "GIR inconnu",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:2&17:0&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_45, content:"Vous pourriez peut-être bénéficier d'une subvention d'aide à l'habitat de votre caisse de retraite principale, XXX. Cela peut toutefois dépendre du Groupe Iso-Ressource auquel vous appartenez. Nous vous invitons à le rechercher pour vérifier que votre GIR est bien supérieur à 4.")

  solution_46 = Solution.create(
    financer: caisse,
    background: "Absence d'aide sociale de la caisse de retraite principale",
    category: nil,
    group: "GIR non évalué",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:3&17:0&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_46, content:"Vous pourriez peut-être bénéficier d'une subvention d'aide à l'habitat de votre caisse de retraite principale, XXX. Cela dépendrait toutefois de l'évaluation que celle-ci fera de votre Groupe Iso-Ressource (GIR). ")

  solution_47 = Solution.create(
    financer: caisse,
    background: "Antécédent d'aide sociale de la caisse de retraite principale",
    category: nil,
    group: "GIR > 4",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:0&17:0&21:0&25:"+@assistants[3]
  )
  Answer.create(solution: solution_47, content:"Vous pourriez peut-être bénéficier d'une subvention d'aide à l'habitat de votre caisse de retraite principale, XXX.
            Il apparait que vous avez déjà perçu une aide sociale de sa part. Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.")

  solution_48 = Solution.create(
    financer: caisse,
    background: "Antécédent d'aide sociale de la caisse de retraite principale",
    category: nil,
    group: "GIR inconnu",
    name: nil,
    conditions: "4:[1,2,3]&13:0&16:2&17:0&21:0&25:"+@assistants[3]
  )
  Answer.create(solution: solution_48, content:"Vous pourriez peut-être bénéficier d'une subvention d'aide à l'habitat de votre caisse de retraite principale, XXX. Cela pourrait toutefois dépendre du Groupe Iso-Ressource auquel vous appartenez. Nous vous invitons à le rechercher pour vérifier que votre GIR est bien supérieur à 4.
            Il apparait que vous avez déjà perçu une aide sociale de votre caisse de retraite principale. Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.")

p "Bailleur"

  solution_49 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: "Bailleurs autorisant et finançant potentiellement totalement un projet",
    group: "T1, T2 ou T3 en RDC et accessible",
    name: nil,
    conditions: "7:2&9:[I3F,LA SEMISE,VALOPHIS]&10:0&11:1&12:0 /,/ 7:1&8:1&9:[I3F,LA SEMISE,VALOPHIS]&10:0&11:1&12:0"
  )
  Answer.create(solution: solution_49, content:"Il semble que votre bailleur social puisse financer, sous certaines conditions, un projet d'adaptation de logement.")

  solution_50 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: "Bailleurs autorisant et finançant potentiellement totalement un projet",
    group: "T1, T2 ou T3 en étage et accessible",
    name: nil,
    conditions: "7:2&9:[I3F,LA SEMISE,VALOPHIS]&10:0&11:0&12:0 /,/ 7:1&8:1&9:[I3F,LA SEMISE,VALOPHIS]&10:0&11:0&12:0"
  )
  Answer.create(solution: solution_50, content:"Il semble que votre bailleur social puisse financer, sous certaines conditions, un projet d'adaptation de logement.")

  solution_51 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: "Bailleurs autorisant et finançant potentiellement totalement un projet",
    group: "RDC ou étage et logement inaccessible, peu importe la typologie",
    name: nil,
    conditions: "7:2&9:[I3F,LA SEMISE,VALOPHIS]&10:[0,1]&11:1&12:1 /,/ 7:1&8:1&9:[I3F,LA SEMISE,VALOPHIS]&10:[0,1]&11:1&12:1"
  )
  Answer.create(solution: solution_51, content:"Il semble que votre bailleur social puisse financer, sous certaines conditions, un projet d'adaptation de logement. Attention toutefois, car le fait que votre logement soit situé en étage et son accessibilité pourraient être des critères de non recevabilité pour votre demande.")

  solution_52 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: "Bailleurs autorisant et finançant potentiellement partiellement un projet",
    group: "T1, T2 ou T3 en RDC et accessible",
    name: nil,
    conditions: "7:2&9:[CRETEIL HABITAT,OPH VITRY]&10:0&11:1&12:0 /,/ 7:1&8:1&9:[CRETEIL HABITAT,OPH VITRY]&10:0&11:1&12:0"
  )
  Answer.create(solution: solution_52, content:"Il semble que votre bailleur social puisse financer partiellement, et sous certaines conditions, un projet d'adaptation de logement.")

  solution_53 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: "Bailleurs autorisant et finançant potentiellement partiellement un projet",
    group: "T1, T2 ou T3 en étage et accessible",
    name: nil,
    conditions: "7:2&9:[CRETEIL HABITAT,OPH VITRY]&10:0&11:0&12:0 /,/ 7:1&8:1&9:[CRETEIL HABITAT,OPH VITRY]&10:0&11:0&12:0"
  )
  Answer.create(solution: solution_53, content:"Il semble que votre bailleur social puisse financer partiellement, et sous certaines conditions, un projet d'adaptation de logement. Attention toutefois, car l'étage élevé de votre logement pourrait être un critère de non recevabilité pour votre demande.")

  solution_54 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: "Bailleurs autorisant et finançant potentiellement partiellement un projet",
    group: "RDC ou étage et logement inaccessible, peu importe la typologie",
    name: nil,
    conditions: "7:2&9:[CRETEIL HABITAT,OPH VITRY]&10:[0,1]&11:0&12:1 /,/ 7:1&8:1&9:[CRETEIL HABITAT,OPH VITRY]&10:[0,1]&11:0&12:1"
  )
  Answer.create(solution: solution_54, content:"Il semble que votre bailleur social puisse financer partiellement, et sous certaines conditions, un projet d'adaptation de logement. Attention toutefois, car le fait que votre logement soit situé en étage et sa faible accessibilité pourraient être des critères de non recevabilité pour votre demande.")

  solution_55 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: "Bailleur autorisant mais ne finançant pas",
    group: "T1, T2 ou T3 en RDC et accessible",
    name: nil,
    conditions: "7:2&9:[KREMLIN BICETRE HABITAT]&10:0&11:1&12:0 /,/ 7:1&8:1&9:[KREMLIN BICETRE HABITAT]&10:0&11:1&12:0"
  )
  Answer.create(solution: solution_55, content: "Il semble que votre bailleur social pourrait accepter la réalisation d'un projet d'adaptation de logement sans toutefois le financer (même partiellement). Son acceptetion pourrait être soumise à certaines conditions.")

  solution_56 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: nil,
    group: "T1, T2 ou T3 en étage et accessible",
    name: nil,
    conditions: "7:2&9:[KREMLIN BICETRE HABITAT]&10:0&11:0&12:0 /,/ 7:1&8:1&9:[KREMLIN BICETRE HABITAT]&10:0&11:0&12:0"
  )
  Answer.create(solution: solution_56, content:"Il semble que votre bailleur social pourrait accepter la réalisation d'un projet d'adaptation de logement sans toutefois le financer (même partiellement). Son acceptation pourrait être soumise à certaines conditions. Attention : le fait que votre logement soit situé en étage pourrait être un critère de non recevabilité pour votre demande.")

  solution_57 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: nil,
    group: "RDC ou étage et logement inaccessible, peu importe la typologie",
    name: nil,
    conditions: "7:2&9:[KREMLIN BICETRE HABITAT]&10:[0,1]&11:1&12:1 /,/ 7:1&8:1&9:[KREMLIN BICETRE HABITAT]&10:[0,1]&11:1&12:1"
  )
  Answer.create(solution: solution_50, content:"Il semble que votre bailleur social pourrait accepter la réalisation d'un projet d'adaptation de logement sans toutefois le financer (même partiellement). Son acceptation pourrait être soulise à certaines conditions. Attention : le fait que votre logement soit situé en étage et sa faible accessibilité pourraient être des critères de non recevabilité pour votre demande.")

  solution_58 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: "Bailleurs autorisant et finançant potentiellement totalement un projet",
    group: "T1, T2 ou T3 en étage et accessible",
    name: nil,
    conditions: "7:6&9:[KREMLIN BICETRE HABITAT]&10:0&11:1&12:0 /,/ 7:6&8:1&9:[KREMLIN BICETRE HABITAT]&10:0&11:1&12:0"
  )

  solution_59 = Solution.create(
    financer: bailleur,
    background: "Parc social",
    category: "Informations non disponibles pour le moment",
    group: nil,
    name: nil,
    conditions: "7:2&9:[BATIGERE,CDC HABITAT,COOPERER POUR HABITER,DOMNIS,FRANCE HABITATION,FOYER SOLEIL,ICADE IPM,IN'LI QWACIO,LOGIAS,LOGIAL OPH,MAISONS ALFORT HABITAT,NOVIGERE,OPALY,OPH GENTILLY,OPH L'HAY LES ROSES,OPH VILLEJUIF,OPH IVRY,OSICA,RATP HABITAT,RESIDENCE LE LOGEMENT DES FONCTIONNAIRES,SIEMP,Autre] /,/ 7:1&8:1&9:[BATIGERE,CDC HABITAT,COOPERER POUR HABITER,DOMNIS,FRANCE HABITATION,FOYER SOLEIL,ICADE IPM,IN'LI QWACIO,LOGIAS,LOGIAL OPH,MAISONS ALFORT HABITAT,NOVIGERE,OPALY,OPH GENTILLY,OPH L'HAY LES ROSES,OPH VILLEJUIF,OPH IVRY,OSICA,RATP HABITAT,RESIDENCE LE LOGEMENT DES FONCTIONNAIRES,SIEMP,Autre]"
  )
  Answer.create(solution: solution_59, content:"Votre bailleur pourrait peut-être, sous certaines conditions, vous aider à financer un projet d'adaptation de logement. Nous ne disposons pas encore d'informations précises quant à sa politique en faveur de la prévention ou compensation de le perte d'autonomie à domicile.")

  solution_60 = Solution.create(
    financer: bailleur,
    background: "Parc privé",
    category: "Bailleurs autorisant et finançant potentiellement totalement un projet",
    group: "T1, T2 ou T3 en étage et accessible",
    name: nil,
    conditions: "7:3"
  )
  Answer.create(solution: solution_60, content:"Le propriértaire de votre logement pourrait peut-être, sous certaines conditions, vous aider à financer un projet d'adaptation de logement.")

  solution_61 = Solution.create(
    financer: mutuel,
    background: nil,
    category: "Bailleurs autorisant et finançant potentiellement totalement un projet",
    group: "T1, T2 ou T3 en étage et accessible",
    name: nil,
    conditions: "4:[0,1,2,3]"
  )
  Answer.create(solution: solution_60, content: "Nous conseillons de vérifier aurès des organismes de mutuelles auprès desquels vous détenez un contrat. Il est probable que ce dernier couvre le risque de la perte d'autonomie à domicile.")

  solution_62 = Solution.create(
    financer: caisse_sup,
    background: nil,
    category: nil,
    group: nil,
    name: nil,
    conditions: "4:1&15:[Aucune]&16:0&17:0&21:0"
  )
  Answer.create(solution: solution_60, content:"Vous pourriez peut-être bénéficier d'une subvention d'aide à l'habitat de votre caisse de retraite complémentaire, XXX.")

  solution_63 = Solution.create(
    financer: apa,
    background: "Absence d'aide via l'APA",
    category: nil,
    group: "GIR < ou = 4",
    name: nil,
    conditions: "4:[2,3]&16:1&25:["+@assistants[0]+","+@assistants[3]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_60, content:"Vous pourriez peut-être bénéficier d'une aide du Conseil départemental du Val de Marne afin d'adapter votre logement.
              Afin de vérifier les conditions d'aide éventuelle, nous vous conseillons de contacter votre référent médico-social en appeler le service APA au 01 56 72 71 71.")

  solution_64 = Solution.create(
    financer: apa,
    background: "Absence d'aide via l'APA",
    category: nil,
    group: "GIR inconnu",
    name: nil,
    conditions: "4:[2,3]&16:2&25:["+@assistants[0]+","+@assistants[3]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_60, content:"Vous pourriez peut-être bénéficier d'une aide du Conseil départemental du Val de Marne afin d'adapter votre logement. Cela peut toutefois dépendre du Groupe Iso-Ressource (GIR) auquel vous appartenez.
Nous vous invitons à le rechercher pour vérifier que votre GIR est bien inférieur ou égal à 4.
Egalement, afin de vérifier les conditions d'aide éventuelle, nous vous conseillons de contacter votre référent médico-social en appeler le service APA au 01 56 72 71 71.")

  solution_65 = Solution.create(
    financer: apa,
    background: "Absence d'aide via l'APA",
    category: nil,
    group: "GIR non évalué",
    name: nil,
    conditions: "4:[2,3]&16:3&25:["+@assistants[0]+","+@assistants[3]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_60, content:"Vous pourriez peut-être bénéficier d'une aide du Conseil départemental du Val de Marne afin d'adapter votre logement. Cela dépendrait toutefois de votre éligibilité à l'Allocation Personnalisée Autonomie (APA) et de l'évaluation qu'un référent médico-social du Conseil départemental ferait de votre Groupe Iso-Ressource (GIR).
        Nous vous conseillons de prendre contact avec le service APA du Conseil départemental du Val de Marne au 01 56 72 71 71.")

  solution_66 = Solution.create(
    financer: apa,
    background: "Antécédent d'aide via l'APA",
    category: nil,
    group: "GIR < ou = 4",
    name: nil,
    conditions: "4:[2,3]&16:1&25:"+@assistants[1]
  )
  Answer.create(solution: solution_60, content:"Vous pourriez peut-être bénéficier d'une aide du Conseil départemental du Val de Marne afin d'adapter votre logement.
          Il apparait que vous avez déjà perçu une aide pour l'adaptation de votre logement, via l'Allocation Personalisée d'Autonomie (APA). Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.
          Afin de vérifier les conditions d'aide éventuelle, nous vous conseillons de contacter votre référent médico-social en appeler le service APA au 01 56 72 71 71.")

  solution_67 = Solution.create(
    financer: apa,
    background: "Absence d'aide via l'APA",
    category: nil,
    group: "GIR inconnu",
    name: nil,
    conditions: "4:[2,3]&16:3&25:"+@assistants[1]
  )
  Answer.create(solution: solution_6, content:"Vous pourriez peut-être bénéficier d'une aide du Conseil départemental du Val de Marne afin d'adapter votre logement. Cela peut toutefois dépendre du Groupe Iso-Ressource (GIR) auquel vous appartenez.
      Nous vous invitons à le rechercher pour vérifier que votre GIR est bien inférieur ou égal à 4.
      Il apparait que vous avez déjà perçu une aide pour l'adaptation de votre logement, via l'Allocation Personalisée d'Autonomie (APA). Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.
      Egalement, afin de vérifier les conditions d'aide éventuelle, nous vous conseillons de contacter votre référent médico-social en appeler le service APA au 01 56 72 71 71.")

  solution_68 = Solution.create(
    financer: pch,
    background: "Absence de PCH",
    category: nil,
    group: "Personne âgée jusqu'à 60 ans (compris)",
    name: nil,
    conditions: "4:[0,1]&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_68, content:"Vous pourriez peut-être bénéficier d'une aide du Conseil départemental du Val de Marne afin d'adapter votre logement.
            Afin de vérifier les conditions d'aide éventuelle, nous vous conseillons de contacter la MDPH au 01 43 99 79 00.")

  solution_69 = Solution.create(
    financer: pch,
    background: "Absence de PCH",
    category: nil,
    group: "Personne âgée de 60 ans (non compris) et exerçant une activité professionnelle",
    name: nil,
    conditions: "4:[2,3]&5:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_69, content:"Vous pourriez peut-être bénéficier d'une aide du Conseil départemental du Val de Marne afin d'adapter votre logement. Cela pourrait être possible tant que vous exercez une activité professionnelle.
    Afin de vérifier les conditions d'aide éventuelle, nous vous conseillons de contacter la MDPH au 01 43 99 79 00.")

  solution_70 = Solution.create(
    financer: pch,
    background: "Absence de PCH",
    category: nil,
    group: "Personne âgée de 60 ans (non compris) et n'exerçant pas d'activité professionnelle",
    name: nil,
    conditions: "4:2&5:1&6:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_70, content: "Vous pourriez peut-être bénéficier d'une aide du Conseil départemental du Val de Marne afin d'adapter votre logement. Cela pourrait être possible jusqu'à vos 75 ans et si vous êtes effectivement en mesure de présenter des preuves que votre handicap est lié à des évènements antérieurs à l'anniversaire de vos 60 ans.
          Afin de vérifier les conditions d'aide éventuelle, nous vous conseillons de contacter la MDPH au 01 43 99 79 00.")

  solution_71 = Solution.create(
    financer: pch,
    background: "Antécédent de PCH",
    category: nil,
    group: nil,
    name: nil,
    conditions: "25:"+@assistants[2]
  )
  Answer.create(solution: solution_71, content: "Vous pourriez peut-être bénéficier d'une aide du Conseil départemental du Val de Marne afin d'adapter votre logement.
            Il apparait que vous avez déjà perçu une aide pour l'adaptation de votre logement, via la Prestation de Compensation du Handicap (PCH). Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.
            Afin de vérifier les conditions d'aide éventuelle, nous vous conseillons de contacter la MDPH au 01 43 99 79 00.")



  solution_72 = Solution.create(
    financer: credit,
    background: nil,
    category: nil,
    group: nil,
    name: nil,
    conditions: "4:[0,1,2,3]"
  )

  Answer.create(solution: solution_72, content: "Vous pourriez bénéficier du crédit d'impot 'Aide aux personnes'. Il soutient les travaux d'adaptation du logement et peut couvrir les dépenses relatives à des équipements de types sanitaire, de sécurité ou d'accessibilité. Ouvert à tous, il vise les personnes imposables ou non. Le crédit d'impot en excédent éventuel est restitué au-delà de 8 euros.
            Si la mise en équipement concernant 1 personne, le montant du crédit d'impot est plafonné à 5000 euros et 10 000 lorsqu'il s'agit de 2 personnes. Une majoration de 400 euros est appliquée par personne à charge supplémentaire.")




p "Solutions Created"




















