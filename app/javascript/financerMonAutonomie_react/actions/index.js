export const FETCH_API = 'FETCH_API';
export const FETCH_FORM = 'FETCH_FORM';
export const POST_FORM = 'POST_FORM';
export const VALIDATE_STEP = 'VALIDATE_STEP';
export const CHANGE_BENEFICIAIRE = 'CHANGE_BENEFICIAIRE';

export function fetchAPI(url) {
  const promise = fetch(url).then(r => r.json());

  return {
    type: FETCH_API,
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

export function fetchPostForm(url, body) {
  const request = fetch(url,
    {
      method: "PATCH",
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify(body)
    }).then(response => response.json())

  return {
    type: POST_FORM,
    payload: request
  };
}

export function validateStep(url) {
  const request = fetch(url,
    {
      method: "PATCH",
    }).then(response => response.json())

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
