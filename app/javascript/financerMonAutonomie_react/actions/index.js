// import fetchActionCreator from 'fetch-action-creator';

export const CHANGE_BENEFICIAIRE = 'CHANGE_BENEFICIAIRE';
export const CLOSE_MODAL = 'CLOSE_MODAL';
export const CLOSE_MODAL_PDF = 'CLOSE_MODAL_PDF';
export const DISPLAY_CALENDLY = 'DISPLAY_CALENDLY';
export const FETCH_API = 'FETCH_API';
export const FETCH_CLIENTS = 'FETCH_CLIENTS';
export const FETCH_CONSEILLERS = 'FETCH_CONSEILLERS';
export const FETCH_CURRENT_API = 'FETCH_CURRENT_API';
export const FETCH_FINANCERS = 'FETCH_FINANCERS';
export const FETCH_FORM = 'FETCH_FORM';
export const FETCH_MODAL_REPONSES = 'FETCH_MODAL_REPONSES';
export const FETCH_PROJET = 'FETCH_PROJET';
export const FETCH_RATINGS = 'FETCH_RATINGS';
export const FETCH_RESSOURCES = 'FETCH_RESSOURCES';
export const FETCH_ZIP_URL = 'FETCH_ZIP_URL';
export const IS_MOBILE = 'IS_MOBILE';
export const MENU_MOBILE_OPENED = 'MENU_MOBILE_OPENED';
export const MODAL_PDF = 'MODAL_PDF';
export const POST_COMPTE = 'POST_COMPTE';
export const POST_FORM = 'POST_FORM';
export const SELECT_CLIENTS = 'SELECT_CLIENTS';
export const SHOW_CLIENT = 'SHOW_CLIENT';
export const SHOW_CLIENT_CONSEILLER = 'SHOW_CLIENT_CONSEILLER';
export const SHOW_CREATE_RESSOURCE = 'SHOW_CREATE_RESSOURCE';
export const SHOW_DEMANDE = 'SHOW_DEMANDE';
export const SHOW_DEMANDE_ANSWER = 'SHOW_DEMANDE_ANSWER';
export const SHOW_EVALUATION = 'SHOW_EVALUATION';
export const SHOW_DOCUMENT = 'SHOW_DOCUMENT';
export const SHOW_FINANCER = 'SHOW_FINANCER';
export const SHOW_NOTES = 'SHOW_NOTES';
export const SHOW_REPONSES = 'SHOW_REPONSES';
export const SHOW_RESSOURCE = 'SHOW_RESSOURCE';
export const VALIDATE_STEP = 'VALIDATE_STEP';

export function changeBeneficiaireForm(event) {
  let beneficiaireActif = {}
  if( typeof event == "number"){
    beneficiaireActif = event
  }else if(event === null){
    beneficiaireActif = event
  }else{
    beneficiaireActif = event.target.dataset.benefIndex
  }

  return {
    type: CHANGE_BENEFICIAIRE,
    payload: beneficiaireActif
  };}

export function closeModal() {
  return {
    type: CLOSE_MODAL,
    payload: null
  };}

export function closeModalPdf() {
  return {
    type: CLOSE_MODAL_PDF,
    payload: null
  };}

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
  };}

