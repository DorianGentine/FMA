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
  import formularyIdReducer from './reducers/formulary_id_reducer';
  import projectIdReducer from './reducers/project_id_reducer';
  import projectReducer from './reducers/project_reducer';

const app = document.getElementById('app')
if(app){
  // const project_id = app.dataset.projectid
  const user_id = app.dataset.userid
  const urlAPI = `/api/v1/users/${user_id}`;

  const rootUrl = `/mon_espace/${user_id}`

  const identityReducer = (state = null) => state;

  const initialState = {
    api: {},
    formulary_id: {},
    formResults: [],
    project: {},
    project_id: {},
    rootUrl: rootUrl,
    urlAPI: urlAPI,
  };

  const reducers = combineReducers({
    api: apiReducer,
    form: formReducer,
    formResults: formResultsReducer,
    formulary_id: formularyIdReducer,
    project: projectReducer,
    project_id: projectIdReducer,
    rootUrl: identityReducer,
    urlAPI: identityReducer,
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
