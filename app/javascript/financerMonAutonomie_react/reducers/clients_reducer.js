import { FETCH_CLIENTS } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_CLIENTS: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