export async function fetchAPI(url) {
  let response = await fetch(url)
  let promise
  if(response.ok){
    promise = await response.json();
  }else{
    console.error('fetchAPI passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_API,
    payload: promise
  };}

export async function fetchClients(url) {
  let response = await fetch(url)
  let promise
  if(response.ok){
    promise = await response.json();
  } else {
    console.error('fetchClients ne passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_CLIENTS,
    payload: promise
  };}

export async function fetchConseillers(url) {
  let response = await fetch(url)
  let promise
  if(response.ok){
    promise = await response.json();
  } else {
    console.error('fetchConseillers ne passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_CONSEILLERS,
    payload: promise
  };}

export async function fetchCurrentApi(url) {
  let response = await fetch(url)
  let promise
  if(response.ok){
    promise = await response.json();
  } else {
    console.error('fetchCurrentApi ne passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_CURRENT_API,
    payload: promise
  };}

export async function fetchFinancers(url) {
  let response = await fetch(url)
  let promise
  if(response.ok){
    promise = await response.json();
  } else {
    console.error('fetchFinancers ne passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_FINANCERS,
    payload: promise
  };}

export async function fetchFORM(url) {
  let response = await fetch(url)
  let promise
  if(response.ok){
    promise = await response.json();
  } else {
    console.error('fetchForm ne passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_FORM,
    payload: promise
  };}

export async function fetchModalReponses(url) {
  let response = await fetch(url)
  let promise
  if(response.ok){
    promise = await response.json();
  }else{
    console.error('fetchModalReponses ne passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_MODAL_REPONSES,
    payload: promise
  };}

export function fetchPostCompte(url, body, method, callback) {
  let request
  if(body != null){
    request = fetch(url,
    {
      method: method,
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify(body)
    })
    .then(response => response.json())
    .then(callback)
  }else if(body === null){
    request = fetch(url,
    {
      method: method,
      headers: { 'Content-Type': 'application/json'},
    })
    .then(callback)
  }

  return {
    type: POST_COMPTE,
    payload: body
  };}

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
  };}

export async function fetchProjet(url) {
  let response = await fetch(url)
  let promise
  if(response.ok){
    promise = await response.json();
  } else {
    console.error('fetchProjet ne passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_PROJET,
    payload: promise
  };}

export async function fetchRatings(projectId) {
  let response = await fetch(`/api/v1/projects/${projectId}/ratings/new`)
  let promise
  if(response.ok){
    promise = await response.json();
  } else {
    console.error('fetchRatingss passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_RATINGS,
    payload: promise
  };}

export async function fetchRessources(url) {
  let response = await fetch(url)
  let promise
  if(response.ok){
    promise = await response.json();
  } else {
    console.error('fetchProjet ne passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_RESSOURCES,
    payload: promise
  };}

export async function fetchZipUrl(url) {
  let response = await fetch(url)
  let promise
  if(response.ok){
    promise = await response.json();
  } else {
    console.error('fetchZipUrl passe pas : ', response)
    promise = null
  }

  return {
    type: FETCH_ZIP_URL,
    payload: promise
  };}

export function checkIsMobile() {
  console.log('MOBILE')
  let promise = true

  return {
    type: IS_MOBILE,
    payload: promise
  };}

export function menuMobileOpened(state) {
  console.log('Opened?', state)
  let promise = state

  return {
    type: MENU_MOBILE_OPENED,
    payload: promise
  };}

export function selectClients(clientsSelected) {
  if (clientsSelected === "") {
    clientsSelected = "tous"
  }
  return {
    type: SELECT_CLIENTS,
    payload: clientsSelected
  };}

export function showClient(client) {
  const clientSelected = {
    modalActive: "showClient",
    client: client,
  }

  return {
    type: SHOW_CLIENT,
    payload: clientSelected
  };}

export function showClientConseiller(advisor) {
  const advisorSelected = {
    modalActive: "showClientConseiller",
    advisor: advisor,
  }

  return {
    type: SHOW_CLIENT_CONSEILLER,
    payload: advisorSelected
  };}

export function showCreateRessource() {
  const ressourceSelected = {
    modalActive: "showCreateRessource",
  }

  return {
    type: SHOW_CREATE_RESSOURCE,
    payload: ressourceSelected
  };}

export function showDemande(client) {
  const clientSelected = {
    modalActive: "showDemande",
    client: client,
  }

  return {
    type: SHOW_DEMANDE,
    payload: clientSelected
  };}

export function showDemandeAnswer(demande, infoProject) {
  const demandeSelected = {
    modalActive: "showDemandeAnswer",
    demande: demande,
    infoProject: infoProject,
  }

  return {
    type: SHOW_DEMANDE_ANSWER,
    payload: demandeSelected
  };}

export function showDocument(doc) {
  const documentSelected = {
    modalActive: "showDoc",
    doc: doc,
  }

  return {
    type: SHOW_DOCUMENT,
    payload: documentSelected
  };}

export function showEvaluation(project) {
  const projectSelected = {
    modalActive: "showEvaluation",
    project: project,
  }

  return {
    type: SHOW_EVALUATION,
    payload: projectSelected
  };}

export function showFinancer(financer) {
  const financerSelected = {
    modalActive: "showFinancer",
    financer: financer,
  }

  return {
    type: SHOW_FINANCER,
    payload: financerSelected
  };}

export function showModalPdf(url) {
  return {
    type: MODAL_PDF,
    payload: url
  };}

export function showNotes(notes) {
  const notesSelected = {
    modalActive: "showNotes",
    notes: notes,
  }

  return {
    type: SHOW_NOTES,
    payload: notesSelected
  };}

export function showReponses(user, index) {
  const userSelected = {
    modalActive: "showReponses",
    user: user,
    index: index,
  }

  return {
    type: SHOW_REPONSES,
    payload: userSelected
  };}

export function showRessource(ressource) {
  const ressourceSelected = {
    modalActive: "showRessource",
    ressource: ressource,
  }

  return {
    type: SHOW_RESSOURCE,
    payload: ressourceSelected
  };}

export function validateStep(url, callback, body) {
  let request
  if(body != undefined){
    request = fetch(url,
    {
      method: "PATCH",
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify(body)
    })
    .then(response => response.json())
    .then(callback)
  }else if(body === undefined){
    request = fetch(url,
    {
      method: "PATCH",
    })
    .then(response => response.json())
    .then(callback)
  }

  return {
    type: VALIDATE_STEP,
    payload: request
  };}
