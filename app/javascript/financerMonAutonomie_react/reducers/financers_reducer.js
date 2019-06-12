import { FETCH_FINANCERS } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_FINANCERS: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
