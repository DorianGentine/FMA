export const FETCH_API = 'FETCH_API';
export const FETCH_FORM = 'FETCH_FORM';

export function fetchAPI(url) {
  const promise = fetch(url).then(r => r.json());

  return {
    type: FETCH_API,
    payload: promise
  };
}

export function fetchFORM(url) {
  const promise = fetch(url).then(r => r.json());
  console.log("promise", promise)

  return {
    type: FETCH_FORM,
    payload: promise
  };
}
