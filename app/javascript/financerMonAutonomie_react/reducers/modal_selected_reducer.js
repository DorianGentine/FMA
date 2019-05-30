import { SHOW_DOCUMENT, CLOSE_MODAL } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case SHOW_DOCUMENT: {
      return action.payload;
    }
    case CLOSE_MODAL: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
