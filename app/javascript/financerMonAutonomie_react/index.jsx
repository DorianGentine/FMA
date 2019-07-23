  // external modules
  import React from 'react';
  import ReactDOM from 'react-dom';
  import { Provider } from 'react-redux';
  import { createStore, combineReducers, applyMiddleware } from 'redux';
  import logger from 'redux-logger';
  import reduxPromise from 'redux-promise';
  import { BrowserRouter as Router, Route, Redirect, Switch } from 'react-router-dom';
  import { createBrowserHistory as history } from 'history';
  import { reducer as formReducer } from 'redux-form';

  import { fetchAPI } from './actions';

  // internal modules
  import App from './components/app';
  // import '../assets/stylesheets/messagerie.scss';

  // State and reducers
  import apiReducer from './reducers/api_reducer';
  import clientsReducer from './reducers/clients_reducer';
  import conseillersReducer from './reducers/conseillers_reducer';
  import currentApiReducer from './reducers/current_api_reducer';
  import financersReducer from './reducers/financers_reducer';
  import formResultsReducer from './reducers/form_results_reducer';
  import formularyIdReducer from './reducers/formulary_id_reducer';
  import isMobileReducer from './reducers/is_mobile_reducer';
  import menuMobileOpenedReducer from './reducers/menu_mobile_opened_reducer';
  import modalOpenedReducer from './reducers/modal_opened_reducer';
  import modalPdfReducer from './reducers/modal_pdf_reducer';
  import modalReponsesReducer from './reducers/modal_reponses_reducer';
  import modalSelectedReducer from './reducers/modal_selected_reducer';
  import projectIdReducer from './reducers/project_id_reducer';
  import projectReducer from './reducers/project_reducer';
  import ratingsReducer from './reducers/ratings_reducer';
  import ressourcesReducer from './reducers/ressources_reducer';
  import selectedClientsReducer from './reducers/selected_clients_reducer';
  import stateCalendlyReducer from './reducers/state_calendly_reducer';
  import zipUrlsReducer from './reducers/zip_urls_reducer';

const app = document.getElementById('app')
if(app){
  // const project_id = app.dataset.projectid
  const user_id = app.dataset.userid
  const current_user_id = app.dataset.currentuserid
  const urlAPI = `/api/v1/users/${user_id}`;
  let otherUser = false
  if(current_user_id != user_id){
    otherUser = true
  }

  const rootUrl = `/mon_espace/${user_id}`

  const identityReducer = (state = null) => state;

  const initialState = {
    api: {},
    clients: null,
    conseillers: null,
    current_user_id: current_user_id,
    current_api: null,
    financers: null,
    formulary_id: {},
    formResults: null,
    isMobile: false,
    menuMobileOpened: false,
    modal_opened: false,
    modal_pdf: null,
    modal_reponses: null,
    modal_selected: null,
    otherUser: otherUser,
    project: null,
    project_id: null,
    ratings: null,
    ressources: null,
    rootUrl: rootUrl,
    selectedClients: "tous",
    stateCalendly: false,
    urlAPI: urlAPI,
    user_id: user_id,
    zip_urls: null,
  };

  const reducers = combineReducers({
    api: apiReducer,
    clients: clientsReducer,
    conseillers: conseillersReducer,
    current_api: currentApiReducer,
    current_user_id: identityReducer,
    financers: financersReducer,
    form: formReducer,
    formResults: formResultsReducer,
    formulary_id: formularyIdReducer,
    isMobile: isMobileReducer,
    menuMobileOpened: menuMobileOpenedReducer,
    modal_opened: modalOpenedReducer,
    modal_pdf: modalPdfReducer,
    modal_reponses: modalReponsesReducer,
    modal_selected: modalSelectedReducer,
    otherUser: identityReducer,
    project: projectReducer,
    project_id: projectIdReducer,
    ratings: ratingsReducer,
    ressources: ressourcesReducer,
    rootUrl: identityReducer,
    selectedClients: selectedClientsReducer,
    stateCalendly: stateCalendlyReducer,
    urlAPI: identityReducer,
    user_id: identityReducer,
    zip_urls: zipUrlsReducer,
  });


  // Middlewares
  const middlewares = applyMiddleware(reduxPromise, logger);
  const store = createStore(reducers, initialState, middlewares);

// render an instance of the component in the DOM
  ReactDOM.render(
    <Provider store={store}>
        <Router history={history}>
          <Switch>
            <Route path={`${rootUrl}/:menu_nav/:menu_volet`} component={App} />
            <Route path={`${rootUrl}/:menu_nav`} component={App} />
            <Redirect from={rootUrl} to={`${rootUrl}/projet`} />
            <Redirect from={`${rootUrl}/compte`} to={`${rootUrl}/compte/identite`} />
          </Switch>
        </Router>
    </Provider>,
    app
  );
}
