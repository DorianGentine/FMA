import { SHOW_DOCUMENT } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case SHOW_DOCUMENT: {
      return true;
    }
    default: {
      return state;
    }
  }
}
