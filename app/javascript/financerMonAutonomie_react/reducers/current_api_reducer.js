import { FETCH_CURRENT_API } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_CURRENT_API: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
