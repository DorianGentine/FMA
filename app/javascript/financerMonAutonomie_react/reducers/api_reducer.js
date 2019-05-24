import { FETCH_API } from '../actions';
import { VALIDATE_STEP } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_API: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
