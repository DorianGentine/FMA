import renderInitiale from "../components/render_initiales"
import stickyCta from "../components/sticky_cta"

const financeursPotentielsId = document.getElementById('financeurs-potentiels')

if(financeursPotentielsId){
  const setSolution = (solution, index) => {
    const div = document.createElement('div')
    div.acceptCharset = "UTF-8"
    div.classList = `margin-top-60 ${index === 0 ? "blue-gray-background" : ""}`
    div.style = `padding: 30px 40px;`
    div.id = `${index === 0 ? "TESTONS" : ""}`

    const numFinanceur = document.createElement("h4")
    numFinanceur.classList = "blue"
    numFinanceur.style = "font-weight: normal"
    numFinanceur.innerText = `FINANCEUR N°${index + 1}`

    const nomFinanceur = document.createElement("h2")
    nomFinanceur.classList = "margin-top-30"
    nomFinanceur.innerText = solution.financer.name.toUpperCase()

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

    div.appendChild(numFinanceur)
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
