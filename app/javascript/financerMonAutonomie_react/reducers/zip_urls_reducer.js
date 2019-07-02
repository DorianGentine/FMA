import { FETCH_ZIP_URL } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_ZIP_URL: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
