  // external modules
  import React from 'react';
  import ReactDOM from 'react-dom';
  import { Provider } from 'react-redux';
  import { createStore, combineReducers, applyMiddleware } from 'redux';
  import logger from 'redux-logger';
  import reduxPromise from 'redux-promise';
  import { BrowserRouter as Router, Route, Redirect, Switch } from 'react-router-dom';
  import { createBrowserHistory as history } from 'history';

  // internal modules
  import App from './components/app';
  // import '../assets/stylesheets/messagerie.scss';

  // State and reducers
  import apiReducer from './reducers/api_reducer';

  // const identityReducer = (state = null) => state;

const app = document.getElementById('app')
if(app){
  const user = JSON.parse(app.dataset.user)
  const project = JSON.parse(app.dataset.project)
  const urlAPI = `/api/v1/users/${user.id}/projects/${project.id}`;

  const rootUrl = `/mon_espace/${user.id}`
  const routeUrl = rootUrl + "/:menu_nav" + "/:menu_volet"
  const rootRedirect = rootUrl + "/projet/1"

  const identityReducer = (state = null) => state;

  const initialState = {
    rootUrl: rootUrl,
    urlAPI: urlAPI,
    // menu: ['projet', 'compte', 'alertes',],
    api: {
      beneficiaire: JSON.parse(app.dataset.user),
      project: JSON.parse(app.dataset.project),
      fma_team: JSON.parse(app.dataset.fma_team),
      solutions: JSON.parse(app.dataset.solutions),
    },
  };

  const reducers = combineReducers({
    rootUrl: identityReducer,
    urlAPI: identityReducer,
    // menu: identityReducer,
    api: apiReducer,
  });

  // Middlewares
  const middlewares = applyMiddleware(reduxPromise, logger);
  const store = createStore(reducers, initialState, middlewares);

// render an instance of the component in the DOM
  ReactDOM.render(
    <Provider store={store}>
        <Router history={history}>
          <Switch>
            <Route path={routeUrl} component={App} />
            <Redirect from={rootUrl} to={rootRedirect} />
          </Switch>
        </Router>
    </Provider>,
    app
  );
}
