  // external modules
  import React from 'react';
  import ReactDOM from 'react-dom';
  import { Provider } from 'react-redux';
  import { createStore, combineReducers, applyMiddleware } from 'redux';
  import logger from 'redux-logger';
  import reduxPromise from 'redux-promise';

  // internal modules
  import App from './components/app';
  // import '../assets/stylesheets/messagerie.scss';

  // State and reducers
  import apiReducer from './reducers/api_reducer';

  // const identityReducer = (state = null) => state;

const app = document.getElementById('app')
if(app){
  const initialState = {
    api: {
      beneficiaire: JSON.parse(app.dataset.user),
      fma_team: JSON.parse(app.dataset.fma_team)
    }
  };

  const reducers = combineReducers({
    api: apiReducer,
  });

  // Middlewares
  const middlewares = applyMiddleware(reduxPromise, logger);
  const store = createStore(reducers, initialState, middlewares);

// render an instance of the component in the DOM
  const user = JSON.parse(app.dataset.user)
  const project = JSON.parse(app.dataset.project)
  const urlAPI = `/api/v1/users/${user.id}/projects/${project.id}`;
  ReactDOM.render(
    <Provider store={store}>
        <App urlAPI={urlAPI} />
    </Provider>,
    app
  );
}
