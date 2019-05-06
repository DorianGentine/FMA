import { initialState } from '../index';

// console.log(urlAPI)


export const FETCH_API = 'FETCH_API';

export function fetchAPI(url) {
  const promise = fetch(url).then(r => r.json());

  return {
    type: FETCH_API,
    payload: promise // Will be resolved by redux-promise
  };
}
