import { FETCH_RESSOURCES } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_RESSOURCES: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
