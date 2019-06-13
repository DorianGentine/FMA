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
  import financersReducer from './reducers/financers_reducer';
  import formResultsReducer from './reducers/form_results_reducer';
  import formularyIdReducer from './reducers/formulary_id_reducer';
  import modalOpenedReducer from './reducers/modal_opened_reducer';
  import modalReponsesReducer from './reducers/modal_reponses_reducer';
  import modalSelectedReducer from './reducers/modal_selected_reducer';
  import projectIdReducer from './reducers/project_id_reducer';
  import projectReducer from './reducers/project_reducer';
  import ressourcesReducer from './reducers/ressources_reducer';
  import stateCalendlyReducer from './reducers/state_calendly_reducer';

const app = document.getElementById('app')
if(app){
  // const project_id = app.dataset.projectid
  const user_id = app.dataset.userid
  const urlAPI = `/api/v1/users/${user_id}`;

  const rootUrl = `/mon_espace/${user_id}`

  const identityReducer = (state = null) => state;

  const initialState = {
    api: {},
    clients: null,
    financers: null,
    formulary_id: {},
    formResults: [],
    modal_opened: false,
    modal_reponses: null,
    modal_selected: null,
    project: null,
    project_id: null,
    ressources: null,
    rootUrl: rootUrl,
    stateCalendly: false,
    urlAPI: urlAPI,
    user_id: user_id,
  };

  const reducers = combineReducers({
    api: apiReducer,
    clients: clientsReducer,
    financers: financersReducer,
    form: formReducer,
    formResults: formResultsReducer,
    formulary_id: formularyIdReducer,
    modal_opened: modalOpenedReducer,
    modal_reponses: modalReponsesReducer,
    modal_selected: modalSelectedReducer,
    project: projectReducer,
    project_id: projectIdReducer,
    ressources: ressourcesReducer,
    rootUrl: identityReducer,
    stateCalendly: stateCalendlyReducer,
    urlAPI: identityReducer,
    user_id: identityReducer,
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
