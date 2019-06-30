import { FETCH_RATINGS } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_RATINGS: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
