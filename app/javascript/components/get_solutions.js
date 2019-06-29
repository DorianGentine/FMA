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
    if(true){
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
        hintCorps.innerHTML = "Le financeurs auxquels vous pouvez potentiellement être éligible ne peut être associé au financeur <strong>La caisse des retraites</strong> en raison de..."
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

    const descFinanceur = document.createElement("p")
    descFinanceur.innerText = "Aide à domicile | Paris"

    const barre = document.createElement("hr")
    barre.classList = "ligne-horizontale"

    const votreSolution = document.createElement("p")
    votreSolution.style = "font-size: 18px"
    votreSolution.innerText = "VOTRE SOLUTION"

    const lienSite = document.createElement("a")
    lienSite.classList = "black"
    lienSite.innerText = "Site du financeur"

    // div.appendChild(numFinanceur)
    div.appendChild(nomFinanceur)
    div.appendChild(descFinanceur)
    div.appendChild(barre)
    div.appendChild(votreSolution)

    if (solution.financer.answer) {
      addAndswer(div, solution.financer.answer)
    }

    solution.answers.forEach((answer) => {
      addAndswer(div, answer.content)
    })

    div.appendChild(lienSite)
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
    await stickyCta(data)

    for (var i = 0; i < data.solutions.length; i++) {
      setSolution(data.solutions[i], i)
    }
  }

  getSolutions()
}
