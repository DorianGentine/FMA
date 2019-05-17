import { FETCH_FORM } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_FORM: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
