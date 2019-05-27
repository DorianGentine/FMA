import { FETCH_PROJET } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_PROJET: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
