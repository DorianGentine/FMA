import { FETCH_CONSEILLERS } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_CONSEILLERS: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
