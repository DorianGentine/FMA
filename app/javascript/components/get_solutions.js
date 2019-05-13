import renderInitiale from "../components/render_initiales"

const financeursPotentielsId = document.getElementById('financeurs-potentiels')

if(financeursPotentielsId){
  const setSolution = (solution) => {
    const div = document.createElement('div')
    div.acceptCharset = "UTF-8"
    div.classList = "margin-top-60"
    // div.id = `edit_formulary_${form.dataset.id}`

    const logoFinanceur = document.createElement("div")
    // div.acceptCharset = "UTF-8"
    logoFinanceur.classList = "logo-financeur"
    logoFinanceur.style = "height: 60px; width: 60px;"
    if(solution.financer.logo == null){
      logoFinanceur.innerText = renderInitiale(solution.financer.name)
    } else {
      logoFinanceur.style.backgroundImage = `url(${solution.financer.logo})`
    }

    const nomFinanceur = document.createElement("h4")
    // div.acceptCharset = "UTF-8"
    nomFinanceur.classList = "margin-top-15"
    nomFinanceur.innerText = solution.financer.name.toUpperCase()

    const descriptionFinanceur = document.createElement("p")
    // div.acceptCharset = "UTF-8"
    descriptionFinanceur.classList = "margin-top-15"
    descriptionFinanceur.innerText = solution.financer.description

    div.appendChild(logoFinanceur)
    div.appendChild(nomFinanceur)
    div.appendChild(descriptionFinanceur)


    financeursPotentielsId.appendChild(div)
  }

  const getSolutions = async function () {
    const visitorId = financeursPotentielsId.dataset.visitorid
    let response = await fetch(`/api/v1/visitors/${visitorId}/analyze`)
    let data = await response.json()

    for (var i = 0; i < data.solutions.length; i++) {
      setSolution(data.solutions[i])
    }
  }

  getSolutions()
}
