export const FETCH_API = 'FETCH_API';
export const FETCH_FORM = 'FETCH_FORM';
export const POST_FORM = 'POST_FORM';

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

export function fetchPostForm(url, body) {
  const request = fetch(url,
    {
    method: "PATCH",
    headers: { 'Content-Type': 'application/json'},
    body: JSON.stringify(body)
    }).then(response => response.json())
  console.log('send request', request)
  return {
    type: POST_FORM,
    payload: request
  };
}
