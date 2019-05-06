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

const initialState = {
  api: {
    beneficiaire: {
      client: true,
    },
  },
};


const reducers = combineReducers({
  api: apiReducer,
});

// Middlewares
const middlewares = applyMiddleware(reduxPromise, logger);
const store = createStore(reducers, initialState, middlewares);

// render an instance of the component in the DOM
const app = document.getElementById('app')
if(app){
  const urlAPI = `/api/v1/users/${app.dataset.user_id}/projects/${app.dataset.project_id}`;
  ReactDOM.render(
    <Provider store={store}>
        <App urlAPI={urlAPI} />
    </Provider>,
    app
  );
}
