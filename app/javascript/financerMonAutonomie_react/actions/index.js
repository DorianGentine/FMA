export const CHANGE_BENEFICIAIRE = 'CHANGE_BENEFICIAIRE';
export const CLOSE_MODAL = 'CLOSE_MODAL';
export const DISPLAY_CALENDLY = 'DISPLAY_CALENDLY';
export const FETCH_API = 'FETCH_API';
export const FETCH_CLIENTS = 'FETCH_CLIENTS';
export const FETCH_FINANCERS = 'FETCH_FINANCERS';
export const FETCH_FORM = 'FETCH_FORM';
export const FETCH_PROJET = 'FETCH_PROJET';
export const FETCH_RESSOURCES = 'FETCH_RESSOURCES';
export const POST_COMPTE = 'POST_COMPTE';
export const POST_FORM = 'POST_FORM';
export const SHOW_CLIENT = 'SHOW_CLIENT';
export const SHOW_DOCUMENT = 'SHOW_DOCUMENT';
export const SHOW_FINANCER = 'SHOW_FINANCER';
export const SHOW_REPONSES = 'SHOW_REPONSES';
export const SHOW_RESSOURCE = 'SHOW_RESSOURCE';
export const VALIDATE_STEP = 'VALIDATE_STEP';

export function changeBeneficiaireForm(event) {
  let beneficiaireActif = {}
  if( typeof event == "number"){
    beneficiaireActif = event
  }else{
    beneficiaireActif = event.target.dataset.benefIndex
  }

  return {
    type: CHANGE_BENEFICIAIRE,
    payload: beneficiaireActif
  };
}

export function closeModal() {
  return {
    type: CLOSE_MODAL,
    payload: null
  };
}

export function displayCalendly(stateCalendly) {
  let toggleCalendly
  if(stateCalendly === true){
    toggleCalendly = false
  }else{
    toggleCalendly = true
  }

  return {
    type: DISPLAY_CALENDLY,
    payload: toggleCalendly
  };
}

export function fetchAPI(url) {
  const promise = fetch(url).then(r => r.json());

  return {
    type: FETCH_API,
    payload: promise
  };
}

export function fetchClients(url) {
  const promise = fetch(url).then(r => r.json());

  return {
    type: FETCH_CLIENTS,
    payload: promise
  };
}

export function fetchFinancers(url) {
  const promise = fetch(url).then(r => r.json());

  return {
    type: FETCH_FINANCERS,
    payload: promise
  };
}

export function fetchFORM(url) {
  const promise = fetch(url).then(r => r.json());

  return {
    type: FETCH_FORM,
    payload: promise
  };
}

export function fetchPostCompte(url, body, method) {
  const request = fetch(url,
     {
      method: method,
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify(body)
    }).then(response => response.json())

  return {
    type: POST_COMPTE,
    payload: request
  };
}

export function fetchPostForm(url, body, method) {
  const request = fetch(url,
    {
      method: method,
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify(body)
    }).then(response => response.json())
    .then( () => {
        const btnValidation = document.getElementById('btn-validation-infos')
        btnValidation.style.display = "block"
        btnValidation.style.opacity = 1
        setTimeout(()=>{
        btnValidation.style.opacity = 0
        btnValidation.style.display = "none"
        }, 3000)
      }
    )

  return {
    type: POST_FORM,
    payload: request
  };
}

export function fetchProjet(url) {
  const promise = fetch(url)
  .then(r => r.json())

  return {
    type: FETCH_PROJET,
    payload: promise
  };
}

export function fetchRessources(url) {
  const promise = fetch(url).then(r => r.json());

  return {
    type: FETCH_RESSOURCES,
    payload: promise
  };
}

export function showDocument(doc) {
  const documentSelected = {
    modalActive: "showDoc",
    doc: doc,
  }

  return {
    type: SHOW_DOCUMENT,
    payload: documentSelected
  };
}

export function showFinancer(financer) {
  const financerSelected = {
    modalActive: "showFinancer",
    financer: financer,
  }

  return {
    type: SHOW_FINANCER,
    payload: financerSelected
  };
}

export function showClient(client) {
  const clientSelected = {
    modalActive: "showClient",
    client: client,
  }

  return {
    type: SHOW_CLIENT,
    payload: clientSelected
  };
}

export function showReponses(user, index) {
  const userSelected = {
    modalActive: "showReponses",
    user: user,
    index: index,
  }

  return {
    type: SHOW_REPONSES,
    payload: userSelected
  };
}

export function showRessource(ressource) {
  const ressourceSelected = {
    modalActive: "showRessource",
    ressource: ressource,
  }

  return {
    type: SHOW_RESSOURCE,
    payload: ressourceSelected
  };
}

export function validateStep(url, callback) {
  const request = fetch(url,
    {
      method: "PATCH",
    }).then(response => response.json())
    .then(callback)

  return {
    type: VALIDATE_STEP,
    payload: request
  };
}



