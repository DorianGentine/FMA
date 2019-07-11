import renderInitiale from "../components/render_initiales"
import stickyCta from "../components/sticky_cta"

const financeursPotentielsId = document.getElementById('financeurs-potentiels')

if(financeursPotentielsId){
  const setSolution = (solution, index) => {
    const div = document.createElement('div')
    div.acceptCharset = "UTF-8"
    div.classList = `margin-top-60 ${index === 0 ? "blue-gray-background" : ""}`
    div.style = `padding: 30px 40px;`

    const nomFinanceur = document.createElement("div")
    nomFinanceur.classList = "flex space-between"

    const titreFinanceur = document.createElement("h2")
    titreFinanceur.classList = "blue relative"
    titreFinanceur.innerText = solution.financer.name.toUpperCase()

    let hintFinanceur = null
    if(solution.financer.unmatched){
      const showHint = () => {
        hintText.classList.toggle("d-none")
      }
      const hintText = document.createElement("div")
      hintText.classList = "red-background white d-none absolute"
      hintText.style = "padding: 20px; right: 0; top: 32px; width: 400px; border-radius: 3px;"
        const hintTitre = document.createElement("h4")
        hintTitre.classList = "white"
        hintTitre.innerText = "Informations supplémentaires:"
        const hintCorps = document.createElement("p")
        hintCorps.innerHTML = "<ul>" + solution.financer.unmatched + "</ul> Sachez que ces financeurs ne peuvent être cumulés. Vous aurez donc à faire un choix entre l'un d'entre eux si vous les sollicitez."
      hintText.appendChild(hintTitre)
      hintText.appendChild(hintCorps)

      hintFinanceur = document.createElement("div")
      hintFinanceur.classList = "icon-alert relative pointer"
      hintFinanceur.addEventListener("click", ()=>{showHint()})

      hintFinanceur.appendChild(hintText)

    }

    nomFinanceur.appendChild(titreFinanceur)
    if(hintFinanceur != null){
      nomFinanceur.appendChild(hintFinanceur)
    }

    // const nomFinanceur = document.createElement("h2")
    // nomFinanceur.classList = "margin-top-30"
    // nomFinanceur.innerText = solution.financer.name.toUpperCase()

    const changeText = (id) => {
      const chevronTarget = document.getElementById(`chevron${id}`)
      if(chevronTarget.classList.value === "fas fa-chevron-down"){
        chevronTarget.classList.add('fa-chevron-up')
        chevronTarget.classList.remove('fa-chevron-down')
      }else{
        chevronTarget.classList.add('fa-chevron-down')
        chevronTarget.classList.remove('fa-chevron-up')
      }
    }

    const descFinanceur = document.createElement("div")
      const titreDescFinanceur = document.createElement("div")
      titreDescFinanceur.classList = "flex space-between margin-top-15 pointer"
      titreDescFinanceur.setAttribute("data-toggle", "collapse")
      titreDescFinanceur.setAttribute("data-target", `#collapseDescription${solution.financer.id}`)
      titreDescFinanceur.setAttribute("aria-expanded", "false")
      titreDescFinanceur.setAttribute("aria-controls", `collapseDescription${solution.financer.id}`)
      titreDescFinanceur.addEventListener("click", ()=>{changeText(solution.financer.id)})
        const textTitreDescFinanceur = document.createElement("p")
        textTitreDescFinanceur.classList = "black"
        textTitreDescFinanceur.innerText = "Description de l'organisme"
        textTitreDescFinanceur.style.fontSize = "0.75em"
        titreDescFinanceur.appendChild(textTitreDescFinanceur)

        const chevron = document.createElement("div")
        chevron.classList = "blue"
        chevron.style.fontSize = "0.75em"
          const iconChevron = document.createElement("i")
          iconChevron.id = `chevron${solution.financer.id}`
          iconChevron.classList = "fas fa-chevron-down"
          chevron.appendChild(iconChevron)
        titreDescFinanceur.appendChild(chevron)


      const textDescFinanceur = document.createElement("p")
      textDescFinanceur.classList = "collapse"
      textDescFinanceur.id = `collapseDescription${solution.financer.id}`
      textDescFinanceur.innerText = solution.financer.description
      textDescFinanceur.style.fontSize = "0.75em"


    descFinanceur.appendChild(titreDescFinanceur)
    descFinanceur.appendChild(textDescFinanceur)

    const barre = document.createElement("hr")
    barre.classList = "ligne-horizontale"

    const votreSolution = document.createElement("p")
    votreSolution.style = "font-size: 18px"
    votreSolution.innerText = "VOTRE SOLUTION"

    const lienSite = document.createElement("a")
    lienSite.classList = "black"
    lienSite.innerText = "Site du financeur"
    if (solution.financer.web) {
      lienSite.setAttribute('href', solution.financer.web)
    } else {
      lienSite.setAttribute('href', solution.web)
    }
    lienSite.setAttribute("target", "_blank")

    div.appendChild(nomFinanceur)
    if(solution.financer.description){
      div.appendChild(descFinanceur)
    }
    div.appendChild(barre)
    div.appendChild(votreSolution)

    if (solution.financer.answer) {
      addAndswer(div, solution.financer.answer)
    }

    solution.answers.forEach((answer) => {
      addAndswer(div, answer.content)
    })

    if(solution.financer.web || solution.web){
      div.appendChild(lienSite)
    }
    financeursPotentielsId.appendChild(div)
  }

  const addAndswer = (div, answer) => {
    const descriptionFinanceur = document.createElement("p")
    descriptionFinanceur.classList = "margin-top-15 margin-bottom-30"
    descriptionFinanceur.innerText = answer
    div.appendChild(descriptionFinanceur)
  }

  const getSolutions = async function () {
    const visitorId = financeursPotentielsId.dataset.visitorid
    let response = await fetch(`/api/v1/visitors/${visitorId}/analyze`)
    let data = await response.json()


    if(data.solutions.length > 0){
      document.getElementById('loading-analyse').style.display = "none";
      document.getElementById('loading-analyse').classList.remove("flex");
      document.getElementById('blue-CTA').classList.remove('d-none')
      stickyCta(data)
      for (var i = 0; i < data.solutions.length; i++) {
        setSolution(data.solutions[i], i)
      }
    }else{
      // document.getElementById('loading-analyse').style.display = "block";
      // document.getElementById('loading-analyse').classList.add("flex");
      document.getElementById('loading-analyse').innerHTML = "Malheureusement, aucun financeur ne vous correspond 😭"
    }
  }

  getSolutions()
}
