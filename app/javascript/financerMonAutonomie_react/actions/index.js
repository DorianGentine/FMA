export const FETCH_API = 'FETCH_API';
export const FETCH_FORM = 'FETCH_FORM';
export const POST_FORM = 'POST_FORM';
export const VALIDATE_STEP = 'VALIDATE_STEP';
export const CHANGE_BENEFICIAIRE = 'CHANGE_BENEFICIAIRE';
export const FETCH_PROJET = 'FETCH_PROJET';
export const SHOW_DOCUMENT = 'SHOW_DOCUMENT';
export const CLOSE_MODAL = 'CLOSE_MODAL';
export const DISPLAY_CALENDLY = 'DISPLAY_CALENDLY';

export function fetchAPI(url) {
  const promise = fetch(url).then(r => r.json());

  return {
    type: FETCH_API,
    payload: promise
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

export function fetchFORM(url) {
  const promise = fetch(url).then(r => r.json());

  return {
    type: FETCH_FORM,
    payload: promise
  };
}

export function fetchPostCompte(url, body) {
  const request = fetch(url,
     {
      method: "PATCH",
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



