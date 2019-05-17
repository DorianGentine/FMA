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
  import formResultsReducer from './reducers/form_results_reducer';

  // const identityReducer = (state = null) => state;

const app = document.getElementById('app')
if(app){
  const user_id = app.dataset.userid
  const project_id = app.dataset.projectid
  const formulary_id = app.dataset.formularyid
  const urlAPI = `/api/v1/users/${user_id}`;
  const urlForm = `/api/v1/projects/${project_id}/formularies/${formulary_id}/edit`;

  const rootUrl = `/mon_espace/${user_id}`

  const identityReducer = (state = null) => state;

  const initialState = {
    rootUrl: rootUrl,
    urlAPI: urlAPI,
    urlForm: urlForm,
    api: {},
    formResults: [],
    form: formReducer,
  };

  const reducers = combineReducers({
    rootUrl: identityReducer,
    urlAPI: identityReducer,
    urlForm: identityReducer,
    api: apiReducer,
    formResults: formResultsReducer,
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
