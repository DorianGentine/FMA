  // external modules
  import React from 'react';
  import ReactDOM from 'react-dom';
  import { Provider } from 'react-redux';
  import { createStore, combineReducers, applyMiddleware } from 'redux';
  import logger from 'redux-logger';
  import reduxPromise from 'redux-promise';
  import { BrowserRouter as Router, Route, Redirect, Switch } from 'react-router-dom';
  import { createBrowserHistory as history } from 'history';

  import { fetchAPI } from './actions';

  // internal modules
  import App from './components/app';
  // import '../assets/stylesheets/messagerie.scss';

  // State and reducers
  import apiReducer from './reducers/api_reducer';

  // const identityReducer = (state = null) => state;

const app = document.getElementById('app')
if(app){
  const user_id = app.dataset.userid
  const project_id = app.dataset.projectid
  const urlAPI = `/api/v1/users/${user_id}/projects/${project_id}`;

  const rootUrl = `/mon_espace/${user_id}`

  const identityReducer = (state = null) => state;

  const initialState = {
    rootUrl: rootUrl,
    urlAPI: urlAPI,
    api: {},
  };

  const reducers = combineReducers({
    rootUrl: identityReducer,
    urlAPI: identityReducer,
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
            <Route path={`${rootUrl}/:menu_nav`} component={App} />
            <Route path={`${rootUrl}/compte/:menu_volet`} component={App} />
            <Redirect from={rootUrl} to={`${rootUrl}/projet`} />
            <Redirect from={`${rootUrl}/compte`} to={`${rootUrl}/compte/identite`} />
          </Switch>
        </Router>
    </Provider>,
    app
  );
}
