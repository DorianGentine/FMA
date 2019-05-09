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
    logoFinanceur.style = "height: 60px; width: 60px"

    const nomFinanceur = document.createElement("h4")
    // div.acceptCharset = "UTF-8"
    nomFinanceur.classList = "margin-top-15"
    nomFinanceur.innerText = solution.financer.name

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
    const formularyId = financeursPotentielsId.dataset.formularyid
    let response = await fetch(`/api/v1/formularies/${formularyId}`)
    let data = await response.json()

    for (var i = 0; i < data.solutions.length; i++) {
      setSolution(data.solutions[i])
    }
  }

  getSolutions()
}
