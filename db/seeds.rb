require 'faker'


p "Create Financers"

  anah = Financer.create(name: "anah", web: "http://www.anah.fr", phone: "0 820 15 15 15", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557905174/financers/anah_yw818q.png", description: "L’Agence Nationale pour l’Amélioration de l’habitat (ANAH) est un établissement public français existant depuis près de 50 ans. Son but est de favoriser la remise en bon état d’habitation le parc privé de logements pour lutter contre les fractures sociales et territoriales.
  L’établissement soutient les travaux de rénovation et réhabilitation des logements en accordant des aides financières. Les actions de l’ANAH se dirigent notamment vers les problématiques de mal-logement : l’insalubrité, la précarité énergétique ou encore l’inadaptation des logements à la perte d’autonomie ou au handicap.")
  cnav = Financer.create(name: "cnav", web: "https://www.lassuranceretraite.fr/", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557905174/financers/cnav_bdaqnx.png", description: "La Caisse Nationale d'Assurance Vieillesse constitue la caisse de retraite principale des salariés du régime général.
  Elle délivre des actions social en faveur du bien viellir, notamment en ce qui concerne l'adaptation du logement. L'enjeu pour elle est de favoriser respect du maintien à domicile dans de bonnes conditions des retraités.")
  caisse = Financer.create(name: "caisse de retraite principale", web: nil, logo: nil, description: nil)
  bailleur = Financer.create(name: "bailleur", web: nil, logo: nil, description: nil, answer: "Nous vous invitons à prendre contact avec votre bailleur social afin de vérifier avec lui les conditions d'une éventuelle aide")
  mutuel = Financer.create(name: "mutuelle", web: nil, phone: "01 73 78 32 78", logo: nil, description: nil, answer: "Nous conseillons de vérifier auprès des organismes de mutuelles auprès desquels vous détenez un contrat. Il est probable que ce dernier couvre le risque de la perte d'autonomie à domicile.")
  caisse_sup = Financer.create(name: "caisse de retraite complémentaire", web: nil, logo: nil, description: nil)
  apa = Financer.create(name: "apa", web: "http://www.valdemarne.fr", phone: "01.43.99.83.83", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557905259/financers/apa_h51rcq.png", description: "Le Conseil départemental du Val de Marne met en place des services adaptés pour l'accompagnement, notamment à domicile, des personnes âgées de plus de 60 ans.
  C'est notamment via le service de l'Allocation Personnalisée d'Autonomie (APA) que ces services se déploient. L'APA constitue une aide sociale permettant de financer partiellement ou totalement les dépenses permettant notamment le maintien à domicile.")
  pch = Financer.create(name: "pch", web: "http://www.valdemarne.fr", phone: "01 43 99 79 00", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557905259/financers/apa_h51rcq.png", description: "Le Conseil départemental du Val de Marne met en place des services adaptés pour l'accompagnement, notamment à domicile, des personnes présentant une situation de handicap.
  C'est notamment via la Maison Départementale des Personnes Handicapapées qui distribue la Prestation de Compensation du handicap. Cete dernière permet de couvrir certaines dépenses relatives à la compensation de la perte d'autonomie, dont celles ayant attrait à l'adaptation du logement.")
  credit = Financer.create(name: "crédit d'impôt", web: "https://www.impots.gouv.fr/portail/", phone: "0 810 467 687", logo: nil, description: "Vous pourriez bénéficier du crédit d'impot 'Aide aux personnes'. Il soutient les travaux d'adaptation du logement et peut couvrir les dépenses relatives à des équipements de types sanitaire, de sécurité ou d'accessibilité. Ouvert à tous, il vise les personnes imposables ou non. Le crédit d'impot en excédent éventuel est restitué au-delà de 8 euros. Si la mise en équipement concernant 1 personne, le montant du crédit d'impot est plafonné à 5000 euros et 10 000 lorsqu'il s'agit de 2 personnes. Une majoration de 400 euros est appliquée par personne à charge supplémentaire.")
  securité_social = Financer.create(name: "Sécurité Sociale", web: "http://www.securite-sociale.fr/", logo: nil, description: "Vous pourriez bénéficier d'une participation de la sécurité sociale pour l'acquisition de matériels médicaux, ou compensant la perte d'autonomie.
    La prise en charge sera conditionnée à une prescription médicale et ne pourra se faire que sur une liste de matériel que votre médecin traitant connaît normalement.
    Le montant de la participation dépendra de votre taux de prise en charge.")


p "Create Acteurs"

  Acteur.create(financer: bailleur, name: "BATIGERE", web:"http://www.batigere.fr", phone:"01 44 29 84 00", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "CDC HABITAT", web:"http://www.cdc-habitat.com", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "COOPERER POUR HABITER", web:"http://www.coopererpourhabiter.fr/", phone:"01 53 66 97 40", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "CRETEIL HABITAT", web:"http://www.creteil-habitat.com", phone:"01 45 17 40 00", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "DOMNIS", web:"http://www.domnis.fr/", phone:"01 44 79 89 89", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "FRANCE HABITATION", web: "http://www.france-habitation.fr", phone:"01 49 42 79 89", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "FOYER SOLEIL", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "I3F", web: "http://www.groupe3f.fr", phone:"01 55 26 11 90", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "ICADE IPM", web: "", phone:"", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "IN'LI QWACIO", web: "https://www.inli.fr/", phone:"01 40 89 77 77", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "KREMLIN BICETRE HABITAT", web: "http://kremlinbicetre-habitat.fr/ ", phone:"01 53 14 11 30", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "LA SEMISE", web: "http://www.semise.fr", phone:"01 45 73 65 65", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "LOGIAS", web: "", phone:"", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "LOGIAL OPH", web: "http://www.logial-oph.fr/ ", phone:"01 45 18 20 00 ", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "MAISONS ALFORT HABITAT", web: nil, phone:"01 45 18 34 00", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "NOVIGERE", web: "", phone:"", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPALY", web: "http://www.opaly.org/", phone:"01 46 15 32 00", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPH GENTILLY", web: "", phone:"", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPH L'HAY LES ROSES", web: nil, phone:"01 46 63 06 98", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPH VILLEJUIF", web: "http://www.oph-villejuif.fr/", phone:"01 43 90 16 00", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPH VITRY", web: "http://www..opvitry.org", phone:"01 49 59 31 00", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OPH IVRY", web: "", phone:"", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "OSICA", web: nil, phone:"01 69 53 49 69", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "RATP HABITAT", web: nil, phone:"09 87 66 10 00", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "RESIDENCE LE LOGEMENT DES FONCTIONNAIRES", web: nil, phone:"01 44 37 72 77", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "SIEMP", web: "http://www.elogie-siemp.paris", phone:"", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")
  Acteur.create(financer: bailleur, name: "VALOPHIS", web: "http://www.groupevalophis.fr", phone:"08 92 97 62 82", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557908425/financers/BATIGERE_zdmd1x.png")

  Acteur.create(financer: caisse_sup, name: "Aucune")
  # Acteur.create(financer: caisse_sup, name: "AG2R", web: "https://www.ag2rlamondiale.fr/", logo:"https://res.cloudinary.com/financermonautonomie/image/upload/v1557909722/financers/AG2R_zpsdqe.png")
  Acteur.create(financer: caisse_sup, name: "B2V", web: "https://www.b2v.fr/", logo:"https://res.cloudinary.com/financermonautonomie/image/upload/v1557909829/financers/B2V_em2htq.jpg")
  Acteur.create(financer: caisse_sup, name: "HUMANIS", web: "https://humanis.com/", logo:"https://res.cloudinary.com/financermonautonomie/image/upload/v1557909826/financers/HUMANIS_h0ithz.png")
  # Acteur.create(financer: caisse_sup, name: "IRCANTEC", web: "https://www.ircantec.retraites.fr/", logo:"https://res.cloudinary.com/financermonautonomie/image/upload/v1557909818/financers/IRCANTEC_jyahmx.png")
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
  Acteur.create(financer: caisse, name: "CIPAV", web:"https://www.lacipav.fr/", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557909278/financers/CARCDSF_jicb86.png")
  Acteur.create(financer: caisse, name: "CNAV", web:"https://www.lassuranceretraite.fr/portail-info/accueil", logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1557909278/financers/CARCDSF_jicb86.png")

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
    conditions: "4:[1,2,3]&13:0&16:0&17:0&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
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
    conditions: "4:[1,2,3]&13:1&16:0&17:0&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_44, content:"Vous pourriez peut-être bénéficier d'une subvention d'aide à l'habitat de votre caisse de retraite principale, XXX.")

  solution_45 = Solution.create(
    financer: caisse,
    background: "Absence d'aide sociale de la caisse de retraite principale",
    category: nil,
    group: "GIR inconnu",
    name: nil,
    conditions: "4:[1,2,3]&13:1&16:2&17:0&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_45, content:"Vous pourriez peut-être bénéficier d'une subvention d'aide à l'habitat de votre caisse de retraite principale, XXX. Cela peut toutefois dépendre du Groupe Iso-Ressource auquel vous appartenez. Nous vous invitons à le rechercher pour vérifier que votre GIR est bien supérieur à 4.")

  solution_46 = Solution.create(
    financer: caisse,
    background: "Absence d'aide sociale de la caisse de retraite principale",
    category: nil,
    group: "GIR non évalué",
    name: nil,
    conditions: "4:[1,2,3]&13:1&16:3&17:0&21:0&25:["+@assistants[0]+","+@assistants[4]+","+@assistants[5]+"]"
  )
  Answer.create(solution: solution_46, content:"Vous pourriez peut-être bénéficier d'une subvention d'aide à l'habitat de votre caisse de retraite principale, XXX. Cela dépendrait toutefois de l'évaluation que celle-ci fera de votre Groupe Iso-Ressource (GIR). ")

  solution_47 = Solution.create(
    financer: caisse,
    background: "Antécédent d'aide sociale de la caisse de retraite principale",
    category: nil,
    group: "GIR > 4",
    name: nil,
    conditions: "4:[1,2,3]&13:1&16:0&17:0&21:0&25:"+@assistants[3]
  )
  Answer.create(solution: solution_47, content:"Vous pourriez peut-être bénéficier d'une subvention d'aide à l'habitat de votre caisse de retraite principale, XXX.
            Il apparait que vous avez déjà perçu une aide sociale de sa part. Nous vous conseillons de vérifier notamment les critères de renouvellement qui peuvent être conditionnés à une somme plafond attribuable sur une période délimitée.")

  solution_48 = Solution.create(
    financer: caisse,
    background: "Antécédent d'aide sociale de la caisse de retraite principale",
    category: nil,
    group: "GIR inconnu",
    name: nil,
    conditions: "4:[1,2,3]&13:1&16:2&17:0&21:0&25:"+@assistants[3]
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
  Answer.create(solution: solution_60, content: "Nous conseillons de vérifier auprès des organismes de mutuelles auprès desquels vous détenez un contrat. Il est probable que ce dernier couvre le risque de la perte d'autonomie à domicile.")

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


  solution_73 = Solution.create(
    financer: securité_social,
    background: nil,
    category: nil,
    group: nil,
    name: nil,
    conditions: "4:[0,1,2,3]"
  )
  Answer.create(solution: solution_73, content: "Vous pourriez bénéficier d'une participation de la sécurité sociale pour l'acquisition de matériels médicaux, ou compensant la perte d'autonomie.
  La prise en charge sera conditionnée à une prescription médicale et ne pourra se faire que sur une liste de matériel que votre médecin traitant connaît normalement.
  Le montant de la participation dépendra de votre taux de prise en charge.")


p "Solutions Created"

p "Create Ressources"

# 2,5,8,12,16,19,22,26
ressource_1 = Ressource.create(title: "ANAH locataire parc privé", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH)", solution_ids: "2,5,8,12,16,19,22,26")
ressource_1.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160073/ressources/ANAH/Notice_ANAH_locataire_parc_prive_dssvaw.pdf"
ressource_1.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160063/ressources/ANAH/FORMULAIRE_ANAH_sby8hz.pdf"
ressource_1.save
# 3,6,9,10,13,14,17,20,23,24,27,28
ressource_2 = Ressource.create(title: "ANAH occupant à titre gratuit", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH)", solution_ids: "3,6,9,10,13,14,17,20,23,24,27,28")
ressource_2.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160070/ressources/ANAH/Notice_ANAH_occupant_titre_gratuit_vl0ytc.pdf"
ressource_2.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160063/ressources/ANAH/FORMULAIRE_ANAH_sby8hz.pdf"
ressource_2.save
# 1,4,7,11,15,18,21,25
ressource_3 = Ressource.create(title: "ANAH_propriétaire_occupant", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH)", solution_ids: "1,4,7,11,15,18,21,25")
ressource_3.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160067/ressources/ANAH/Notice_ANAH_proprietaire_occupant_ssdrop.pdf"
ressource_3.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160063/ressources/ANAH/FORMULAIRE_ANAH_sby8hz.pdf"
ressource_3.save
# 62,63,64,65,66
ressource_4 = Ressource.create(title: "APA", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès de des services de l'Allocation Personnalisée Autonomie (APA)", solution_ids: "62,63,64,65,66",)
ressource_4.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160056/ressources/APA/Notice_APA_eeuddt.pdf"
ressource_4.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160057/ressources/APA/Formulaire_APA_kmjfy1.pdf"
ressource_4.save
# 60
ressource_5 = Ressource.create(title: "Bailleur privé", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur privé", solution_ids: "60" )
ressource_5.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160066/ressources/Bailleur_parc_prive/Notice_bailleur_parc_prive_pscor2.pdf"
ressource_5.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160064/ressources/Bailleur_parc_prive/Modele_demande_autorisation_proprietaire_lohlid.pdf"
ressource_5.save

# 29,30,31,32,33,34,35,36,37,38,39,40,41,42,43
ressource_6 = Ressource.create(title: "CNAV", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès de la Caisse Nationale d'Assurance Vieillesse (CNAV)", solution_ids: "29,30,31,32,33,34,35,36,37,38,39,40,41,42,43")
ressource_6.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160062/ressources/Caisse_retraite_principale/CNAV/FORMULAIRE_CNAV_hyrjkx.pdf"
ressource_6.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160062/ressources/Caisse_retraite_principale/CNAV/FORMULAIRE_CNAV_hyrjkx.pdf"
ressource_6.save
# CREDIT D'IMPOT
ressource_7 = Ressource.create(title: "Crédit d'impôt", description: "Retrouvez, ici, les ressources pour bénéficier du Crétit d'impôt", financer: "CREDIT D'IMPOT", solution_ids: "61")
ressource_7.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160058/ressources/Credit_d_impot/Notice_Credit_d_impot_bg6hyp.pdf"
ressource_7.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160057/ressources/Credit_d_impot/Explication_Credit_d_impot_zvbmrn.pdf"
ressource_7.save


# 67,68,69,70
ressource_8 = Ressource.create(title: "PCH", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès de des services de la Prestation de Compensation du Handicap (PCH)", solution_ids: "67,68,69,70",)
ressource_8.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160068/ressources/PCH/Notice_PCH_rdpkxw.pdf"
ressource_8.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160075/ressources/PCH/FORMULAIRE_PCH_fjyqba.pdf"
ressource_8.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160072/ressources/PCH/certificat_medical_zuvql6.pdf"
ressource_8.remote_model_2_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160069/ressources/PCH/GUIDE_FORMULAIRE_jpnk1d.pdf"
ressource_8.save


# SECURITE SOCIALE
ressource_9 = Ressource.create(title: "Sécurité sociale", description: "Retrouvez, ici, les ressources pour conduire une demande de financement de la Sécurité sociale", financer: "SECURITE SOCIALE")
ressource_9.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160066/ressources/Securite_sociale/Notice_Securite_Sociale_yxkudk.pdf"
ressource_9.save

# 44,45,46,47,48  + NOM
ressource_10 = Ressource.create(title: "CaisseRetraitePrincipale_CAMIEG", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite principale", solution_ids: "44,45,46,47,48", acteur: "CAMIEG")
ressource_10.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160061/ressources/Caisse_retraite_principale/CAMIEG/FORMULAIRE_CAMIEG.pdf"
ressource_10.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160061/ressources/Caisse_retraite_principale/CAMIEG/FORMULAIRE_CAMIEG.pdf"
ressource_10.save
ressource_11 = Ressource.create(title: "CaisseRetraitePrincipale_CARCDSF", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite principale", solution_ids: "3,6,9,10,13,14,17,20,23,24,27,28", acteur: "CARCDSF")
ressource_11.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160059/ressources/Caisse_retraite_principale/CARCDSF/Notice_CARCDSF.pdf"
ressource_11.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160060/ressources/Caisse_retraite_principale/CARCDSF/FORMULAIRE_CARCDSF.pdf"
ressource_11.save
ressource_12 = Ressource.create(title: "CaisseRetraitePrincipale_CNRACL", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite principale", solution_ids: "3,6,9,10,13,14,17,20,23,24,27,28", acteur: "CNRACL")
ressource_12.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160069/ressources/Caisse_retraite_principale/CNRACL/Notice_CNRACL_ujp5ly.pdf"
ressource_12.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160062/ressources/Caisse_retraite_principale/CNRACL/FORMULAIRE_CNRACL_esezsj.pdf"
ressource_12.save
ressource_13 = Ressource.create(title: "CaisseRetraitePrincipale_CNAV", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite principale", solution_ids: "3,6,9,10,13,14,17,20,23,24,27,28", acteur: "CNAV")
ressource_13.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160060/ressources/Caisse_retraite_principale/CNAV/Notice_CNAV_lpawfu.pdf"
ressource_13.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160062/ressources/Caisse_retraite_principale/CNAV/FORMULAIRE_CNAV_hyrjkx.pdf"
ressource_13.save
ressource_14 = Ressource.create(title: "CaisseRetraitePrincipale_CNRACL", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite principale", solution_ids: "3,6,9,10,13,14,17,20,23,24,27,28", acteur: "CNRACL")
ressource_14.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160069/ressources/Caisse_retraite_principale/CNRACL/Notice_CNRACL_ujp5ly.pdf"
ressource_14.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160062/ressources/Caisse_retraite_principale/CNRACL/FORMULAIRE_CNRACL_esezsj.pdf"
ressource_14.save
ressource_15 = Ressource.create(title: "CaisseRetraitePrincipale_RSI", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite principale", solution_ids: "3,6,9,10,13,14,17,20,23,24,27,28", acteur: "RSI")
ressource_15.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160062/ressources/Caisse_retraite_principale/SSI/Notice_SSI_pplfkw.pdf"
ressource_15.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160062/ressources/Caisse_retraite_principale/SSI/FORMULAIRE_RSI_ux9yyn.pdf"
ressource_15.save



# MUTUELLE  + NOM
ressource_16 = Ressource.create(title: "Mutuelle_ALLIANZ", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "ALLIANZ")
ressource_16.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160053/ressources/Mutuelle/ALLIANZ/Notice_ALLIANZ_rngdab.pdf"
ressource_16.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160053/ressources/Mutuelle/ALLIANZ/Modele_lettre_ALLIANZ_kx6nob.pdf"
ressource_16.save
ressource_17 = Ressource.create(title: "Mutuelle_AMPLI", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "AMPLI")
ressource_17.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160054/ressources/Mutuelle/AMPLI/Notice_AMPLI_d6dblv.pdf"
ressource_17.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160053/ressources/Mutuelle/AMPLI/Modele_lettre_AMPLI_wjtq2l.pdf"
ressource_17.save
ressource_18 = Ressource.create(title: "Mutuelle_MACIF", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "MACIF")
ressource_18.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160055/ressources/Mutuelle/MACIF/Notice_MACIF_oczu3g.pdf"
ressource_18.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160054/ressources/Mutuelle/MACIF/Modele_lettre_MACIF_trfigk.pdf"
ressource_18.save
ressource_19 = Ressource.create(title: "Mutuelle_MEDICIS", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "MEDICIS")
ressource_19.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160055/ressources/Mutuelle/MEDICIS/Notice_MEDICIS_fjsc81.pdf"
ressource_19.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160055/ressources/Mutuelle/MEDICIS/Modele_lettre_MEDICIS_essp95.pdf"
ressource_19.save
ressource_20 = Ressource.create(title: "Mutuelle_MGP SANTE", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "MGP SANTE")
ressource_20.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160054/ressources/Mutuelle/MGP_SANTE/Notice_MGP_SANTE_ivx8zi.pdf"
ressource_20.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160053/ressources/Mutuelle/MGP_SANTE/Modele_lettre_MGP_SANTE_v6f08l.pdf"
ressource_20.save
ressource_21 = Ressource.create(title: "Mutuelle_MUTUELLE BLEUE", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "MUTUELLE BLEUE")
ressource_21.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160052/ressources/Mutuelle/MUTUELLE_BLEUE/Modele_mail_MUTUELLE_BLEUE_hkceab.pdf"
ressource_21.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160052/ressources/Mutuelle/MUTUELLE_BLEUE/Modele_mail_MUTUELLE_BLEUE_hkceab.pdf"
ressource_21.save
ressource_22 = Ressource.create(title: "Mutuelle_MUTUELLE FAMILIALE", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "MUTUELLE FAMILIALE")
ressource_22.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160053/ressources/Mutuelle/MUTUELLE_FAMILIALE/Notice_MUTUELLE_FAMILIALE_calbqv.pdf"
ressource_22.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160052/ressources/Mutuelle/MUTUELLE_FAMILIALE/Formulaire_MUTUELLE_FAMILIALE_bkv6dd.pdf"
ressource_22.save
ressource_23 = Ressource.create(title: "Mutuelle_MALAKOFF_MEDERIC", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "MEDERIC")
ressource_23.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160057/ressources/Mutuelle/Notice_MALAKOFF_MEDERIC_mutuelle_mw3sru.pdf"
ressource_23.save
ressource_24 = Ressource.create(title: "Mutuelle_APIVIA", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "APIVIA")
ressource_24.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160054/ressources/Mutuelle/Notice_APIVIA_m2p9ws.pdf"
ressource_24.save
ressource_25 = Ressource.create(title: "Mutuelle_DYNALIS", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "DYNALIS")
ressource_25.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160054/ressources/Mutuelle/Notice_DYNALIS_shy5mq.pdf"
ressource_25.save
ressource_26 = Ressource.create(title: "Mutuelle_APRIL", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "APRIL")
ressource_26.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160052/ressources/Mutuelle/Notice_APRIL_t98qnj.pdf"
ressource_26.save
ressource_27 = Ressource.create(title: "Mutuelle_AUTRE", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une mutuelle", financer: "MUTUELLE", acteur: "AUTRE")
ressource_27.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160051/ressources/Mutuelle/Notice_MUTUELLE_AUTRE_ldq58e.pdf"
ressource_27.save


# 61 + NOM
ressource_28 = Ressource.create(title: "CaisseRetraiteComplementaire_AG2R", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite complémentaire", solution_ids: "61", acteur: "AG2R")
ressource_28.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160043/ressources/Caisse_retraite_complementaire/AG2R/Notice_AG2R_sntyqe.pdf"
ressource_28.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160041/ressources/Caisse_retraite_complementaire/AG2R/FORMULAIRE_AG2R_pkdtmp.pdf"
ressource_28.save

ressource_29 = Ressource.create(title: "CaisseRetraiteComplementaire_B2V", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite complémentaire", solution_ids: "61", acteur: "B2V")
ressource_29.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160036/ressources/Caisse_retraite_complementaire/B2V/Notice_B2V_kbfbwh.pdf"
ressource_29.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160036/ressources/Caisse_retraite_complementaire/B2V/Modele_lettre_B2V_wsr0pi.pdf"
ressource_29.save

ressource_30 = Ressource.create(title: "CaisseRetraiteComplementaire_HUMANIS", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite complémentaire", solution_ids: "61", acteur: "HUMANIS")
ressource_30.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160040/ressources/Caisse_retraite_complementaire/HUMANIS/Notice_HUMANIS_nsqthh.pdf"
ressource_30.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160034/ressources/Caisse_retraite_complementaire/HUMANIS/FORMULAIRE_HUMANIS_nm04oo.pdf"
ressource_30.save

ressource_31 = Ressource.create(title: "CaisseRetraiteComplementaire_IRP AUTO", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite complémentaire", solution_ids: "61", acteur: "IRP AUTO")
ressource_31.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160038/ressources/Caisse_retraite_complementaire/IRP_AUTO/Notice_IRP_AUTO_h7aqfe.pdf"
ressource_31.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160040/ressources/Caisse_retraite_complementaire/IRP_AUTO/FORMULAIRE_IRP_AUTO_ddyiqc.pdf"
ressource_31.save

ressource_32 = Ressource.create(title: "CaisseRetraiteComplementaire_LOURMEL", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite complémentaire", solution_ids: "61", acteur: "LOURMEL")
ressource_32.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160034/ressources/Caisse_retraite_complementaire/LOURMEL/Notice_LOURMEL_br2cei.pdf"
ressource_32.remote_formulary_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160036/ressources/Caisse_retraite_complementaire/LOURMEL/FORMULAIRE_LOURMEL_bbgvp5.pdf"
ressource_32.save

ressource_33 = Ressource.create(title: "CaisseRetraiteComplementaire_IRCANTEC", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite complémentaire", solution_ids: "61", acteur: "IRCANTEC")
ressource_33.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160036/ressources/Caisse_retraite_complementaire/Notice_IRCANTEC_ecrvof.pdf"
ressource_33.save

ressource_34 = Ressource.create(title: "CaisseRetraiteComplementaire_AUTRE", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite complémentaire", solution_ids: "61", acteur: "AUTRE")
ressource_34.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160036/ressources/Caisse_retraite_complementaire/Notice_CAISSE_RETRAITE_COMPLEMENTAIRE_AUTRE_dfrj7d.pdf"
ressource_34.save

ressource_35 = Ressource.create(title: "CaisseRetraiteComplementaire_MALAKOFF MEDERIC", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite complémentaire", solution_ids: "61", acteur: "MALAKOFF MEDERIC")
ressource_35.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160035/ressources/Caisse_retraite_complementaire/Notice_MALAKOFF_MEDERIC_i70ipa.pdf"
ressource_35.save

ressource_36 = Ressource.create(title: "CaisseRetraiteComplementaire_KLESIA", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite complémentaire", solution_ids: "61", acteur: "KLESIA")
ressource_36.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160035/ressources/Caisse_retraite_complementaire/Notice_KLESIA_ez4fkw.pdf"
ressource_36.save

ressource_37 = Ressource.create(title: "CaisseRetraiteComplementaire_PRO BTP fomnnu", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'une Caisse de retraite complémentaire", solution_ids: "61", acteur: "PRO BTP fomnnu")
ressource_37.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160034/ressources/Caisse_retraite_complementaire/Notice_PRO_BTP_fomnnu.pdf"
ressource_37.save


# 49,50,51,52,53,54,55,56,57,58,59 + NOM

ressource_38 = Ressource.create(title: "BailleurSocial_INLI QWACIO", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "INLI QWACIO")
ressource_38.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160051/ressources/Bailleur_parc_social/Notice_INLI_QWACIO_nmgaad.pdf"
ressource_38.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_38.save
ressource_39 = Ressource.create(title: "BailleurSocial_OSICA", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "OSICA")
ressource_39.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160051/ressources/Bailleur_parc_social/Notice_OSICA_mdarqw.pdf"
ressource_39.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_39.save
ressource_40 = Ressource.create(title: "BailleurSocial_OPH LHAY LES ROSES", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "OPH LHAY LES ROSES")
ressource_40.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160051/ressources/Bailleur_parc_social/Notice_OPH_LHAY_LES_ROSES_ftyakx.pdf"
ressource_40.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_40.save

ressource_41 = Ressource.create(title: "BailleurSocial_OPH IVRY", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "OPH IVRY")
ressource_41.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Notice_OPH_IVRY_vbxe3y.pdf"
ressource_41.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_41.save

ressource_42 = Ressource.create(title: "BailleurSocial_OPH VITRY", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "OPH VITRY")
ressource_42.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Notice_OPH_VITRY_ctwxzm.pdf"
ressource_42.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_42.save

ressource_43 = Ressource.create(title: "BailleurSocial_LOGIAL OPH", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "LOGIAL OPH")
ressource_43.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160049/ressources/Bailleur_parc_social/Notice_LOGIAL_OPH_phxuq7.pdf"
ressource_43.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_43.save
ressource_44 = Ressource.create(title: "BailleurSocial_IDF HABITAT", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "IDF HABITAT")
ressource_44.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160049/ressources/Bailleur_parc_social/Notice_IDF_HABITAT_a0rw2m.pdf"
ressource_44.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_44.save
ressource_45 = Ressource.create(title: "BailleurSocial_AUTRE", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "AUTRE")
ressource_45.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160048/ressources/Bailleur_parc_social/Notice_BAILLEUR_AUTRE_xyc10d.pdf"
ressource_45.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_45.save
ressource_46 = Ressource.create(title: "BailleurSocial_ICF HABITAT", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "ICF HABITAT")
ressource_46.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160048/ressources/Bailleur_parc_social/Notice_ICF_HABITAT_qns07o.pdf"
ressource_46.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_46.save
ressource_47 = Ressource.create(title: "BailleurSocial_SIEMP", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "SIEMP")
ressource_47.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160047/ressources/Bailleur_parc_social/Notice_SIEMP_yu4oi6.pdf"
ressource_47.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_47.save
ressource_48 = Ressource.create(title: "BailleurSocial_LA SEMISE", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "LA SEMISE")
ressource_48.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160047/ressources/Bailleur_parc_social/Notice_LA_SEMISE_cvsegu.pdf"
ressource_48.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_48.save
ressource_49 = Ressource.create(title: "BailleurSocial_PARIS HABITAT", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "PARIS HABITAT")
ressource_49.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160047/ressources/Bailleur_parc_social/Notice_PARIS_HABITAT_adkikz.pdf"
ressource_49.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_49.save
ressource_50 = Ressource.create(title: "BailleurSocial_OPH VILLEJUIF", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "OPH VILLEJUIF")
ressource_50.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160046/ressources/Bailleur_parc_social/Notice_OPH_VILLEJUIF_lga3go.pdf"
ressource_50.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_50.save
ressource_51 = Ressource.create(title: "BailleurSocial_RESIDENCE LE LOGEMENT DES FONCTIONNAIRRES", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "RESIDENCE LE LOGEMENT DES FONCTIONNAIRRES")
ressource_51.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160046/ressources/Bailleur_parc_social/Notice_RESIDENCE_LE_LOGEMENT_DES_FONCTIONNAIRRES_cbdpre.pdf"
ressource_51.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_51.save
ressource_52 = Ressource.create(title: "BailleurSocial_OPALY", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "OPALY")
ressource_52.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160046/ressources/Bailleur_parc_social/Notice_OPALY_sjxqlj.pdf"
ressource_52.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_52.save
ressource_53 = Ressource.create(title: "BailleurSocial_FOYER SOLEIL", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "FOYER SOLEIL")
ressource_53.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160045/ressources/Bailleur_parc_social/Notice_FOYER_SOLEIL_rhhp5v.pdf"
ressource_53.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_53.save

ressource_54 = Ressource.create(title: "BailleurSocial_CDC HABITAT", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "CDC HABITAT")
ressource_54.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160044/ressources/Bailleur_parc_social/Notice_CDC_HABITAT_jfvawv.pdf"
ressource_54.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_54.save
ressource_55 = Ressource.create(title: "BailleurSocial_FRANCE HABITATION", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "FRANCE HABITATION")
ressource_55.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160043/ressources/Bailleur_parc_social/Notice_FRANCE_HABITATION_ctim4j.pdf"
ressource_55.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_55.save
ressource_56 = Ressource.create(title: "BailleurSocial_MAISONS ALFORT HABITAT", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "MAISONS ALFORT HABITAT")
ressource_56.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160043/ressources/Bailleur_parc_social/Notice_MAISONS_ALFORT_HABITAT_nkapiz.pdf"
ressource_56.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_56.save
ressource_57 = Ressource.create(title: "BailleurSocial_KREMLIN BICETRE HABITAT", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "KREMLIN BICETRE HABITAT")
ressource_57.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160043/ressources/Bailleur_parc_social/Notice_KREMLIN_BICETRE_HABITAT_a2czqt.pdf"
ressource_57.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_57.save
ressource_58 = Ressource.create(title: "BailleurSocial_BATIGERE", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "BATIGERE")
ressource_58.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160042/ressources/Bailleur_parc_social/Notice_BATIGERE_lfdudg.pdf"
ressource_58.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_58.save
ressource_59 = Ressource.create(title: "BailleurSocial_DOMNIS", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "DOMNIS")
ressource_59.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160041/ressources/Bailleur_parc_social/Notice_DOMNIS_yvrjih.pdf"
ressource_59.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_59.save

ressource_60 = Ressource.create(title: "BailleurSocial_I3F", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "I3F")
ressource_60.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160041/ressources/Bailleur_parc_social/Notice_I3F_jc8srk.pdf"
ressource_60.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_60.save

ressource_61 = Ressource.create(title: "BailleurSocial_VALOPHIS HABITAT", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "VALOPHIS HABITAT")
ressource_61.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160040/ressources/Bailleur_parc_social/Notice_VALOPHIS_HABITAT_itq3zr.pdf"
ressource_61.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_61.save
ressource_62 = Ressource.create(title: "BailleurSocial_ANTIN RESIDENCES", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "ANTIN RESIDENCES")
ressource_62.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160039/ressources/Bailleur_parc_social/Notice_ANTIN_RESIDENCES_cysodt.pdf"
ressource_62.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_62.save
ressource_63 = Ressource.create(title: "BailleurSocial_RATP HABITAT", description: "Retrouvez, ici, les ressources pour conduire une demande de financement auprès d'un bailleur social", solution_ids: "49,50,51,52,53,54,55,56,57,58,59", acteur: "RATP HABITAT")
ressource_63.remote_notice_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160038/ressources/Bailleur_parc_social/Notice_RATP_HABITAT_ukmcby.pdf"
ressource_63.remote_model_1_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1560160050/ressources/Bailleur_parc_social/Modele_demande_autorisation_bailleur_aimx8f.pdf"
ressource_63.save


p "Ressources created"
p "Create Advisor"

  advisor = User.create(last_name: "Charet", first_name: "Marine", phone: "998877866", advisor: true, client: false, admin: false, email: "bienvenue@financermonautonomie.fr", password:"fma011")
  advisor.remote_avatar_url = "https://res.cloudinary.com/financermonautonomie/image/upload/v1561901450/Belavie/Marine_CHARRET_j4j2yv.png"
  advisor.save

  Framework.create(user: advisor, logo: "https://res.cloudinary.com/financermonautonomie/image/upload/v1560410625/Belavie/calendly_pbazdl.png", url: "https://calendly.com/event_types/user/me", title: "calendly", schedule_url: "https://calendly.com/adrienfma/1er-rdv-telephonique")
  Framework.create(user: advisor, logo: nil, title: "intercom", schedule_url: "https://app.intercom.io/a/apps/pfhokn92/inbox/inbox/")
p "Create Admin"

  User.create(last_name: "Euphrasie", first_name: "Adrien", phone: "998877866", avatar: nil, advisor: false, client: false, admin: true, email: "contact@bel-avie.com", password:"fma010")


p "create Message"

  Message.create(unread: 0, url: "https://app.intercom.io/a/apps/pfhokn92/inbox/inbox/all/")

p "create formulary"

  form = Formulary.new
  form.set_a_new_form(Faker::Name.first_name)
  form.visitor = Visitor.create(user_ip: "::1")
  form.project = Project.create()
  form.save
  project = form.project

  form2 = Formulary.new
  form2.set_a_new_form(Faker::Name.first_name)
  form2.project = project
  form2.save

p "Formulary created"

p "Create a Beneficaire"

  bene = User.create(first_name: form.first_name, last_name: Faker::Name.last_name, phone: "0786019942", client: true, email: "donatien@avemcreation.com", password: "password")
  UserProject.create(user: bene, project: project, client: true)
  UserProject.create(user: advisor, project: project)

p "create formulary"

  form_3 = Formulary.new
  form_3.set_a_new_form(Faker::Name.first_name)
  form_3.visitor = Visitor.create(user_ip: "::2")
  form_3.project = Project.create()
  form_3.save
  project2 = form_3.project

  form_4 = Formulary.new
  form_4.set_a_new_form(Faker::Name.first_name)
  form_4.project = project2
  form_4.save

p "Formulary created"

p "Create a Beneficaire"

  bene2 = User.create(first_name: form_3.first_name, last_name: Faker::Name.last_name, phone: "0786019942", client: true, email: "test2@mail.com", password: "password")
  UserProject.create(user: bene2, project: project2, client: true)
  UserProject.create(user: advisor, project: project2)



p "create formulary"

  form_5 = Formulary.new
  form_5.set_a_new_form(Faker::Name.first_name)
  form_5.visitor = Visitor.create(user_ip: "::4")
  form_5.project = Project.create()
  form_5.save
  project3 = form_5.project

  form_6 = Formulary.new
  form_6.set_a_new_form(Faker::Name.first_name)
  form_6.project = project3
  form_6.save

p "Formulary created"

p "Create a Beneficaire"

  bene3 = User.create(first_name: form_5.first_name, last_name: Faker::Name.last_name, phone: "0786019942", client: true, email: "test3@mail.com", password: "password")
  UserProject.create(user: bene3, project: project3, client: true)
  UserProject.create(user: advisor, project: project3)

p "create formulary"

  form_7 = Formulary.new
  form_7.set_a_new_form(Faker::Name.first_name)
  form_7.visitor = Visitor.create(user_ip: "::2")
  form_7.project = Project.create()
  form_7.save
  project4 = form_7.project

  form_8 = Formulary.new
  form_8.set_a_new_form(Faker::Name.first_name)
  form_8.project = project4
  form_8.save

p "Formulary created"

p "Create a Beneficaire"

  bene4 = User.create(first_name: form_7.first_name, last_name: Faker::Name.last_name, phone: "0786019942", client: true, email: "test4@mail.com", password: "password")
  UserProject.create(user: bene4, project: project4, client: true)
  UserProject.create(user: advisor, project: project4)


p "create formulary"

  form_9 = Formulary.new
  form_9.set_a_new_form(Faker::Name.first_name)
  form_9.visitor = Visitor.create(user_ip: "::2")
  form_9.project = Project.create()
  form_9.save
  project5 = form_9.project

  form_10 = Formulary.new
  form_10.set_a_new_form(Faker::Name.first_name)
  form_10.project = project5
  form_10.save

p "Formulary created"

p "Create a Beneficaire"

  bene5 = User.create(first_name: form_9.first_name, last_name: Faker::Name.last_name, phone: "0786019942", client: true, email: "test5@mail.com", password: "password")
  UserProject.create(user: bene5, project: project5, client: true)
  UserProject.create(user: advisor, project: project5)

p "create formulary"

  form_11 = Formulary.new
  form_11.set_a_new_form(Faker::Name.first_name)
  form_11.visitor = Visitor.create(user_ip: "::2")
  form_11.project = Project.create()
  form_11.save
  project6 = form_11.project

  form_12 = Formulary.new
  form_12.set_a_new_form(Faker::Name.first_name)
  form_12.project = project6
  form_12.save

p "Formulary created"

p "Create a Beneficaire"

  bene6 = User.create(first_name: form_11.first_name, last_name: Faker::Name.last_name, phone: "0786019942", client: true, email: "test6@mail.com", password: "password")
  UserProject.create(user: bene6, project: project6, client: true)
  UserProject.create(user: advisor, project: project6)





