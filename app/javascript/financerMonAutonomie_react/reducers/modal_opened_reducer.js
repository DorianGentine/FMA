import { SHOW_DOCUMENT, CLOSE_MODAL } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case SHOW_DOCUMENT: {
      return true;
    }
    case CLOSE_MODAL: {
      return false;
    }
    default: {
      return state;
    }
  }
}